package ar.com.WareTech.GranDT.middleware.services;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Club;
import ar.com.WareTech.GranDT.middleware.entities.Player;
import ar.com.WareTech.GranDT.middleware.entities.PlayerPosition;
import ar.com.WareTech.GranDT.middleware.entities.PositionTeamWeek;

/**
 * @author Augusto
 *
 */
public class PlayersReader 
{
	/**
	 * @param args
	 * @throws Exception
	 */
	static public void main(
			String[] args
			)
		throws Exception
	{
		try
		{
			Database.getCurrentSession().beginTransaction();
			PlayersReader.load();
			Database.getCurrentSession().getTransaction().commit();
		}
		catch (Exception exception) 
		{
			exception.printStackTrace();
			Database.getCurrentSession().getTransaction().rollback();
		}
	}
	
	/**
	 * @throws Exception
	 */
	static public void load()
		throws Exception
	{
		BufferedReader bufferedReader = new BufferedReader(
				new FileReader(
						"e:/WareTech/GranDT/GranDT/data/GranDT_2012_Inicial_Jugadores.csv"
						)
				);
		String line = null;
		String[] playerLine = null;
		Player player;
		while((line = bufferedReader.readLine()) != null)
		{
			line = line.trim();
			System.out.println(line);
			
			if (line.length() == 0)
			{
				continue;
			}
			
			playerLine = line.split(",");
			
			player = new Player();
			player.setFirstname(playerLine[0].trim());
			player.setLastname(playerLine[1].trim());
			player.setClub(PlayersReader.getClubByName(playerLine[2].trim()));
			player.setPosition(PlayersReader.getPositionByName(playerLine[3].trim()));
			player.setValue(playerLine[4].trim());
			player.setSelected(Boolean.FALSE);
			
			Database.getCurrentSession().save(player);
		}
	}

	/**
	 * @param trim
	 * @return
	 */
	public static PlayerPosition getPositionByName(
			String playerPosition
			) 
	{
		Criteria playerPositionCriteria = Database.getCurrentSession().createCriteria(PlayerPosition.class);
		playerPositionCriteria.add(Expression.eq("name", playerPosition));
		
		return (PlayerPosition) playerPositionCriteria.uniqueResult();
	}

	/**
	 * @param trim
	 * @return
	 */
	public static Club getClubByName(
			String clubName
			) 
	{
		Criteria clubCriteria = Database.getCurrentSession().createCriteria(Club.class);
		clubCriteria.add(Expression.eq("name", clubName));
		
		return (Club) clubCriteria.uniqueResult();
	}
}

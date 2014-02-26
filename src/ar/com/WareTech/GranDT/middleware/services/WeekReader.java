package ar.com.WareTech.GranDT.middleware.services;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Club;
import ar.com.WareTech.GranDT.middleware.entities.Match;
import ar.com.WareTech.GranDT.middleware.entities.Team;
import ar.com.WareTech.GranDT.middleware.entities.Week;

/**
 * @author Augusto
 *
 */
public class WeekReader 
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
			WeekReader.load();
			Database.getCurrentSession().getTransaction().commit();
		}
		catch (Exception exception) 
		{
			exception.printStackTrace();
			Database.getCurrentSession().getTransaction().rollback();
		}
	}
	static public void load()
		throws Exception
	{
		int clubId = 1;
		Map clubMap = new HashMap();
		clubMap.put("All Boys", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Argentinos Juniors", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Arsenal", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Atlético Rafaela", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Banfield",  Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Belgrano de Córdoba", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Boca Juniors", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Colón", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Estudiantes de La Plata", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Godoy Cruz", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Independiente", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Lanús", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Newell’s Old Boys", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Olimpo de Bahía Blanca", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Racing", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("San Lorenzo", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("San Martín de San Juan", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Tigre", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Unión", Database.getCurrentSession().get(Club.class, new Long(clubId++)));
		clubMap.put("Vélez Sarsfield", Database.getCurrentSession().get(Club.class, new Long(clubId++)));

		BufferedReader bufferedReader = new BufferedReader(
				new FileReader(
						"D:/Temp/GranDTReader/GranDT_Apertura2011_Fixture.txt"
						)
				);
		String line = null;
		Week week = null;
		Match match;
		int weekNumber = 1;
		String[] clubs;
		while((line = bufferedReader.readLine()) != null)
		{
			line = line.trim();
			System.out.println(line);
			if (line.startsWith("Fecha"))
			{
				week = new Week();
				week.setNumber(new Integer(weekNumber++));
				Database.getCurrentSession().save(week);
				continue;
			}
			
			match = new Match();
			match.setWeek(week);
			clubs = line.split("-");
			match.setHomeClub((Club) clubMap.get(clubs[0].trim()));
			match.setAwayClub((Club) clubMap.get(clubs[1].trim()));
			Database.getCurrentSession().save(match);
		}
	}
}

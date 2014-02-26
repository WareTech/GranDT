package ar.com.WareTech.GranDT.test;

import java.io.RandomAccessFile;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Expression;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Match;
import ar.com.WareTech.GranDT.middleware.entities.Player;
import ar.com.WareTech.GranDT.middleware.entities.PlayerMatch;
import ar.com.WareTech.GranDT.middleware.entities.Week;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Load_week 
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
		Session session = Database.openSession();
		Transaction transaction = session.beginTransaction();

    	String lastname_firstname = null;
		try
    	{
	    	RandomAccessFile randomAccessFile = new RandomAccessFile(
	    			"data/2010_Apertura/fixture.txt",
	    			"r"
	    			);
	    	
	    	String line;
	    	StringTokenizer playerStringTokenizer;
	    	String lastname;
	    	String firstname;
	    	Week week = (Week) session.createCriteria(Week.class)
	    		.add(Expression.eq("number", new Integer(12)))
	    		.uniqueResult();
	    	List playerList;
	    	Player player;
	    	Match match = null;
	    	Iterator matchIterator;
	    	PlayerMatch playerMatch;
	    	String temp;
	    	// JUGADOR;PUNTAJE;VALLA INVICTA;GOL EN CONTRA;FIGURA;GOL;Gol Penal;GOL DE TL;PENAL ERRADO;PENAL ATAJADO;AMARILLA;ROJA
	    	while ((line = randomAccessFile.readLine()) != null)
	    	{
	    		line = line.trim();
	    		playerStringTokenizer = new StringTokenizer(line, ";");
	    		lastname_firstname = playerStringTokenizer.nextToken();
	    		lastname = lastname_firstname.split(",")[0].trim();
	    		firstname = lastname_firstname.split(",")[1].trim();
	    		playerList = session.createCriteria(Player.class)
	    			.add(Expression.eq("lastname", lastname))
	    			.add(Expression.eq("firstname", firstname))
	    			.list();
	    		
	    		if (playerList.size() == 0)
	    		{
	    			System.out.println("Player not found: " + lastname_firstname);
	    			continue;
	    		}
	    		
	    		if (playerList.size() > 1)
	    		{
	    			System.out.println("Too many players (" + playerList.size() + ") for: " + lastname_firstname);
	    			continue;
	    		}
	    		
	    		player = (Player) playerList.get(0);
	    		
	    		matchIterator = week.getMatchSet().iterator();
	    		while (matchIterator.hasNext())
	    		{
	    			match = (Match) matchIterator.next();
	    			if (match.getHomeClub().getId().equals(player.getClub().getId()))
	    			{
	    				break;
	    			}
	    			if (match.getAwayClub().getId().equals(player.getClub().getId()))
	    			{
	    				break;
	    			}
	    			match = null;
	    		}
	    		
	    		if (match == null)
	    		{
	    			System.out.println("Match for player not found: " + lastname_firstname);
	    			continue;
	    		}
	    		
	    		playerMatch = new PlayerMatch();
	    		playerMatch.setPlayer(player);
	    		playerMatch.setMatch(match);
	    		
	    		temp = playerStringTokenizer.nextToken().trim();
	    		if ("".equals(temp))
	    		{
	    			continue;
	    		}
    			playerMatch.setOlePoints(new Double(temp));

    			temp = playerStringTokenizer.nextToken().trim();
    			if (!"".equals(temp))
    			{
    	    		playerMatch.setCleanGoal(Boolean.TRUE);
    			}

	    		temp = playerStringTokenizer.nextToken().trim();
	    		if (!"".equals(temp))
	    		{
		    		playerMatch.setOwnGoals(new Integer(temp));
	    		}

	    		temp = playerStringTokenizer.nextToken().trim();
    			if (!"".equals(temp))
    			{
    	    		playerMatch.setMom(Boolean.TRUE);
    			}

	    		temp = playerStringTokenizer.nextToken().trim();
	    		if (!"".equals(temp))
	    		{
		    		playerMatch.setGoals(new Integer(temp));
	    		}

	    		temp = playerStringTokenizer.nextToken().trim();
	    		if (!"".equals(temp))
	    		{
		    		playerMatch.setPenaltyGoals(new Integer(temp));
	    		}

	    		temp = playerStringTokenizer.nextToken().trim();
	    		if (!"".equals(temp))
	    		{
		    		playerMatch.setFreeKickGoals(new Integer(temp));
	    		}

	    		temp = playerStringTokenizer.nextToken().trim();
	    		if (!"".equals(temp))
	    		{
		    		playerMatch.setMissedPenalties(new Integer(temp));
	    		}

	    		temp = playerStringTokenizer.nextToken().trim();
	    		if (!"".equals(temp))
	    		{
		    		playerMatch.setCachedPenalties(new Integer(temp));
	    		}

	    		temp = playerStringTokenizer.nextToken().trim();
    			if (!"".equals(temp))
    			{
    	    		playerMatch.setYellowCard(Boolean.TRUE);
    			}

    			if (playerStringTokenizer.hasMoreTokens())
    			{
		    		temp = playerStringTokenizer.nextToken().trim();
	    			if (!"".equals(temp))
	    			{
	    	    		playerMatch.setRedCard(Boolean.TRUE);
	    			}
    			}
    			
    			playerMatch.calculate();
    			
	    		session.save(playerMatch);
	    	}
	    	
	    	transaction.commit();
    	}
    	catch(Exception exception)
    	{
    		System.out.println(lastname_firstname);
    		exception.printStackTrace();
	    	transaction.rollback();
    	}
    	session.close();
    }
}

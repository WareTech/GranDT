package ar.com.WareTech.GranDT.test;

import java.io.RandomAccessFile;
import java.text.SimpleDateFormat;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Club;
import ar.com.WareTech.GranDT.middleware.entities.Match;
import ar.com.WareTech.GranDT.middleware.entities.Week;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Load_weeks 
{
	final static  String[] clubs = {
		"C.A. ALL BOYS", 
		"A.A. ARGENTINOS JRS.",
		"ARSENAL F.C.", 
		"C.A. BANFIELD", 
		"C.A. BOCA JRS.", 
		"C.A. COLON",
		"C. ESTUDIANTES DE L.P.",
		"C. DE G. Y ESGRIMA L.P.",
		"C. DEP. GODOY CRUZ A.T.",
		"C.A. HURACAN",
		"C.A. INDEPENDIENTE",
		"C.A. LANUS",
		"C.A. N.O. BOYS", 
		"C. OLIMPO (B. BLANCA)",
		"QUILMES A.C.", 		
		"RACING CLUB",
		"C.A. RIVER PLATE",		
		"C.A. SAN LORENZO DE A.",
		"C.A. TIGRE",
		"C.A. VELEZ SARSFIELD"
		};
	
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

		try
    	{
	    	RandomAccessFile randomAccessFile = new RandomAccessFile(
	    			"data/2010_Apertura/fixture.txt",
	    			"r"
	    			);
	    	
	    	String line;
	    	int weekCount = 0;
	    	String weekDate = null;
	    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yy");
	    	Match match;
	    	Week week = null;
	    	String clubName;
			Club club;
	    	while ((line = randomAccessFile.readLine()) != null)
	    	{
	    		line = line.trim();
	    		if (line.startsWith("Fecha:"))
	    		{
	    			week = new Week();
	    			week.setNumber(new Integer(weekCount++));
	    			session.save(week);
	    			System.out.println(">>> Week #" + week.getNumber());

	    			line = randomAccessFile.readLine();
	    			line = line.trim();
	    			weekDate = line;
	    			
	    			continue;
	    		}
	    		
	    		match = new Match();
	    		match.setWeek(week);
	    		match.setDate(simpleDateFormat.parse(weekDate));
	    		
	    		clubName = line.split("vs")[0].trim();
    			club = (Club) session.get(Club.class, new Long(getClubIndex(clubName)));
    			match.setHomeClub(club);
	
	    		clubName = line.split("vs")[1].trim();
    			club = (Club) session.get(Club.class, new Long(getClubIndex(clubName)));
    			match.setAwayClub(club);
	
	    		session.save(match);
    			System.out.println(match.getHomeClub() + " vs. " + match.getAwayClub() + " - " + match.getDate());
	    	}
	    	
	    	transaction.commit();
    	}
    	catch(Exception exception)
    	{
    		exception.printStackTrace();
	    	transaction.rollback();
    	}
    	session.close();
    }
    
    /**
     * @param clubName
     * @return
     */
    static int getClubIndex(
    		String clubName
    		)
    	throws Exception
    {
    	for (
    			int index = 0; 
    			index < clubs.length; 
    			index++
    			)
    	{
    		if (clubName.equals(clubs[index]))
    		{
    			return index + 1;
    		}
    	}
    	
    	throw new Exception("Club name not found: " + clubName);
    }
}

package ar.com.WareTech.GranDT.test;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Club;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Test_Club 
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

		List clubList = session.createCriteria(
				Club.class
				).list();
		
		System.out.println("Club count = " + clubList.size());
		
		Iterator clubIterator = clubList.iterator();
		while (clubIterator.hasNext()) 
		{
			Club club = (Club) clubIterator.next();
			System.out.print(club.getName());
			System.out.print(" (");
			System.out.print(club.getPlayerSet().size());
			System.out.print(")");
			System.out.println();
		}
		
		session.close();
    }
}

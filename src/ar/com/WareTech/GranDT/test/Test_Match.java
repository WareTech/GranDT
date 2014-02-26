package ar.com.WareTech.GranDT.test;

import org.hibernate.Session;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Week;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Test_Match 
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

		Week week = (Week) session.get(Week.class, new Long("1"));
		
		System.out.println(week);
		
		session.close();
    }
}

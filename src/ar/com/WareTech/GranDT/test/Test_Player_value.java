package ar.com.WareTech.GranDT.test;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Player;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Test_Player_value 
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

		List list = session.createQuery(
				"SELECT DISTINCT(value) FROM Player ORDER BY 1"
				).list();
		
		System.out.println(list);
		
		session.close();
    }
}

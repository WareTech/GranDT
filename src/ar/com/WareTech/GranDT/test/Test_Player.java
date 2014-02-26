package ar.com.WareTech.GranDT.test;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Player;
import ar.com.WareTech.GranDT.middleware.entities.Team;
import ar.com.WareTech.GranDT.middleware.entities.User;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Test_Player 
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

		List playerList = session.createCriteria(
				Player.class
				).list();
		
		System.out.println("Player count = " + playerList.size());
		
		Iterator playerIterator = playerList.iterator();
		while (playerIterator.hasNext()) 
		{
			Player player = (Player) playerIterator.next();
			System.out.print(player.getFirstname());
			System.out.print(" ");
			System.out.print(player.getLastname());
			System.out.print(" - ");
			System.out.print(player.getPosition().getName());
			System.out.print(" - ");
			System.out.print(player.getValue());
			System.out.print(" (");
			System.out.print(player.getClub().getName());
			System.out.print(")");
			System.out.println();
		}
		
		session.close();
    }
}

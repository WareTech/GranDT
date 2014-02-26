package ar.com.WareTech.GranDT.test;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Player;
import ar.com.WareTech.GranDT.middleware.entities.PlayerWeek;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Test_PlayerWeek 
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

		Player player = (Player) session.get(Player.class, new Long(1));
		
		Criteria playerWeekCriteria = session.createCriteria(PlayerWeek.class);
		//playerWeekCriteria.add(Expression.eq("week", match.getWeek()));
		playerWeekCriteria.add(Expression.eq("player.id", new Long(1)));
		List playerWeekList = playerWeekCriteria.list();
		System.out.println(playerWeekList);
		
		session.close();
    }
}

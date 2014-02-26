package ar.com.WareTech.GranDT.test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Match;
import ar.com.WareTech.GranDT.middleware.entities.Player;
import ar.com.WareTech.GranDT.middleware.entities.PlayerMatch;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Test_PlayerMatch 
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

		Match match = (Match) session.get(Match.class, new Long(88));
		System.out.println(match.getPlayerMatchSet());
		
//		System.out.println(
//				session.createCriteria(PlayerMatch.class)
//					.add(Property.forName("match").in(session.createCriteria(Match.class).list()))
//					.list()
////				session.createQuery(
////						"FROM PlayerMatch pm WHERE pm.player = :player"// AND pm.match IN (:matchList)"
////						)
////						.setParameter("player", new Long(1))
//////						.setParameterList("matchList", (List) session.createCriteria(Match.class).list())
////						.list()
//				);

		session.close();
    }
}

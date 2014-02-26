package ar.com.WareTech.GranDT.test;

import java.io.RandomAccessFile;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Expression;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Club;
import ar.com.WareTech.GranDT.middleware.entities.Match;
import ar.com.WareTech.GranDT.middleware.entities.Player;
import ar.com.WareTech.GranDT.middleware.entities.PlayerMatch;
import ar.com.WareTech.GranDT.middleware.entities.Team;
import ar.com.WareTech.GranDT.middleware.entities.Week;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Change_week 
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
		Database.getCurrentSession().beginTransaction();

		Iterator matchIterator = Database.getCurrentSession().createCriteria(Match.class).list().iterator();
		Match match;
		Club club;
		while(matchIterator.hasNext())
		{
			match = (Match) matchIterator.next();
			club = match.getHomeClub();
			match.setHomeClub(match.getAwayClub());
			match.setAwayClub(club);
			Database.getCurrentSession().save(match);
		}
		
		Database.getCurrentSession().getTransaction().commit();
    }
}

package ar.com.WareTech.GranDT.backend;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import ar.com.WareTech.GranDT.middleware.entities.Change;
import ar.com.WareTech.GranDT.middleware.entities.Player;
import ar.com.WareTech.GranDT.middleware.entities.Team;
import ar.com.WareTech.GranDT.middleware.entities.User;
import ar.com.WareTech.GranDT.middleware.entities.Week;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Database 
{
	protected static SessionFactory sessionFactory = null;
	protected static Configuration  configuration  = null;
	protected static Database       database       = new Database();
	
	/**
	 * 
	 */
	protected Database() 
    {
	}
	
	static 
    {
		try 
        {
			configuration = new Configuration();
			configuration.configure();
			sessionFactory = configuration.buildSessionFactory();
		} 
        catch (Exception exception) 
        {
			exception.printStackTrace();
		}
	}

	/**
	 * @return
	 */
	static public Session openSession() 
    {
		return sessionFactory.openSession();
	}

	/**
	 * @return
	 */
	static public Session getCurrentSession() 
    {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * @return
	 */
	static public Database getInstance() 
    {
		return Database.database;
	}

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
		Change change = new Change();
		change.setTeam((Team) Database.getCurrentSession().get(Team.class, new Long(60)));		
		change.setWeek((Week) Database.getCurrentSession().get(Week.class, new Long(139)));		
		change.setPlayerIn((Player) Database.getCurrentSession().get(Player.class, new Long(60)));		
		change.setPlayerOut((Player) Database.getCurrentSession().get(Player.class, new Long(80)));		
		change.setUser((User) Database.getCurrentSession().get(User.class, new Long(60)));		
		Database.getCurrentSession().save(change);
		Database.getCurrentSession().getTransaction().commit();
		
//		Session session = Database.openSession();
//
//		Iterator cupPhaseIterator = session.createCriteria(CupPhase.class).list().iterator();
//		CupPhase cupPhase = null;
//		while (cupPhaseIterator.hasNext())
//		{
//			cupPhase = (CupPhase) cupPhaseIterator.next();
//			System.out.println(
//					cupPhase.getName()
//					);
//			if (cupPhase.getNextPhase() != null)
//			{
//				System.out.println(
//						cupPhase.getNextPhase().getName()
//						);
//			}
//			
//			Iterator groupIterator = cupPhase.getGroupSet().iterator();
//			CupGroup group = null;
//			while (groupIterator.hasNext())
//			{
//				group = (CupGroup) groupIterator.next();
//				System.out.println(group.getName());
//
//				Iterator groupTeamIterator = group.getGroupTeamSet().iterator();
//				CupGroupTeam groupTeam = null;
//				while (groupTeamIterator.hasNext())
//				{
//					groupTeam = (CupGroupTeam) groupTeamIterator.next();
//					System.out.println(groupTeam.getTeam().getName());
//				}
//			}
//		}
		
//		List userList = session.createCriteria(
//				User.class
//				).list();
//		
//		Iterator userIterator = userList.iterator();
//		while (userIterator.hasNext()) 
//		{
//			User user = (User) userIterator.next();
//			System.out.print(user.getFirstname());
//			System.out.print(" ");
//			System.out.print(user.getLastname());
//			System.out.print(" (");
//			System.out.print(user.getUsername());
//			System.out.print("/");
//			System.out.print(user.getPassword());
//			System.out.print(")");
//			System.out.print(" - ");
//			System.out.print(user.getTeam().getName());
//			System.out.println();
//		}
//		
//		List teamList = session.createCriteria(
//				Team.class
//				).list();
//		
//		Iterator teamIterator = teamList.iterator();
//		while (teamIterator.hasNext()) 
//		{
//			Team team = (Team) teamIterator.next();
//			System.out.print(team.getName());
//			System.out.print(" - ");
//			System.out.print(team.getCategory());
//			System.out.print(" (");
//			System.out.print(team.getUser());
//			System.out.print(")");
//			System.out.println();
//		}
//		
//		Integer maxNumber = (Integer) session.createQuery(
//				"SELECT max(week.number) FROM Week week"
//			).uniqueResult();
//		
//		System.out.println(maxNumber);
		
//		Transaction transaction = session.beginTransaction();
	
//		Criteria criteria =  session.createCriteria(
//				Datebook.class
//				);
//		criteria.setFetchMode("datebookType", FetchMode.JOIN);
//		criteria.setFetchMode("company", FetchMode.JOIN);
//		criteria.setFetchMode("responsible", FetchMode.JOIN);
//		
//		List<Datebook> datebookList = (List<Datebook>) criteria.list();
//		
//		session.close();

//		System.out.println(datebookList.size());
    }
}

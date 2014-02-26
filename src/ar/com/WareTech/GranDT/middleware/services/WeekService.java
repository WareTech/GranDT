package ar.com.WareTech.GranDT.middleware.services;

import java.text.SimpleDateFormat;
import java.util.Date;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Week;


/**
 * @author Augusto
 *
 */
public class WeekService 
	extends Thread
{
	final static public SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy");
	
	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	public void run() 
	{
		try
		{
			while (true)
			{
				String weekOpen = (String) ApplicationContext.getInstance().get(ApplicationContext.WEEK_OPEN);
				if (weekOpen == null)
				{
					System.err.println("WEEK_OPEN NOT DEFINED");
					return;
				}
				
				Date today = new Date();
				
				Date dateOpen = simpleDateFormat.parse(weekOpen);
				if (dateOpen.before(today))
				{
					return;
				}
				
				String weekClose = (String) ApplicationContext.getInstance().get(ApplicationContext.WEEK_CLOSE);
				if (weekClose == null)
				{
					System.err.println("WEEK_CLOSE NOT DEFINED");
					return;
				}
				
				Date dateClose = simpleDateFormat.parse(weekClose);
				
				if (dateOpen.after(today))
				{
					Database.getCurrentSession().beginTransaction();
					Week week = (Week) Database.getCurrentSession().get(
							Week.class, 
							new Long((String) ApplicationContext.getInstance().get(ApplicationContext.CURRENT_WEEK))
							);
					if (week.getIsOpened().booleanValue())
					{
						return;
					}
					
					week = (Week) Database.getCurrentSession().get(
							Week.class, 
							new Long(week.getId().longValue() + 1)
							);
					
					
					week.setIsOpened(Boolean.TRUE);
					Database.getCurrentSession().update(week);
					Database.getCurrentSession().getTransaction().commit();
				}
				
				// Sleeps 1 hour
//				this.sleep(1000 * 60 * 60);
				// Sleeps 1 minute
				this.sleep(1000 * 60);
			}
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
	}
}

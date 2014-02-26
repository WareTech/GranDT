package ar.com.WareTech.GranDT.middleware.services;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Expression;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Configuration;

/**
 * @author Augusto
 *
 */
public class ApplicationContext 
{
	final static public String TOURNAMENT_STARTED             = "TOURNAMENT_STARTED";
	final static public String TOURNAMENT_NAME                = "TOURNAMENT_NAME";
	final static public String PREVIOUS_TOURNAMENT_NAME       = "PREVIOUS_TOURNAMENT_NAME";
	final static public String CURRENT_WEEK                   = "CURRENT_WEEK";
	final static public String PREVIOUS_TOURNAMENT_CONNECTION = "PREVIOUS_TOURNAMENT_CONNECTION";
	final static public String WEEK_OPEN                      = "WEEK_OPEN";
	final static public String WEEK_CLOSE                     = "WEEK_CLOSE";
	
	static protected ApplicationContext applicationContext = new ApplicationContext();

	/**
	 * @return
	 */
	static public ApplicationContext getInstance()
	{
		return applicationContext;
	}

	protected Map map = null;
	
	/**
	 * 
	 */
	protected ApplicationContext()
	{
		Database.getCurrentSession().beginTransaction();
		
		this.init();
		
		Database.getCurrentSession().getTransaction().commit();
	}
	
	/**
	 * 
	 */
	public void init()
	{
		this.map = new HashMap();
		
		// CONFIGURATION
		List configurationList = Database.getCurrentSession().createCriteria(Configuration.class).list();
		Iterator configurationIterator = configurationList.iterator();
		Configuration configuration = null;
		while(configurationIterator.hasNext())
		{
			configuration = (Configuration) configurationIterator.next();
			this.map.put(
					configuration.getKey(), 
					configuration.getValue()
					);
		}
	}
	
	/**
	 * @param key
	 * @return
	 */
	public Object get(
			String key
			)
	{
		return this.map.get(key);
	}
	
	/**
	 * @param key
	 * @param value
	 */
	public void update(
			String key, 
			String value
			)
	{
		Configuration configuration = (Configuration) Database.getCurrentSession().createCriteria(
				Configuration.class
				).add(Expression.eq("key", key)).uniqueResult();
		
		if (configuration == null)
		{
			configuration = new Configuration();
			configuration.setKey(key);
		}
		configuration.setValue(value);
		
		Database.getCurrentSession().saveOrUpdate(configuration);
		
		this.map.put(key, value);
	}
}

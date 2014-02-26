/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Claim
    extends AbstractPersistentObject
{
	final static public DateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");

	final static public String[] TARGET = {"Orga", "Sistema"};
	final static public int TARGET_ORGA = 0;
	final static public int TARGET_SYSTEM = 1;
	
	final static public String[] PRIORITY = {"Urgente", "Alta", "Media", "Baja"};
	final static public int PRIORITY_URGENT = 0;
	final static public int PRIORITY_HIGTH = 1;
	final static public int PRIORITY_MEDIUM = 2;
	final static public int PRIORITY_LOW = 3;
	
	final static public String[] STATE = {"Nuevo", "Leído", "Cerrado"};
	final static public int STATE_NEW = 0;
	final static public int STATE_READED = 1;
	final static public int STATE_CLOSE = 2;
	
    protected String title;
    protected String description;
    protected Integer target;
    protected Integer priority;
    protected User user;
    protected Date date;
    protected Integer state;
	
    public String getTitle() 
	{
		return this.title;
	}
    
	public void setTitle(
			String title
			) 
	{
		this.title = title;
	}
	
	/**
	 * @return
	 */
	public String getDescription() 
	{
		return this.description;
	}
	
	/**
	 * @param description
	 */
	public void setDescription(
			String description
			) 
	{
		this.description = description;
	}
	
	/**
	 * @return
	 */
	public Integer getTarget() 
	{
		return this.target;
	}
	
	/**
	 * @param target
	 */
	public void setTarget(
			Integer target
			) 
	{
		this.target = target;
	}
	
	/**
	 * @return
	 */
	public Integer getPriority() 
	{
		return this.priority;
	}
	
	/**
	 * @param priority
	 */
	public void setPriority(
			Integer priority
			) 
	{
		this.priority = priority;
	}
	
	/**
	 * @return
	 */
	public User getUser() 
	{
		return this.user;
	}
	
	/**
	 * @param user
	 */
	public void setUser(
			User user
			) 
	{
		this.user = user;
	}
	
	/**
	 * @return
	 */
	public Date getDate() 
	{
		return this.date;
	}
	
	/**
	 * @param date
	 */
	public void setDate(
			Date date
			) 
	{
		this.date = date;
	}
	
	/**
	 * @return
	 */
	public Integer getState() 
	{
		return this.state;
	}
	
	/**
	 * @param state
	 */
	public void setState(
			Integer state
			) 
	{
		this.state = state;
	}

    
}

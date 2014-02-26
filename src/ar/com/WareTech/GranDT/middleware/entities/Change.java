package ar.com.WareTech.GranDT.middleware.entities;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Change
    extends AbstractPersistentObject
{
	final static public DateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");

	protected Week week;
    protected Team team;
    protected Player playerIn;
    protected Player playerOut;
    protected User user;
    protected Date date;

	/**
	 * @return the user
	 */
	public User getUser() 
	{
		return this.user;
	}

	/**
	 * @param user the user to set
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
	public Week getWeek() 
	{
		return this.week;
	}

	/**
	 * @param week
	 */
	public void setWeek(
			Week week
			) 
	{
		this.week = week;
	}

	/**
	 * @return
	 */
	public Team getTeam()
	{
		return this.team;
	}

	/**
	 * @param team
	 */
	public void setTeam(
			Team team
			)
	{
		this.team = team;
	}

	/**
	 * @return
	 */
	public Player getPlayerIn()
	{
		return this.playerIn;
	}

	/**
	 * @param playerIn
	 */
	public void setPlayerIn(
			Player playerIn
			)
	{
		this.playerIn = playerIn;
	}

	/**
	 * @return
	 */
	public Player getPlayerOut()
	{
		return this.playerOut;
	}

	/**
	 * @param playerOut
	 */
	public void setPlayerOut(
			Player playerOut
			) 
	{
		this.playerOut = playerOut;
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

}

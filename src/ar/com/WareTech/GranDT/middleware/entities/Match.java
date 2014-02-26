/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;


/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Match
    extends AbstractPersistentObject
{
    protected Week week;
    protected Club homeClub;
    protected Club awayClub;
    protected Integer homeGoals;
    protected Integer awayGoals;
    protected Date date;
    protected Set playerMatchSet = new HashSet();
	
    /**
     * @return
     */
    public Week getWeek()
    {
		return week;
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
	public Club getHomeClub() 
	{
		return this.homeClub;
	}
	
	/**
	 * @param homeClub
	 */
	public void setHomeClub(
			Club homeClub
			)
	{
		this.homeClub = homeClub;
	}
	
	/**
	 * @return
	 */
	public Club getAwayClub() 
	{
		return this.awayClub;
	}
	
	/**
	 * @param awayClub
	 */
	public void setAwayClub(
			Club awayClub
			)
	{
		this.awayClub = awayClub;
	}
	
	/**
	 * @return
	 */
	public Integer getHomeGoals() 
	{
		return this.homeGoals;
	}
	
	/**
	 * @param homeGoals
	 */
	public void setHomeGoals(
			Integer homeGoals
			)
	{
		this.homeGoals = homeGoals;
	}
	
	/**
	 * @return
	 */
	public Integer getAwayGoals() 
	{
		return this.awayGoals;
	}
	
	/**
	 * @param awayGoals
	 */
	public void setAwayGoals(
			Integer awayGoals
			) 
	{
		this.awayGoals = awayGoals;
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
	 * @return the playerMatchSet
	 */
	public Set getPlayerMatchSet()
	{
		return this.playerMatchSet;
	}

	/**
	 * @param playerMatchSet the playerMatchSet to set
	 */
	public void setPlayerMatchSet(
			Set playerMatchSet
			)
	{
		this.playerMatchSet = playerMatchSet;
	}
	
	/**
	 * @param player
	 * @return
	 */
	public PlayerMatch getPlayerMatchForPlayer(
			Player player
			)
	{
		PlayerMatch playerMatch = null;
		Iterator playerMatchIterator = this.getPlayerMatchSet().iterator();
		while (playerMatchIterator.hasNext())
		{
			playerMatch = (PlayerMatch) playerMatchIterator.next();
			if (playerMatch.getPlayer().getId().equals(player.getId()))
			{
				return playerMatch;
			}
		}
		
		return null;
	}
	
}
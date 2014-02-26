/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class CupGroupPositionTeamWeek
    extends AbstractPersistentObject
{
    protected CupGroup group;
    protected Week week;
    protected Integer position;
    protected Team team;
    protected Integer points;
    protected Integer played;
    protected Integer wins;
    protected Integer draws;
    protected Integer loses;
    protected Integer goalsIn;
    protected Integer goalsOut;
    
	/**
	 * @return
	 */
	public CupGroup getGroup() 
	{
		return this.group;
	}
	
	/**
	 * @param group
	 */
	public void setGroup(
			CupGroup group
			) 
	{
		this.group = group;
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
	public Integer getPosition() 
	{
		return this.position;
	}

	/**
	 * @param position
	 */
	public void setPosition(
			Integer position
			) 
	{
		this.position = position;
	}

	/**
	 * @return
	 */
	public Integer getPoints() 
	{
		return this.points;
	}

	/**
	 * @param points
	 */
	public void setPoints(
			Integer points
			) 
	{
		this.points = points;
	}
    
	/**
	 * @return
	 */
	public Integer getPlayed() 
	{
		return this.played;
	}

	/**
	 * @param played
	 */
	public void setPlayed(
			Integer played
			) 
	{
		this.played = played;
	}
    
	/**
	 * @return
	 */
	public Integer getWins() 
	{
		return this.wins;
	}

	/**
	 * @param wins
	 */
	public void setWins(
			Integer wins
			) 
	{
		this.wins = wins;
	}
    
	/**
	 * @return
	 */
	public Integer getDraws() 
	{
		return this.draws;
	}

	/**
	 * @param draws
	 */
	public void setDraws(
			Integer draws
			) 
	{
		this.draws = draws;
	}
    
	/**
	 * @return
	 */
	public Integer getLoses() 
	{
		return this.loses;
	}

	/**
	 * @param loses
	 */
	public void setLoses(
			Integer loses
			) 
	{
		this.loses = loses;
	}
    
	/**
	 * @return
	 */
	public Integer getGoalsIn() 
	{
		return this.goalsIn;
	}

	/**
	 * @param goalsIn
	 */
	public void setGoalsIn(
			Integer goalsIn
			) 
	{
		this.goalsIn = goalsIn;
	}
    
	/**
	 * @return
	 */
	public Integer getGoalsOut() 
	{
		return this.goalsOut;
	}

	/**
	 * @param goalsOut
	 */
	public void setGoalsOut(
			Integer goalsOut
			) 
	{
		this.goalsOut = goalsOut;
	}
    
}

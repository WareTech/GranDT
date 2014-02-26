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
public class CupMatch
    extends AbstractPersistentObject
{
    protected Week week;
    protected CupGroup group;
    protected Team localTeam;
    protected Integer localGoals;
    protected Team awayTeam;
    protected Integer awayGoals;
    protected Boolean played;
    
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
	public Team getLocalTeam()
	{
		return this.localTeam;
	}
	
	/**
	 * @param localTeam
	 */
	public void setLocalTeam(
			Team localTeam
			) 
	{
		this.localTeam = localTeam;
	}
	
	/**
	 * @return
	 */
	public Integer getLocalGoals() 
	{
		return this.localGoals;
	}
	
	/**
	 * @param localGoals
	 */
	public void setLocalGoals(
			Integer localGoals
			)
	{
		this.localGoals = localGoals;
	}
	
	/**
	 * @return
	 */
	public Team getAwayTeam() 
	{
		return this.awayTeam;
	}
	
	/**
	 * @param awayTeam
	 */
	public void setAwayTeam(
			Team awayTeam
			) 
	{
		this.awayTeam = awayTeam;
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
	public Boolean getPlayed()
	{
		return this.played;
	}
	
	/**
	 * @param played
	 */
	public void setPlayed(
			Boolean played
			) 
	{
		this.played = played;
	}
	
    
}

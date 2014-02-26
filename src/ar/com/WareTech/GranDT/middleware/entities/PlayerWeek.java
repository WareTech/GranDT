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
public class PlayerWeek
    extends AbstractPersistentObject
{
    protected Player player;
    protected Week week;
    protected Double totalPoints;
    protected Double olePoints;
    protected Boolean cleanGoal;
    protected Integer ownGoal;
    protected Boolean mom;
    protected Integer goals;
    protected Integer penaltyGoals;
    protected Integer freeKickGoals;
    protected Integer missedPenalties;
    protected Integer cachedPenalties;
    protected Boolean yellowCard;
    protected Boolean redCard;

	/**
	 * @return the player
	 */
	public Player getPlayer() 
	{
		return this.player;
	}

	/**
	 * @param player the player to set
	 */
	public void setPlayer(
			Player player
			)
	{
		this.player = player;
	}

	/**
	 * @return the week
	 */
	public Week getWeek()
{
		return this.week;
	}

	/**
	 * @param week the week to set
	 */
	public void setWeek(
			Week week
			) 
	{
		this.week = week;
	}

	/**
	 * @return the totalPoints
	 */
	public Double getTotalPoints() 
	{
		return this.totalPoints;
	}

	/**
	 * @param totalPoints the totalPoints to set
	 */
	public void setTotalPoints(
			Double totalPoints
			) 
	{
		this.totalPoints = totalPoints;
	}

	/**
	 * @return the olePoints
	 */
	public Double getOlePoints()
	{
		return this.olePoints;
	}

	/**
	 * @param olePoints the olePoints to set
	 */
	public void setOlePoints(
			Double olePoints
			) 
	{
		this.olePoints = olePoints;
	}

	/**
	 * @return the cleanGoal
	 */
	public Boolean getCleanGoal()
	{
		return this.cleanGoal;
	}

	/**
	 * @param cleanGoal the cleanGoal to set
	 */
	public void setCleanGoal(
			Boolean cleanGoal
			) 
	{
		this.cleanGoal = cleanGoal;
	}

	/**
	 * @return the ownGoal
	 */
	public Integer getOwnGoal() 
	{
		return this.ownGoal;
	}

	/**
	 * @param ownGoal the ownGoal to set
	 */
	public void setOwnGoal(
			Integer ownGoal
			) 
	{
		this.ownGoal = ownGoal;
	}

	/**
	 * @return the mom
	 */
	public Boolean getMom() 
	{
		return this.mom;
	}

	/**
	 * @param mom the mom to set
	 */
	public void setMom(
			Boolean mom
			) 
	{
		this.mom = mom;
	}

	/**
	 * @return the goals
	 */
	public Integer getGoals() 
	{
		return this.goals;
	}

	/**
	 * @param goals the goals to set
	 */
	public void setGoals(
			Integer goals
			) 
	{
		this.goals = goals;
	}

	/**
	 * @return the penaltyGoals
	 */
	public Integer getPenaltyGoals() 
	{
		return this.penaltyGoals;
	}

	/**
	 * @param penaltyGoals the penaltyGoals to set
	 */
	public void setPenaltyGoals(
			Integer penaltyGoals
			) 
	{
		this.penaltyGoals = penaltyGoals;
	}

	/**
	 * @return the freeKickGoals
	 */
	public Integer getFreeKickGoals() 
	{
		return this.freeKickGoals;
	}

	/**
	 * @param freeKickGoals the freeKickGoals to set
	 */
	public void setFreeKickGoals(
			Integer freeKickGoals
			) 
	{
		this.freeKickGoals = freeKickGoals;
	}

	/**
	 * @return the missedPenalties
	 */
	public Integer getMissedPenalties() 
	{
		return this.missedPenalties;
	}

	/**
	 * @param missedPenalties the missedPenalties to set
	 */
	public void setMissedPenalties(
			Integer missedPenalties
			) 
	{
		this.missedPenalties = missedPenalties;
	}

	/**
	 * @return the cachedPenalties
	 */
	public Integer getCachedPenalties() 
	{
		return this.cachedPenalties;
	}

	/**
	 * @param cachedPenalties the cachedPenalties to set
	 */
	public void setCachedPenalties(
			Integer cachedPenalties
			) 
	{
		this.cachedPenalties = cachedPenalties;
	}

	/**
	 * @return the yellowCard
	 */
	public Boolean getYellowCard() 
	{
		return this.yellowCard;
	}

	/**
	 * @param yellowCard the yellowCard to set
	 */
	public void setYellowCard(
			Boolean yellowCard
			) 
	{
		this.yellowCard = yellowCard;
	}

	/**
	 * @return the redCard
	 */
	public Boolean getRedCard()
	{
		return this.redCard;
	}

	/**
	 * @param redCard the redCard to set
	 */
	public void setRedCard(
			Boolean redCard
			) 
	{
		this.redCard = redCard;
	}
    
}
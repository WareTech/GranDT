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
public class PlayerMatch
    extends AbstractPersistentObject
{
    protected Player player;
    protected Match match;
    protected Double totalPoints;
    protected Double olePoints;
    protected Boolean cleanGoal;
    protected Integer recivedGoals;
    protected Integer ownGoals;
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
	 * @return the match
	 */
	public Match getMatch()
{
		return this.match;
	}

	/**
	 * @param match the match to set
	 */
	public void setMatch(
			Match match
			) 
	{
		this.match = match;
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
	 * @return the ownGoals
	 */
	public Integer getOwnGoals() 
	{
		return this.ownGoals;
	}

	/**
	 * @param ownGoals the ownGoals to set
	 */
	public void setOwnGoals(
			Integer ownGoals
			) 
	{
		this.ownGoals = ownGoals;
	}

	/**
	 * @return
	 */
	public Integer getRecivedGoals() 
	{
		return this.recivedGoals;
	}

	/**
	 * @param recivedGoals
	 */
	public void setRecivedGoals(
			Integer recivedGoals
			) 
	{
		this.recivedGoals = recivedGoals;
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

	/**
	 * 
	 */
	public void calculate() 
	{
		double totalPoints = this.getOlePoints().doubleValue();
		
		if (this.getMom() != null && this.getMom().booleanValue())
		{
			totalPoints *= 2;
		}
		
		if (this.getPenaltyGoals() != null)
		{
			totalPoints += this.getPenaltyGoals().intValue() * 2;
		}

		if (this.getFreeKickGoals() != null)
		{
			totalPoints += this.getFreeKickGoals().intValue() * 6;
		}

		if (this.getGoals() != null)
		{
			if (PlayerPosition.ARQUERO.equals(this.getPlayer().getPosition().getName()))
			{
				totalPoints += this.getGoals().intValue() * 10;
			}
			else if (PlayerPosition.DEFENSOR.equals(this.getPlayer().getPosition().getName()))
			{
				totalPoints += this.getGoals().intValue() * 6;
			}
			else if (PlayerPosition.VOLANTE.equals(this.getPlayer().getPosition().getName()))
			{
				totalPoints += this.getGoals().intValue() * 4;
			}
			else if (PlayerPosition.DELANTERO.equals(this.getPlayer().getPosition().getName()))
			{
				totalPoints += this.getGoals().intValue() * 3;
			}
			else
			{
				throw new RuntimeException(
						"Unexpected position '" + this.getPlayer().getPosition().getName() + "' for player '" + this.getPlayer().getFirstname() + " " + this.getPlayer().getLastname() + " (" + this.getPlayer().getClub() + ")"
						);
			}
		}

		if (this.getCleanGoal() != null && this.getCleanGoal().booleanValue())
		{
			totalPoints += 2;
		}

		if (this.getRecivedGoals() != null)
		{
			totalPoints -= this.getRecivedGoals().intValue();
		}

		if (this.getOwnGoals() != null)
		{
			totalPoints -= this.getOwnGoals().intValue() * 4;
		}

		if (this.getMissedPenalties() != null)
		{
			totalPoints -= this.getMissedPenalties().intValue() * 4;
		}

		if (this.getCachedPenalties() != null)
		{
			totalPoints += this.getCachedPenalties().intValue() * 4;
		}

		if (this.getYellowCard() != null && this.getYellowCard().booleanValue())
		{
			totalPoints -= 1;
		}

		if (this.getRedCard() != null && this.getRedCard().booleanValue())
		{
			totalPoints -= 2;
		}

		this.setTotalPoints(
				new Double(totalPoints)
				);
	}
    
}
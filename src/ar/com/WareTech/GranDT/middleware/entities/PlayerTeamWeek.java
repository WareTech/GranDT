/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;

import java.util.Comparator;


/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class PlayerTeamWeek
    extends AbstractPersistentObject
{
	final static public Comparator NUMBER_COMPARATOR = new Comparator()
	{
		public int compare(
				Object object1, 
				Object object2
				)
		{
			PlayerTeamWeek playerTeamWeek1 = (PlayerTeamWeek) object1;
			PlayerTeamWeek playerTeamWeek2 = (PlayerTeamWeek) object2;
			
			return playerTeamWeek1.getPlayerteam().getNumber().compareTo(
					playerTeamWeek2.getPlayerteam().getNumber()
					);
		}
	};

	protected PlayerTeam playerteam;
    protected Week week;
    protected Boolean plays;
    protected Double points;

	/**
	 * @return the playerteam
	 */
	public PlayerTeam getPlayerteam() 
	{
		return this.playerteam;
	}

	/**
	 * @param playerteam the playerteam to set
	 */
	public void setPlayerteam(
			PlayerTeam playerteam
			)
	{
		this.playerteam = playerteam;
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
	 * @return the plays
	 */
	public Boolean getPlays() 
	{
		return this.plays;
	}

	/**
	 * @param plays the plays to set
	 */
	public void setPlays(
			Boolean plays
			) 
	{
		this.plays = plays;
	}

	/**
	 * @return the points
	 */
	public Double getPoints() 
	{
		return this.points;
	}

	/**
	 * @param points the points to set
	 */
	public void setPoints(
			Double points
			) 
	{
		this.points = points;
	}
}
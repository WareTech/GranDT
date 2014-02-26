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
public class PositionTeamWeek
    extends AbstractPersistentObject
{
    protected Team team;
    protected Week week;
    protected Double points;
    protected Double weekPoints;
    protected Integer position;
    protected Category category;

	/**
	 * @return the team
	 */
	public Team getTeam() 
	{
		return this.team;
	}

	/**
	 * @param team the team to set
	 */
	public void setTeam(
			Team team
			)
	{
		this.team = team;
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

	/**
	 * @return the weekPoints
	 */
	public Double getWeekPoints() 
	{
		return this.weekPoints;
	}

	/**
	 * @param points the weekPoints to set
	 */
	public void setWeekPoints(
			Double weekPoints
			) 
	{
		this.weekPoints = weekPoints;
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
	public Category getCategory()
	{
		return this.category;
	}
	
	/**
	 * @param category
	 */
	public void setCategory(
			Category category
			)
	{
		this.category = category;
	}

}
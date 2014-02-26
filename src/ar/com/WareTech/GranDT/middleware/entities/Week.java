/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Week
    extends AbstractPersistentObject
{
    protected Integer number;
    protected Boolean isOpened;
    protected Boolean isCalculated;
    protected Set matchSet = new HashSet();

	/**
	 * @return the number
	 */
	public Integer getNumber() 
	{
		return this.number;
	}

	/**
	 * @param number the number to set
	 */
	public void setNumber(
			Integer number
			) 
	{
		this.number = number;
	}

	/**
	 * @return the matchSet
	 */
	public Set getMatchSet()
	{
		return this.matchSet;
	}

	/**
	 * @param matchSet the matchSet to set
	 */
	public void setMatchSet(
			Set matchSet
			)
	{
		this.matchSet = matchSet;
	}

	/**
	 * @param club
	 * @return
	 */
	public Match getMatchForClub(
			Club club
			)
	{
		Iterator matchIterator = this.getMatchSet().iterator();
		Match match;
		while(matchIterator.hasNext())
		{
			match = (Match)  matchIterator.next();
			if (
					match.getHomeClub().getId().equals(club.getId()) ||
					match.getAwayClub().getId().equals(club.getId())
					)
			{
				return match;
			}
		}
		
		return null;
	}

	/**
	 * @return
	 */
	public Boolean getIsOpened() 
	{
		return this.isOpened;
	}

	/**
	 * @param isOpened
	 */
	public void setIsOpened(
			Boolean isOpened
			) 
	{
		this.isOpened = isOpened;
	}

	/**
	 * @return
	 */
	public Boolean getIsCalculated() 
	{
		return this.isCalculated;
	}

	/**
	 * @param isCalculated
	 */
	public void setIsCalculated(
			Boolean isCalculated
			)
	{
		this.isCalculated = isCalculated;
	}
}

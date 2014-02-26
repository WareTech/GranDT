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
public class PlayerTeam
    extends AbstractPersistentObject
{
	/**
	 * 
	 */
	final static public Comparator NUMBER_COMPARATOR = new Comparator()
	{
		public int compare(
				Object object1, 
				Object object2
				)
		{
			PlayerTeam playerTeam1 = (PlayerTeam) object1;
			PlayerTeam playerTeam2 = (PlayerTeam) object2;
			
			return playerTeam1.getNumber().compareTo(
					playerTeam2.getNumber()
					);
		}
	};

	/**
	 * 
	 */
	final static public Comparator POSITION_COMPARATOR = new Comparator()
	{
		public int compare(
				Object object1, 
				Object object2
				)
		{
			PlayerTeam playerTeam1 = (PlayerTeam) object1;
			PlayerTeam playerTeam2 = (PlayerTeam) object2;
			
			int comparation = playerTeam1.getPlayer().getPosition().getId().compareTo(
					playerTeam2.getPlayer().getPosition().getId()
					);
			
			if (comparation != 0 || playerTeam1.getNumber() == null || playerTeam2.getNumber() == null)
			{
				return comparation;
			}
			
			return playerTeam1.getNumber().compareTo(
					playerTeam2.getNumber()
					);
		}
	};
	
    protected Player player;
    protected Team team;
    protected Boolean isCaptain1 = Boolean.FALSE;
    protected Boolean isCaptain2 = Boolean.FALSE;
    protected Boolean isCaptain3 = Boolean.FALSE;
    protected Boolean isPrincipal = Boolean.FALSE;
    protected Boolean isSubstitute = Boolean.FALSE;
    protected Boolean isList = Boolean.TRUE;
    protected Integer number;

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
	 * @return the isCaptain1
	 */
	public Boolean getIsCaptain1() 
	{
		return this.isCaptain1;
	}

	/**
	 * @param isCaptain1 the isCaptain1 to set
	 */
	public void setIsCaptain1(
			Boolean isCaptain1
			) 
	{
		this.isCaptain1 = isCaptain1;
	}

	/**
	 * @return the isCaptain2
	 */
	public Boolean getIsCaptain2() 
	{
		return this.isCaptain2;
	}

	/**
	 * @param isCaptain2 the isCaptain2 to set
	 */
	public void setIsCaptain2(
			Boolean isCaptain2
			) 
	{
		this.isCaptain2 = isCaptain2;
	}

	/**
	 * @return the isCaptain3
	 */
	public Boolean getIsCaptain3() 
	{
		return this.isCaptain3;
	}

	/**
	 * @param isCaptain3 the isCaptain3 to set
	 */
	public void setIsCaptain3(
			Boolean isCaptain3
			) 
	{
		this.isCaptain3 = isCaptain3;
	}

	/**
	 * @return the isPrincipal
	 */
	public Boolean getIsPrincipal() 
	{
		return this.isPrincipal;
	}

	/**
	 * @param isPrincipal the isPrincipal to set
	 */
	public void setIsPrincipal(
			Boolean isPrincipal
			) 
	{
		this.isPrincipal = isPrincipal;
	}

	/**
	 * @return the isSubstitute
	 */
	public Boolean getIsSubstitute() 
	{
		return this.isSubstitute;
	}

	/**
	 * @param isSubstitute the isSubstitute to set
	 */
	public void setIsSubstitute(
			Boolean isSubstitute
			) 
	{
		this.isSubstitute = isSubstitute;
	}

	/**
	 * @return the isList
	 */
	public Boolean getIsList() 
	{
		return this.isList;
	}

	/**
	 * @param isList the isList to set
	 */
	public void setIsList(
			Boolean isList
			) 
	{
		this.isList = isList;
	}

	/**
	 * @return
	 */
	public Integer getNumber()
	{
		return this.number;
	}
	
	/**
	 * @param number
	 */
	public void setNumber(
			Integer number
			)
	{
		this.number = number;
	}
}
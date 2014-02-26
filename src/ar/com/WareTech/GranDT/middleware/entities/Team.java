/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Team
    extends AbstractPersistentObject
{
    protected String name;
    protected User user;
    protected Category category;
    protected Set playerTeamSet = new HashSet();
    protected Boolean isClosed = Boolean.TRUE;
    protected String tactic;

    /**
	 * @return the name
	 */
	public String getName()
	{
		return this.name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(
			String name
			) 
	{
		this.name = name;
	}

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
	 * @return the category
	 */
	public Category getCategory() 
	{
		return this.category;
	}

	/**
	 * @param category the category to set
	 */
	public void setCategory(
			Category category
			) 
	{
		this.category = category;
	}

	/**
	 * @return
	 */
	public Set getPlayerTeamSet()
	{
		return this.playerTeamSet;
	}
	
	/**
	 * @param playerTeamSet
	 */
	public void setPlayerTeamSet(
			Set playerTeamSet
			)
	{
		this.playerTeamSet = playerTeamSet;
	}
	
	/**
	 * @return
	 */
	public Boolean getIsClosed()
	{
		return this.isClosed;
	}
	
	/**
	 * @param isClosed
	 */
	public void setIsClosed(
			Boolean isClosed
			)
	{
		this.isClosed = isClosed;
	}

	/**
	 * @return
	 */
	public String getTactic()
	{
		return this.tactic;
	}
	
	/**
	 * @param tactic
	 */
	public void setTactic(
			String tactic
			)
	{
		this.tactic = tactic;
	}
	
	/**
	 * @return
	 */
	public PlayerTeam getCaptain1ForPlayerTeamSet() 
	{
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (playerTeam.getIsCaptain1() != null && playerTeam.getIsCaptain1().booleanValue())
			{
				return playerTeam;
			}
		}
		
		return null;
	}
	
	/**
	 * @return
	 */
	public PlayerTeam getCaptain2ForPlayerTeamSet() 
	{
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (playerTeam.getIsCaptain2() != null && playerTeam.getIsCaptain2().booleanValue())
			{
				return playerTeam;
			}
		}
		
		return null;
	}
	
	/**
	 * @return
	 */
	public PlayerTeam getCaptain3ForPlayerTeamSet() 
	{
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (playerTeam.getIsCaptain3() != null && playerTeam.getIsCaptain3().booleanValue())
			{
				return playerTeam;
			}
		}
		
		return null;
	}
	
	/**
	 * @return
	 */
	public List getPrincipalPlayerTeamList()
	{
		List principalPlayerTeamList = new ArrayList();
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam = null;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (Boolean.TRUE.equals(playerTeam.getIsPrincipal()))
			{
				principalPlayerTeamList.add(playerTeam);
			}
		}
		
		return principalPlayerTeamList;
	}

	/**
	 * @return
	 */
	public List getSubstitutePlayerTeamList()
	{
		List substitutePlayerTeamList = new ArrayList();
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam = null;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (Boolean.TRUE.equals(playerTeam.getIsSubstitute()))
			{
				substitutePlayerTeamList.add(playerTeam);
			}
		}
		
		return substitutePlayerTeamList;
	}

	/**
	 * @return
	 */
	public List getListPlayerTeamList()
	{
		List listPlayerTeamList = new ArrayList();
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam = null;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (Boolean.TRUE.equals(playerTeam.getIsList()))
			{
				listPlayerTeamList.add(playerTeam);
			}
		}
		
		return listPlayerTeamList;
	}
	
	/**
	 * @return
	 */
	public List getGoalkeeperPlayerTeamList()
	{
		List goalkeeperPlayerTeamList = new ArrayList();
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam = null;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (PlayerPosition.ARQUERO.equals(playerTeam.getPlayer().getPosition().getName()))
			{
				goalkeeperPlayerTeamList.add(playerTeam);
			}
		}
		
		return goalkeeperPlayerTeamList;
	}

	/**
	 * @return
	 */
	public List getDefensorPlayerTeamList()
	{
		List defensorPlayerTeamList = new ArrayList();
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam = null;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (PlayerPosition.DEFENSOR.equals(playerTeam.getPlayer().getPosition().getName()))
			{
				defensorPlayerTeamList.add(playerTeam);
			}
		}
		
		return defensorPlayerTeamList;
	}

	/**
	 * @return
	 */
	public List getMiddfieldPlayerTeamList()
	{
		List middfieldPlayerTeamList = new ArrayList();
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam = null;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (PlayerPosition.VOLANTE.equals(playerTeam.getPlayer().getPosition().getName()))
			{
				middfieldPlayerTeamList.add(playerTeam);
			}
		}
		
		return middfieldPlayerTeamList;
	}

	/**
	 * @return
	 */
	public List getForwardPlayerTeamList()
	{
		List forwardPlayerTeamList = new ArrayList();
		Iterator playerTeamIterator = this.getPlayerTeamSet().iterator();
		PlayerTeam playerTeam = null;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (PlayerPosition.DELANTERO.equals(playerTeam.getPlayer().getPosition().getName()))
			{
				forwardPlayerTeamList.add(playerTeam);
			}
		}
		
		return forwardPlayerTeamList;
	}

}

/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class CupGroup
    extends AbstractPersistentObject
{
    protected CupPhase phase;
    protected String name;
    protected Set groupTeamSet = new HashSet();

	/**
	 * @return
	 */
	public CupPhase getPhase()
	{
		return this.phase;
	}
	
	/**
	 * @param phase
	 */
	public void setPhase(
			CupPhase phase
			) 
	{
		this.phase = phase;
	}
    
	/**
	 * @return
	 */
	public String getName() 
	{
		return this.name;
	}
	
	/**
	 * @param name
	 */
	public void setName(
			String name
			) 
	{
		this.name = name;
	}

	/**
	 * @return
	 */
	public Set getGroupTeamSet()
	{
		return this.groupTeamSet;
	}
	
	/**
	 * @param groupTeamSet
	 */
	public void setGroupTeamSet(
			Set groupTeamSet
			)
	{
		this.groupTeamSet = groupTeamSet;
	}
}

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
public class CupPhase
    extends AbstractPersistentObject
{
	final static public Integer REGULAR = new Integer(1);
	final static public Integer PLAYOFF = new Integer(2);
	
    protected String name;
    protected Integer type;
    protected CupPhase nextPhase;
    protected Set groupSet = new HashSet();
    
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
	public Integer getType()
	{
		return this.type;
	}
	
	/**
	 * @param type
	 */
	public void setType(
			Integer type
			)
	{
		this.type = type;
	}
	
	/**
	 * @return
	 */
	public CupPhase getNextPhase()
	{
		return this.nextPhase;
	}
	
	/**
	 * @param nextPhase
	 */
	public void setNextPhase(
			CupPhase nextPhase
			) 
	{
		this.nextPhase = nextPhase;
	}

	/**
	 * @return
	 */
	public Set getGroupSet()
	{
		return this.groupSet;
	}

	/**
	 * @param groupSet
	 */
	public void setGroupSet(
			Set groupSet
			) 
	{
		this.groupSet = groupSet;
	}
    
}

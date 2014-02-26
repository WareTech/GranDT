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
public class Club
    extends AbstractPersistentObject
{
    protected String name;
    protected Set playerSet = new HashSet();

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
	 * @return
	 */
	public Set getPlayerSet()
	{
		return this.playerSet;
	}
	
	/**
	 * @param playerSet
	 */
	public void setPlayerSet(
			Set playerSet
			)
	{
		this.playerSet = playerSet;
	}
}
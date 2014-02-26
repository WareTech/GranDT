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
public class CupGroupTeam
    extends AbstractPersistentObject
{
    protected CupGroup group;
    protected Team team;
    
	/**
	 * @return
	 */
	public CupGroup getGroup() 
	{
		return this.group;
	}
	
	/**
	 * @param group
	 */
	public void setGroup(
			CupGroup group
			) 
	{
		this.group = group;
	}
	
	/**
	 * @return
	 */
	public Team getTeam()
	{
		return this.team;
	}
	
	/**
	 * @param team
	 */
	public void setTeam(
			Team team
			)
	{
		this.team = team;
	}
    
}

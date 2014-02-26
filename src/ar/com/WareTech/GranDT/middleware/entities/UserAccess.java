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
public class UserAccess
    extends AbstractPersistentObject
{
	protected User user;
	protected Access access;
	
	/**
	 * @return
	 */
	public User getUser() 
	{
		return this.user;
	}
	
	/**
	 * @param user
	 */
	public void setUser(
			User user
			) 
	{
		this.user = user;
	}
	
	/**
	 * @return
	 */
	public Access getAccess() 
	{
		return this.access;
	}
	
	/**
	 * @param access
	 */
	public void setAccess(
			Access access
			) 
	{
		this.access = access;
	}
	
}

/*
 * Created on 30/07/2007
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: Mark SRL
 */
package ar.com.WareTech.GranDT.middleware.services;

import java.util.Iterator;

import org.hibernate.criterion.Expression;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Access;
import ar.com.WareTech.GranDT.middleware.entities.User;
import ar.com.WareTech.GranDT.middleware.entities.UserAccess;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - Mark SRL
 */
public class SecurityManager
{
	static protected SecurityManager securityManager = new SecurityManager();
	
	/**
	 * @return
	 */
	static public SecurityManager getInstance()
	{
		return SecurityManager.securityManager;
	}
	
	/**
	 * @param user
	 * @param access
	 * @return
	 */
	public boolean checkAuthorization(
			User user,
			String url
			) 
	{
		Iterator accessIterator = Database.getCurrentSession().createCriteria(Access.class).list().iterator();
		Access access = null;
		while(accessIterator.hasNext())
		{
			access = (Access) accessIterator.next();
			if (access.getValue().equals(url))
			{
				UserAccess userAccess = (UserAccess) Database.getCurrentSession().createCriteria(
						UserAccess.class
						)
						.add(Expression.eq("user", user))
						.add(Expression.eq("access", access))
						.uniqueResult();
				
				if (userAccess == null)
				{
					return false;
				}

				return true;
			}
		}
		return true;
	}
	
}
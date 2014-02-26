package ar.com.WareTech.GranDT.test;

import org.hibernate.criterion.Expression;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Access;
import ar.com.WareTech.GranDT.middleware.entities.User;
import ar.com.WareTech.GranDT.middleware.entities.UserAccess;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Test_UserAccess 
{
    /**
     * @param args
     * @throws Exception
     */
    static public void main(
            String[] args
            )
        throws Exception
    {
    	Database.getCurrentSession().beginTransaction();
    	
    	User user = (User) Database.getCurrentSession().get(User.class, new Long(60));
    	Access access = (Access) Database.getCurrentSession().get(Access.class, new Long(1));
    	
    	UserAccess userAccess = (UserAccess) Database.getCurrentSession().createCriteria(
    			UserAccess.class
    			)
    			.add(Expression.eq("user", user))
    			.add(Expression.eq("access", access))
    			.uniqueResult();
    	
    	System.out.println(userAccess);
    }
}

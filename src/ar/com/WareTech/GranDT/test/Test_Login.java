package ar.com.WareTech.GranDT.test;

import java.security.MessageDigest;

import org.hibernate.criterion.Expression;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.User;

/**
 * @author asoncini
 *
 */
public class Test_Login 
{
	/**
	 * @param args
	 * @throws Exception
	 */
	static public void main(String[] args)
		throws Exception
	{
//		Database.getCurrentSession().beginTransaction();
//		User user = (User) Database.getCurrentSession().createQuery(
//				"FROM User WHERE username = :username AND password = :password"
//				)
//				.setString("username", "augusto")
//				.setString("password", "augusto")
//				.uniqueResult();
//		
//		System.out.println(user);
//		System.out.println(user.getTeam());
//		Database.getCurrentSession().getTransaction().commit();
//		
//		Database.getCurrentSession().beginTransaction();
//		user = (User) Database.getCurrentSession().createCriteria(
//				User.class
//				)
//				.add(Expression.eq("username", "augusto"))
//				.add(Expression.eq("password", "augusto"))
//				.uniqueResult();
//
//		System.out.println(user);
//		System.out.println(user.getTeam());
//
//		Database.getCurrentSession().getTransaction().commit();
		
		System.out.println((new sun.misc.BASE64Encoder()).encode("augusto".getBytes()));
		System.out.println((new sun.misc.BASE64Encoder()).encode("Augusto".getBytes()));
		System.out.println((new sun.misc.BASE64Encoder()).encode("augustO".getBytes()));
		System.out.println((new sun.misc.BASE64Encoder()).encode("DALE LOBO".getBytes()));
		System.out.println((new sun.misc.BASE64Encoder()).encode("DALE LOBO DALE LOBO".getBytes()));
		
//        MessageDigest md = MessageDigest.getInstance("SHA"); 
//        MessageDigest md = MessageDigest.getInstance("MD5"); 
//        md.update(pass.getBytes("UTF-8")); 
//        byte[] raw = md.digest(); 
//        String hash = (new sun.misc.BASE64Encoder()).encode(raw);
//        System.out.println(hash);
//        
//        pass = "50RJfWVetC4aKELo9rVwMLwxC+w=";
//        raw = (new sun.misc.BASE64Decoder()).decodeBuffer(pass);
//        md.digest(raw);
//        hash = new String(raw);
//        System.out.println(hash);
		
	}
}

package ar.com.WareTech.GranDT.middleware.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.User;

/**
 * @author Augusto
 *
 */
public class MailServices 
{
	final static public MailServices mailServices = new MailServices();

	/**
	 * @return
	 */
	static public MailServices getInstance()
	{
		return mailServices;
	}
	
	/**
	 * 
	 */
	protected MailServices()
	{
	}

	/**
	 * @param addressList
	 * @param subject
	 * @param text
	 * @throws Exception
	 */
	public void sendMail(
			List addressList,
			String subject,
			String text
			)
		throws Exception
	{
		System.out.println("To:" + addressList);
		System.out.println("Subject:" + subject);
		System.out.println("Text:" + text);
		
	    Properties properties = new Properties();
		properties.put("mail.smtp.host", "127.0.0.1");
		properties.put("mail.debug", "true");
		javax.mail.Session mailSession = javax.mail.Session.getInstance(properties);
		
	    Message message = new MimeMessage(mailSession);
	    message.setFrom(new InternetAddress("GranDT@WareTech.com.ar"));
	    message.setRecipients(Message.RecipientType.TO, (Address[]) addressList.toArray(new Address[]{}));
	    message.setSubject(subject);
	    message.setSentDate(new Date());
	    message.setText(text);
	    
	    Transport.send(message);
	}

	/**
	 * @param subject
	 * @param text
	 * @throws Exception
	 */
	public void sendMailToAll(
			String subject,
			String text
			)
		throws Exception
	{
		Iterator userIterator = Database.getCurrentSession().createCriteria(User.class).list().iterator();
		User user;
		List addressList = new ArrayList();
		while(userIterator.hasNext())
		{
			user = (User) userIterator.next();
			addressList.add(new InternetAddress(user.getEmail()));
		}
		
		this.sendMail(
				addressList, 
				subject, 
				text
				);
	}

	/**
	 * @param user
	 * @param subject
	 * @param text
	 * @throws Exception
	 */
	public void sendMailToUser(
			User user,
			String subject,
			String text
			)
		throws Exception
	{
		List addressList = new ArrayList();
		addressList.add(new InternetAddress(user.getEmail()));
		
		this.sendMail(
				addressList, 
				subject, 
				text
				);
	}

}

package ar.com.WareTech.GranDT.test;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Test_eMail 
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
//		Properties properties = System.getProperties();
//		properties.setProperty("mail.smtp.host", "smtp.waretech.com.ar");
////		properties.setProperty("mail.smtp.port", "587");
//		Session session = Session.getDefaultInstance(properties);
//		session.setDebug(true);
//		
//		Store store = session.getStore();
//		
//		Message message = new MimeMessage(session);
//		message.setSubject("Prueba");
//		message.setFrom(new InternetAddress("GranDT@WareTech.com.ar"));
//		message.addRecipient(RecipientType.TO, new InternetAddress("AugustoSoncini@Veraz.com.ar"));
//		message.addRecipient(RecipientType.TO, new InternetAddress("AugustoSoncini@Hotmail.com"));
//		message.setText("DALE LOBO!!!");
//		Transport.send(message);
		
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		
		Session mailSession = Session.getDefaultInstance(props);
		Message simpleMessage = new MimeMessage(mailSession);
		InternetAddress fromAddress = new InternetAddress("waretech@gmail.com");
		InternetAddress toAddress = new InternetAddress("augustosoncini@hotmail.com");
		Transport t=mailSession.getTransport("smtps");
		simpleMessage.setFrom(fromAddress);
		simpleMessage.setRecipient(RecipientType.TO, toAddress);
		simpleMessage.setSubject("testing subject");
		t.connect("smtp.gmail.com","waretech","wareTECH2009");
		t.send(simpleMessage);
	}
}

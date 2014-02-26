<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="ar.com.WareTech.GranDT.middleware.services.SecurityManager"%>
<%@page import="ar.com.WareTech.GranDT.middleware.services.MailServices"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="java.math.*"%>
<%@page import="java.util.*"%>

<%!
final static public MessageFormat MESSAGE_PLAYER_CHANGE = new MessageFormat("Se realizó el cambio de {0} {1} ({2}) x {3} {4} ({5})");
final static public MessageFormat MESSAGE_PLAYER_CHANGE_SUBJECT = new MessageFormat("GranDT - Cambio en {0}");
final static public MessageFormat MESSAGE_PLAYER_CHANGE_MAIL = new MessageFormat("{0} {1} ha realizado un cambio en {2}\nIngresó {3} {4} ({5}) en lugar de {6} {7} ({8})\nAcceda al GranDT a través de http://GranDT.WareTech.com.ar\n\nGerencia de Sistemas del GranDT\nComunidad Azuliana\nRepública Bolivariana de Robinson");

final static public MessageFormat MESSAGE_PLAYER_INJURED_PRINCIPAL_CHANGE = new MessageFormat("Se realizó el cambio x lesi&oacute;n de {3} {4} ({5}) x {0} {1} ({2}), pasando {6} {7} ({8}) al banco de suplentes");
final static public MessageFormat MESSAGE_PLAYER_INJURED_PRINCIPAL_CHANGE_SUBJECT = new MessageFormat("GranDT - Cambio x lesion en {0}");
final static public MessageFormat MESSAGE_PLAYER_INJURED_PRINCIPAL_CHANGE_MAIL = new MessageFormat("{0} {1} ha realizado un cambio x lesion en {2}\nIngreso {6} {7} ({8}) en lugar de {3} {4} ({5}), pasando {9} {10} ({11}) al banco de suplentes\nAcceda al GranDT a través de http://GranDT.WareTech.com.ar\n\nGerencia de Sistemas del GranDT\nComunidad Azuliana\nRepública Bolivariana de Robinson");

final static public MessageFormat MESSAGE_PLAYER_INJURED_SUBSTITUTE_CHANGE = new MessageFormat("Se realizó el cambio x lesi&oacute;n de {3} {4} ({5}) x {0} {1} ({2})");
final static public MessageFormat MESSAGE_PLAYER_INJURED_SUBSTITUTE_CHANGE_SUBJECT = new MessageFormat("GranDT - Cambio x lesion en {0}");
final static public MessageFormat MESSAGE_PLAYER_INJURED_SUBSTITUTE_CHANGE_MAIL = new MessageFormat("{0} {1} ha realizado un cambio x lesion en {2}\nIngresó {6} {7} ({8}) en lugar de {3} {4} ({5})\nAcceda al GranDT a través de http://GranDT.WareTech.com.ar\n\nGerencia de Sistemas del GranDT\nComunidad Azuliana\nRepública Bolivariana de Robinson");

//------------------------------------------------------------------------------------------------
public void sendMail(
		HttpSession session,
		List addressList,
		String subject,
		String text
		)
{
	try
	{
		MailServices.getInstance().sendMail(
				addressList, 
				subject, 
				text
				);
    	this.addMessage(
    			session, 
    			"El eMail informando la operaci&oacute;n ha sido enviado correctamente"
    			);
	}
	catch(Exception exception)
	{
    	this.addError(
    			session, 
    			"Se produjo un error al intentar enviar el eMail informando la operaci&oacute;n"
    			);
    	exception.printStackTrace();
    }
}

//------------------------------------------------------------------------------------------------
public void sendMailToAll(
		HttpSession session,
		String subject,
		String text
		)
{
	try
	{
		MailServices.getInstance().sendMailToAll(
				subject, 
				text
				);
    	this.addMessage(
    			session, 
    			"El eMail informando la operaci&oacute;n ha sido enviado correctamente"
    			);
	}
	catch(Exception exception)
	{
    	this.addError(
    			session, 
    			"Se produjo un error al intentar enviar el eMail informando la operaci&oacute;n"
    			);
    	exception.printStackTrace();
	}
}

//------------------------------------------------------------------------------------------------
public void sendMailToUser(
		HttpSession session,
		User user,
		String subject,
		String text
		)
{
	try
	{
		MailServices.getInstance().sendMailToUser(
				user,
				subject, 
				text
				);
    	this.addMessage(
    			session, 
    			"El eMail informando la operaci&oacute;n ha sido enviado correctamente"
    			);
	}
	catch(Exception exception)
	{
    	this.addError(
    			session, 
    			"Se produjo un error al intentar enviar el eMail informando la operaci&oacute;n"
    			);
    	exception.printStackTrace();
	}
}

//------------------------------------------------------------------------------------------------
public User getUser(
		HttpSession httpSession
		)
{
	return (User) httpSession.getAttribute(User.class.getName());
}

//------------------------------------------------------------------------------------------------
public boolean checkAuthorization(
		HttpSession httpSession,
		String url
		)
{
	return SecurityManager.getInstance().checkAuthorization(
			this.getUser(httpSession), 
			url
			);
}

//------------------------------------------------------------------------------------------------
public void addError(
		HttpSession httpSession, 
		String error
		)
{
	this.getErrorList(httpSession).add(error);
}

//------------------------------------------------------------------------------------------------
public void addMessage(
		HttpSession httpSession, 
		String message
		)
{
	this.getMessageList(httpSession).add(message);
}

//------------------------------------------------------------------------------------------------
public List getErrorList(
		HttpSession httpSession
		)
{
	List errorList = (List) httpSession.getAttribute("errorList");
	if (errorList == null)
	{
		errorList = new ArrayList();
		httpSession.setAttribute(
				"errorList",
				errorList
				);
	}
	return errorList;
}

//------------------------------------------------------------------------------------------------
public List getMessageList(
		HttpSession httpSession
		)
{
	List messageList = (List) httpSession.getAttribute("messageList");
	if (messageList == null)
	{
		messageList = new ArrayList();
		httpSession.setAttribute(
				"messageList",
				messageList
				);
	}
	return messageList;
}

//------------------------------------------------------------------------------------------------
public Collection sortByPosition(
		Collection playerTeamCollection
		)
{
	List sortedPlayerTeamList = new ArrayList(playerTeamCollection);
	Collections.sort(
			sortedPlayerTeamList, 
			PlayerTeam.POSITION_COMPARATOR
			);
	return sortedPlayerTeamList;
}

//------------------------------------------------------------------------------------------------
public Collection sortByNumber(
		Collection playerTeamCollection
		)
{
	List sortedPlayerTeamList = new ArrayList(playerTeamCollection);
	Collections.sort(
			sortedPlayerTeamList, 
			PlayerTeam.NUMBER_COMPARATOR
			);
	return sortedPlayerTeamList;
}
%>
<%
//------------------------------------------------------------------------------------------------
String _TOURNAMENT_NAME = "Clausura&nbsp;2011";
User _USER = this.getUser(session); 

//------------------------------------------------------------------------------------------------
if (_USER != null)
{
%>
<table width="100%">
	<tr id="title" style="background-color: #FFFFFF; color: #0000FF" >
		<td width="1%" rowspan="3">
			<img src="images/AFA.JPG">
		</td>
		<td align="left" valign="top">
			Asociaci&oacute;n de F&uacute;tbol Azuleano
		</td>
		<td width="1%" rowspan="3">
			<img src="images/balon.JPG">
		</td>
	</tr>
	<tr id="title" style="background-color: #FFFFFF; color: #0000FF" >
		<td align="center" valign="middle">
			<h1>Torneo&nbsp;"Fernet Branca"&nbsp;<%=_TOURNAMENT_NAME%></h1>
		</td>
	</tr>
</table>
<%
}
// ------------------------------------------------------------------------------------------------
%>

<%
//------------------------------------------------------------------------------------------------
List errorList = (List) session.getAttribute("errorList");
if (errorList != null && errorList.size() > 0)
{
%>
<table width="100%">
<%
	Iterator errorIterator = errorList.iterator();
	String error = null;
	while (errorIterator.hasNext())
	{
		error = (String) errorIterator.next();
%>
	<tr>
		<td style="background:#FF0000; color:#FFFFFF">
			<li><%=error%>
		</td>
	</tr>
<%
	}
	errorList.clear();
%>
</table>
<%
}
// ------------------------------------------------------------------------------------------------
%>

<%
//------------------------------------------------------------------------------------------------
List messageList = (List) session.getAttribute("messageList");
if (messageList != null && messageList.size() > 0)
{
%>
<table width="100%">
<%
	Iterator messageIterator = messageList.iterator();
	String message = null;
	while (messageIterator.hasNext())
	{
		message = (String) messageIterator.next();
%>
	<tr>
		<td style="background:#32CD32; color:#FFFFFF">
			<li><%=message%>
		</td>
	</tr>
<%
	}
	messageList.clear();
%>
</table>
<%
}
// ------------------------------------------------------------------------------------------------
%>


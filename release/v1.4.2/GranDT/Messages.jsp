<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%!
public void addError(
		HttpSession httpSession, 
		String error
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
	errorList.add(error);
}

public void addMessage(
		HttpSession httpSession, 
		String message
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
	messageList.add(message);
}
%>

<%
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
%>

<%
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
		<td style="background:#00FF00; color:#FFFFFF">
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
%>

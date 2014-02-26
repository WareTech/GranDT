<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 3;

Database.getCurrentSession().beginTransaction();
Criteria userCriteria = Database.getCurrentSession().createCriteria(User.class);
userCriteria.addOrder(Order.asc("lastname")).addOrder(Order.asc("firstname"));
List userList = userCriteria.list();
%>
<html>
	<head>
	    <title>User List</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="<%=colspan%>">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									Usuarios
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridHeader">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						D.T.
					</td>
					<td id="name">
						Equipo
					</td>
				</tr>
<%
if (userList.size() == 0)
{
%>
				<tr id="gridRow1">
					<td colspan="<%=colspan%>">
						No hay elementos
					</td>
				</tr>	
<%
}
else
{
	Iterator userIterator = userList.iterator();
	User user = null;
	int userCount = 0;	
	while (userIterator.hasNext())
	{
		user = (User) userIterator.next();
%>
				<tr id="gridRow<%= userCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="checkbox" id="user_<%=user.getId()%>" name="user_<%=user.getId()%>"/>
					</td>
					<td id="name">
						<a href="UserEdit.jsp?user=<%=user.getId()%>"><%=user.getLastname()%>,&nbsp;<%=user.getFirstname()%></a>
					</td>
					<td id="name">
<%
		if (user.getTeam() == null)
		{
%>
						&nbsp;
<%			
		}
		else
		{
%>		
						<a href="TeamEdit.jsp?team=<%=user.getTeam().getId()%>"><%=user.getTeam().getName()%></a>
<%	
		}
%>
					</td>
				</tr>
<%
	}
}
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							value="create"
							/>
						<input 
							type="submit"
							value="edit"
							/>
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>
<%
Database.getCurrentSession().getTransaction().commit();
%>
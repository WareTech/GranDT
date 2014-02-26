<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 2;

Database.getCurrentSession().beginTransaction();
Criteria clubCriteria = Database.getCurrentSession().createCriteria(Club.class);
clubCriteria.addOrder(Order.asc("name"));
List clubList = clubCriteria.list();
%>
<html>
	<head>
	    <title>Club List</title>
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
									Clubes
								</td>
							</tr>
						</table>
					</td>
				</tr>
<%
if (clubList.size() == 0)
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
	Iterator clubIterator = clubList.iterator();
	Club club = null;
	int clubCount = 0;	
	while (clubIterator.hasNext())
	{
		club = (Club) clubIterator.next();
%>
				<tr id="gridRow<%= clubCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="checkbox" id="club_<%=club.getId()%>" name="club_<%=club.getId()%>"/>
					</td>
					<td id="name">
						<a href="PlayerList.jsp?club=<%=club.getId()%>"><%=club.getName()%></a>
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
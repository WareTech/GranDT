<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
Database.getCurrentSession().beginTransaction();

int colspan = 4;

Criteria teamCriteria = Database.getCurrentSession().createCriteria(Team.class);
teamCriteria.addOrder(Order.asc("category"));
teamCriteria.addOrder(Order.asc("name"));
List teamList = teamCriteria.list();
%>
<html>
	<head>
	    <title>Team List</title>
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
									Equipos
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
						Equipo
					</td>
					<td id="name">
						Categor&iacute;a
					</td>
					<td id="name">
						D.T.
					</td>
				</tr>
<%
if (teamList.size() == 0)
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
	Iterator teamIterator = teamList.iterator();
	Team team = null;
	int teamCount = 0;	
	while (teamIterator.hasNext())
	{
		team = (Team) teamIterator.next();
%>
				<tr id="gridRow<%= teamCount++ % 2 == 0 ? 1 : 2%>" >
					<td id="code" <%=team.getIsClosed().booleanValue() ? "" : "style=\"background-color: #FFFF00\""%>>
						&nbsp;
					</td>
					<td id="name">
<%
		if (team.getIsClosed().booleanValue())
		{
%>
						<a href="TeamEdit.jsp?team=<%=team.getId()%>"><%=team.getName()%></a>
<%
		}
		else if (_USER.getId().longValue() == team.getUser().getId().longValue() || this.checkAuthorization(session, "TeamBuild.jsp!enabled"))
		{
%>
						<a href="TeamBuild.jsp?team=<%=team.getId()%>"><%=team.getName()%></a>&nbsp;(<%=team.getPlayerTeamSet().size()%>)
<%
		}
		else
		{
%>
						<%=team.getName()%>&nbsp;(<%=team.getPlayerTeamSet().size()%>)
<%
		}
%>
					</td>
					<td id="name">
						<%=team.getCategory().getName()%>
					</td>
					<td id="name">
						<a href="UserEdit.jsp?user=<%=team.getUser().getId()%>"><%=team.getUser().getFirstname()%>&nbsp;<%=team.getUser().getLastname()%></a>
					</td>
				</tr>
<%
	}
}
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						&nbsp;
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
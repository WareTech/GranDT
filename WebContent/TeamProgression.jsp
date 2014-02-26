<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
Database.getCurrentSession().beginTransaction();

String teamId = request.getParameter("team");
Team team = (Team) Database.getCurrentSession().get(
		Team.class, 
		new Long(teamId)
		);
List weekList = Database.getCurrentSession().createCriteria(Week.class).list();
Long weekId = (Long) Database.getCurrentSession().createQuery("SELECT MAX(week.id) FROM PositionTeamWeek").uniqueResult();
int colspan = weekList.size() + 1;
%>
<html>
	<head>
	    <title>Team List</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="TeamProgression.jsp" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="<%=colspan%>">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									<a href="PositionEdit.jsp?week=<%=weekId%>">Posiciones</a>
									&nbsp;|&nbsp;
									<select name="team" onchange="javascript:document.forms[0].submit();">
<%
Iterator teamIterator = Database.getCurrentSession().createCriteria(Team.class).addOrder(Order.asc("name")).list().iterator();
Team _team;
while(teamIterator.hasNext())
{
	_team = (Team) teamIterator.next();
%>
										<option value="<%=_team.getId()%>" <%=_team == team ? "selected" : "" %>>
											<%=_team.getName()%>
									
<%
}
%>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#32CD32" width="5%">
						<b>Posici&oacute;n</b>
					</td>
					<td bgcolor="#32CD32" align="center" colspan="<%=colspan%>">
						<b><%=team.getCategory().getName()%></b>
					</td>
				</tr>
<%			
Iterator weekIterator = weekList.iterator();
Week week;

int rowIndex = 0;
PositionTeamWeek positionTeamWeek;
String color;
for(
		int positionIndex = 1; 
		positionIndex  < 11; 
		positionIndex++
		)
{
%>
				<tr>
					<td bgcolor="#32CD32" align="center" width="5%">
						<b><%=positionIndex%></b>
					</td>
<%
	weekIterator = weekList.iterator();
	while(weekIterator.hasNext())
	{
		week = (Week) weekIterator.next();
		positionTeamWeek = (PositionTeamWeek) Database.getCurrentSession().createCriteria(
				PositionTeamWeek.class
				)
				.add(Expression.eq("team", team))
				.add(Expression.eq("week", week))
				.uniqueResult();
		if (positionTeamWeek != null && positionTeamWeek.getPosition().intValue() <= positionIndex)
		{
			if (positionTeamWeek.getPosition().intValue() > 8)
			{
				color = "#FF0000"; 
			}
			else if (
					Category.PRIMERA_A.equals(positionTeamWeek.getTeam().getCategory().getName()) && 
					positionTeamWeek.getPosition().intValue() == 1
					)
			{
				color = "#32CD32";
			}
			else if (
					Category.NACIONAL_B.equals(positionTeamWeek.getTeam().getCategory().getName()) &&
					positionTeamWeek.getPosition().intValue() < 3
					)
			{
				color = "#32CD32";
			}
			else
			{
				color = "#7FFF00";
			}
		}
		else
		{
			color = "#DCDCDC";
		}
%>
					<td bgcolor="<%=color%>" width="5%">
						&nbsp;
					</td>
<%			
	}
%>
				</tr>
<%
}
%>
				<tr>
					<td bgcolor="#32CD32" width="5%" align="center">
						<b>&nbsp;</b>
					</td>
<%
weekIterator = weekList.iterator();
while(weekIterator.hasNext())
{
	week = (Week) weekIterator.next();
%>
					<td bgcolor="#32CD32" align="center" width="5%">
						<b><%=week.getNumber() %>
					</td>
<%			
}
%>
				<tr>
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
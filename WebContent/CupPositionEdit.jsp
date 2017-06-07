<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="ar.com.WareTech.GranDT.middleware.services.Calculator"%>

<%
Configuration configuration = (Configuration) Database.getCurrentSession().get(Configuration.class, Configuration.STARTED);
if (configuration == null || !new Boolean(configuration.getValue()).booleanValue())
{
	this.addError(session, "El torneo a&uacute;n no ha comenzado");
	Database.getCurrentSession().getTransaction().commit();
	response.sendRedirect("TournamentEdit.jsp");
	return;
}

String cupPhaseString = request.getParameter("cupPhase");
CupPhase cupPhase = (CupPhase) Database.getCurrentSession().get(CupPhase.class, new Long(cupPhaseString));

String weekString  = request.getParameter("week");
Week week = (Week) Database.getCurrentSession().get(Week.class, new Long(weekString));

if (CupPhase.PLAYOFF.equals(cupPhase.getType()))
{
	response.sendRedirect("CupPlayOffEdit.jsp?week=" + weekString);
	return;
}

int colspan = 16;
int rowIndex = 0;	

Criteria cupGroupPositionTeamWeekCriteria = Database.getCurrentSession().createCriteria(CupGroupPositionTeamWeek.class);
cupGroupPositionTeamWeekCriteria.add(Expression.eq("week", week));
cupGroupPositionTeamWeekCriteria.addOrder(Order.asc("group"));
cupGroupPositionTeamWeekCriteria.addOrder(Order.asc("position"));
Iterator cupGroupPositionTeamWeekIterator = cupGroupPositionTeamWeekCriteria.list().iterator();
%>
<html>
	<head>
	    <title>Position List</title>
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
									<a href="PositionList.jsp">Posiciones</a>
									&nbsp;|&nbsp;
<%
if (week.getNumber().intValue() > 1)
{
%>
									&nbsp;<a href="PositionEdit.jsp?week=<%=week.getId().longValue() - 1%>"><</a>&nbsp;
<%
}
%>
									Fecha&nbsp;<%=week.getNumber()%>
<%
if (week.getNumber().intValue() < 19)
{
%>
									&nbsp;<a href="PositionEdit.jsp?week=<%=week.getId().longValue() + 1%>">></a>&nbsp;
<%
}
%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
<%
CupGroupPositionTeamWeek cupGroupPositionTeamWeek = null;
CupGroup cupGroup = null;
while (cupGroupPositionTeamWeekIterator.hasNext())
{
	rowIndex = 1;	
	cupGroupPositionTeamWeek = (CupGroupPositionTeamWeek) cupGroupPositionTeamWeekIterator.next();
	
	if (cupGroup == null || !cupGroup.getName().equals(cupGroupPositionTeamWeek.getGroup().getName()))
	{
%>
				<tr id="buttonBar">
					<td id="code" colspan="<%=colspan%>">
						<b><%=cupGroupPositionTeamWeek.getGroup().getName()%></b>
					</td>
				</tr>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<b>#</b>
					</td>
					<td id="name">
						<b>Equipo</b>
					</td>
					<td id="code">
						<b>Pts.</b>
					</td>
					<td id="code">
						<b>J</b>
					</td>
					<td id="code">
						<b>G</b>
					</td>
					<td id="code">
						<b>E</b>
					</td>
					<td id="code">
						<b>P</b>
					</td>
					<td id="code">
						<b>GF</b>
					</td>
					<td id="code">
						<b>GC</b>
					</td>
					<td id="code">
						<b>Dif.</b>
					</td>
					<td id="code">
						&nbsp;
					</td>
				</tr>
<%
	}
%>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<%=cupGroupPositionTeamWeek.getPosition()%>
					</td>
					<td id="name">
						<%=cupGroupPositionTeamWeek.getTeam().getName()%>
					</td>
					<td id="code">
						<%=cupGroupPositionTeamWeek.getPoints()%>
					</td>
					<td id="code">
						<%=cupGroupPositionTeamWeek.getPlayed()%>
					</td>
					<td id="code">
						<%=cupGroupPositionTeamWeek.getWins()%>
					</td>
					<td id="code">
						<%=cupGroupPositionTeamWeek.getDraws()%>
					</td>
					<td id="code">
						<%=cupGroupPositionTeamWeek.getLoses()%>
					</td>
					<td id="code">
						<%=cupGroupPositionTeamWeek.getGoalsIn()%>
					</td>
					<td id="code">
						<%=cupGroupPositionTeamWeek.getGoalsOut()%>
					</td>
					<td id="code">
						<%=cupGroupPositionTeamWeek.getGoalsIn().intValue() - cupGroupPositionTeamWeek.getGoalsOut().intValue()%>
					</td>
				</tr>
<%
	cupGroup = cupGroupPositionTeamWeek.getGroup();
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

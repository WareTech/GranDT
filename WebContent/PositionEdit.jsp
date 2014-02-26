<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="ar.com.WareTech.GranDT.middleware.services.Calculator"%>
<%
int colspan = 7;
int rowIndex = 0;	

String weekString = request.getParameter("week");

Database.getCurrentSession().beginTransaction();

Configuration configuration = (Configuration) Database.getCurrentSession().get(Configuration.class, new Long(1));
if (configuration == null || !new Boolean(configuration.getValue()).booleanValue())
{
	this.addError(session, "El torneo a&uacute;n no ha comenzado");
	Database.getCurrentSession().getTransaction().commit();
	response.sendRedirect("TournamentEdit.jsp");
	return;
}

Week week = (Week) Database.getCurrentSession().get(Week.class, new Long(weekString));
Criteria positionTeamWeekCriteria = Database.getCurrentSession().createCriteria(PositionTeamWeek.class);
positionTeamWeekCriteria.add(Expression.eq("week", week));
positionTeamWeekCriteria.addOrder(Order.asc("position"));
List positionTeamWeekList = positionTeamWeekCriteria.list();
Iterator categoryIterator = Database.getCurrentSession().createCriteria(Category.class).list().iterator();
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
Category category;
while(categoryIterator.hasNext())
{
	rowIndex = 1;	
	category = (Category) categoryIterator.next();
%>
				<tr id="buttonBar">
					<td id="code" colspan="<%=colspan%>">
						<b><%=category.getName()%></b>
					</td>
				</tr>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code" colspan="2">
						<b>Posici&oacute;n</b>
					</td>
					<td id="name">
						<b>Equipo</b>
					</td>
					<td id="code">
						<b>Puntos</b>
					</td>
					<td id="code">
						<b>Dif.</b>
					</td>
					<td id="code">
						<b>Prom.</b>
					</td>
					<td id="code">
						<b>Fecha</b>
					</td>
				</tr>
<%
	if (positionTeamWeekList.size() == 0)
	{
%>
					<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
						<td colspan="<%=colspan%>">
							No hay elementos
						</td>
					</tr>	
<%
	}
	else
	{
		Iterator positionTeamWeekIterator = positionTeamWeekList.iterator();
		PositionTeamWeek positionTeamWeek;
		Integer  lastWeekPositionTeamWeek = null;
		Integer  differencePositionTeamWeek = null;
		PositionTeamWeek previousPositionTeamWeek = null;
		while (positionTeamWeekIterator.hasNext())
		{
			positionTeamWeek = (PositionTeamWeek) positionTeamWeekIterator.next();

			if (!positionTeamWeek.getTeam().getCategory().getId().equals(category.getId()))
			{
				continue;
			}

			lastWeekPositionTeamWeek = (Integer) Database.getCurrentSession().createQuery(
					"SELECT position FROM PositionTeamWeek WHERE team = :team AND week = :week"
					)
					.setEntity("team", positionTeamWeek.getTeam())
					.setInteger("week", positionTeamWeek.getWeek().getId().intValue() - 1)
					.uniqueResult();
			differencePositionTeamWeek = new Integer(lastWeekPositionTeamWeek == null ? 0 : lastWeekPositionTeamWeek.intValue() - positionTeamWeek.getPosition().intValue());  
%>
				<tr id="<%=positionTeamWeek.getPosition().intValue() > 8 ? "error" : "gridRow" + (rowIndex++ % 2 == 0 ? 1 : 2)%>">
					<td id="code">
						<%=positionTeamWeek.getPosition()%>
					</td>
					<td id="code">
						<a href="TeamProgression.jsp?team=<%=positionTeamWeek.getTeam().getId()%>"><%=differencePositionTeamWeek.intValue() == 0 ? "=" : (differencePositionTeamWeek.intValue() > 0 ? "+" : "") + differencePositionTeamWeek%></a>
					</td>
					<td id="name">
						<a href="PositionTeamWeekEdit.jsp?positionTeamWeek=<%=positionTeamWeek.getId()%>"><%=positionTeamWeek.getTeam().getName()%></a>
					</td>
					<td id="code">
						<%=Calculator.decimalFormat.format(positionTeamWeek.getPoints())%>
					</td>
					<td id="code">
						<%=previousPositionTeamWeek == null ? "&nbsp;" : Calculator.decimalFormat.format(previousPositionTeamWeek.getPoints().doubleValue() - positionTeamWeek.getPoints().doubleValue()).toString()%>
					</td>
					<td id="code">
						<%=Calculator.decimalFormat.format(positionTeamWeek.getPoints().doubleValue() / (positionTeamWeek.getWeek().getNumber().intValue()))%>
					</td>
					<td id="code">
						<%=positionTeamWeek.getWeekPoints() == null ? "&nbsp;" : Calculator.decimalFormat.format(positionTeamWeek.getWeekPoints())%>
					</td>
				</tr>
<%
			previousPositionTeamWeek = positionTeamWeek;
		}
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
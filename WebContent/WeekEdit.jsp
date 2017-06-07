<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="ar.com.WareTech.GranDT.middleware.services.Calculator"%>
<%
int colspan = 4;

String weekString = request.getParameter("week");

Week week = (Week) Database.getCurrentSession().get(Week.class, new Long(weekString));

if (request.getParameter("calculate") != null)
{
	Calculator.getInstance().calculateWeek(week);
	Calculator.getInstance().calculatePositionForWeek(week);
	
	week.setIsCalculated(Boolean.TRUE);
	Database.getCurrentSession().update(week);
	
	ApplicationContext.getInstance().update(ApplicationContext.CURRENT_WEEK, week.getId().toString());
	
	this.addMessage(session, "La fecha fue calculada correctamente");

	if (request.getParameter("sendMail") != null)
	{
	    StringBuffer stringBuffer = new StringBuffer();
	    User user = this.getUser(session);
	    stringBuffer.append("La fecha #").append(week.getNumber()).append(" ha sido recalculada por ").append(user.getFirstname()).append(" ").append(user.getLastname());
		stringBuffer.append("\nLas posiciones han quedado conformadas del siguiente modo:");
		Iterator positionTeamWeekIterator = Database.getCurrentSession().createCriteria(
				PositionTeamWeek.class
				)
				.add(Expression.eq("week", week))
				.addOrder(Order.asc("category"))
				.addOrder(Order.asc("position"))
				.list().iterator();
		PositionTeamWeek positionTeamWeek;
		Category category = null;
		while(positionTeamWeekIterator.hasNext())
		{
			positionTeamWeek = (PositionTeamWeek) positionTeamWeekIterator.next();
			if (positionTeamWeek.getCategory() != category)
			{
				stringBuffer.append("\n\n");
				stringBuffer.append(positionTeamWeek.getCategory().getName());
				category = positionTeamWeek.getCategory();
			}
			stringBuffer.append("\n");
			stringBuffer.append(positionTeamWeek.getPosition());
			stringBuffer.append(") ");
			stringBuffer.append(positionTeamWeek.getTeam().getName());
			stringBuffer.append(" (");
			stringBuffer.append(positionTeamWeek.getPoints());
			stringBuffer.append(" pts.)");
		}
	    stringBuffer.append("\n\nPara obtener mas información, acceda a http://GranDT.WareTech.com.ar");
	    stringBuffer.append("\n\nGerencia de Sistemas del GranDT");
		stringBuffer.append("\nComunidad Azuliana");
		stringBuffer.append("\nRepública Bolivariana de Robinson");
		
		this.sendMailToAll(
				session, 
				"GranDT - Fecha #" + week.getNumber() + " recalculada!",
				stringBuffer.toString()
				);
	}
}

%>
<%@page import="org.hibernate.criterion.Expression"%>
<%@page import="org.hibernate.criterion.Order"%>
<html>
	<head>
	    <title>Match List</title>
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
									<a href="WeekList.jsp">Fechas</a>
									&nbsp;|&nbsp;
<%
if (week.getNumber().intValue() > 1)
{
%>
									&nbsp;<a href="WeekEdit.jsp?week=<%=week.getId().longValue() - 1%>"><</a>&nbsp;
<%
}
%>
									Fecha&nbsp;<%=week.getNumber()%>
<%
if (week.getNumber().intValue() < 19)
{
%>
									&nbsp;<a href="WeekEdit.jsp?week=<%=week.getId().longValue() + 1%>">></a>&nbsp;
<%
}
%>
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
						Local
					</td>
					<td id="code">
						Resultado
					</td>
					<td id="name">
						Visitante
					</td>
				</tr>
<%
Iterator matchIterator = week.getMatchSet().iterator();
Match match;
int rowCount = 0;
while (matchIterator.hasNext())
{
	match = (Match) matchIterator.next();
%>
				<tr id="gridRow<%=(rowCount++ % 2) + 1%>">
					<td id="code">
						<input type="checkbox" id="match_<%=match.getId()%>" name="match_<%=match.getId()%>"/>
					</td>
					<td id="name">
						<a href="PlayerList.jsp?club=<%=match.getHomeClub().getId()%>"><%=match.getHomeClub().getName()%></a>
					</td>
					<td id="code">
						<a href="MatchEdit.jsp?match=<%=match.getId()%>&club=<%=match.getHomeClub().getId()%>"><%=match.getHomeGoals() == null ? "vs." : "" + match.getHomeGoals() + "-" + match.getAwayGoals()%></a>
					</td>
					<td id="name">
						<a href="PlayerList.jsp?club=<%=match.getAwayClub().getId()%>"><%=match.getAwayClub().getName()%></a>
					</td>
				</tr>
<%
}
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="create"
							value="Crear"
							/>
						<input 
							type="submit"
							name="edit"
							value="Editar"
							/>
						&nbsp;<b>|</b>&nbsp;
						<input 
							type="submit"
							name="calculate"
							value="Calcular"
							<%=this.checkAuthorization(session, "WeekEdit.jsp!change") ? "" : "disabled" %>
							/>
						&nbsp;
						<input type="checkbox" name="sendMail" <%=this.checkAuthorization(session, "WeekEdit.jsp!change") ? "" : "disabled" %>>
						Enviar eMail informando el calculo de la fecha?
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>

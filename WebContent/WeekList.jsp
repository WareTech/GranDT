<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 2;

if (request.getParameter("tournamentStart") != null)
{
	Database.getCurrentSession().createSQLQuery(
			"UPDATE player SET selected = 1 WHERE id IN (SELECT DISTINCT(player) FROM playerteam PT WHERE NOT(isList))"
			)
			.executeUpdate();
	ApplicationContext.getInstance().update(
			ApplicationContext.TOURNAMENT_STARTED, 
			Boolean.TRUE.toString()
			);
	ApplicationContext.getInstance().update(
			ApplicationContext.CURRENT_WEEK, 
			Database.getCurrentSession().createSQLQuery("SELECT MIN(id) FROM Week").uniqueResult().toString()
			);
	Database.getCurrentSession().flush();

	this.addMessage(
			session, 
			"El Torneo \"Fernet Branca\" " + ApplicationContext.getInstance().get(ApplicationContext.TOURNAMENT_NAME) + " ha comenzado!"
			);
	this.sendMailToAll(
			session, 
			"El Torneo \"Fernet Branca\" " + ApplicationContext.getInstance().get(ApplicationContext.TOURNAMENT_NAME) + " ha comenzado!"
			, 
			""
			);
}
else if (request.getParameter("weekClose") != null)
{
	String weekId = request.getParameter("week");
	if (weekId == null)
	{
		this.addError(
				session, 
				"Debe seleccionar una fecha"
				);
	}
	else
	{
		Week week = (Week) Database.getCurrentSession().get(Week.class, new Long(weekId));
		week.setIsOpened(Boolean.FALSE);
		Database.getCurrentSession().update(week);
		Database.getCurrentSession().flush();

		this.addMessage(
				session, 
				"La fecha #" + week.getNumber() + " ha sido cerrada"
				);
	}
}
else if (request.getParameter("weekOpen") != null)
{
	String weekId = request.getParameter("week");
	if (weekId == null)
	{
		this.addError(
				session, 
				"Debe seleccionar una fecha"
				);
	}
	else
	{
		Week week = (Week) Database.getCurrentSession().get(Week.class, new Long(weekId));
		week.setIsOpened(Boolean.TRUE);
		Database.getCurrentSession().update(week);
		Database.getCurrentSession().flush();

		this.addMessage(
				session, 
				"La fecha #" + week.getNumber() + " ha sido abierta"
				);
	}
}

Criteria weekCriteria = Database.getCurrentSession().createCriteria(Week.class);
weekCriteria.addOrder(Order.asc("number"));
List weekList = weekCriteria.list();
%>
<html>
	<head>
	    <title>Week List</title>
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
									Fechas
								</td>
							</tr>
						</table>
					</td>
				</tr>
<%
if (weekList.size() == 0)
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
	Iterator weekIterator = weekList.iterator();
	Week week = null;
	int weekCount = 0;	
	while (weekIterator.hasNext())
	{
		week = (Week) weekIterator.next();
%>
				<tr id="gridRow<%= weekCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
<%
		if (week.getIsCalculated().booleanValue())
		{
%>
			<img src="images/week_played.png" width="18" height="18"/>
<%
		}
		else if (week.getIsOpened().booleanValue())
		{
%>
			<img src="images/week_closed.png" width="18" height="18"/>
<%
		}
		else
		{
%>
						<input type="radio" id="week_<%=week.getId()%>" name="week" value="<%=week.getId()%>"/>
<%
		}
%>
					</td>
					<td id="name">
						<a href="WeekEdit.jsp?week=<%=week.getId()%>">Fecha&nbsp;<%=week.getNumber()%></a>
					</td>
				</tr>
<%
	}
}

boolean tournamentStarted = Boolean.valueOf((String) ApplicationContext.getInstance().get(ApplicationContext.TOURNAMENT_STARTED)).booleanValue();
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="tournamentStart"
							value="Comenzar Torneo!"
							onclick="javascript: return confirm('Está seguro que desea comenzar el torneo?');"
							<%=!tournamentStarted && this.checkAuthorization(session, "WeekList.jsp!tournamentStart") ? "" : "disabled" %>
							/>
						&nbsp;<b>|</b>&nbsp;
						<input 
							type="submit"
							name="weekClose"
							value="Cerrar"
							onclick="javascript: return confirm('Está seguro que desea cerrar la fecha?');"
							<%=tournamentStarted && this.checkAuthorization(session, "WeekList.jsp!weekClose") ? "" : "disabled" %>
							/>
						&nbsp;
						<input 
							type="submit"
							name="weekOpen"
							value="Abrir &uacute;ltima fecha"
							<%=tournamentStarted && this.checkAuthorization(session, "WeekList.jsp!weekOpen") ? "" : "disabled" %>
							/>
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>

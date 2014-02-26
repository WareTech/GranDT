<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="ar.com.WareTech.GranDT.middleware.services.Calculator"%>
<%
int colspan = 17;
int maxGoalsCount = 11;
final Double[] olePointsList = {new Double(10D), new Double(9.5D),  new Double(9D), new Double(8.5D),  new Double(8D), new Double(7.5D), new Double(7D), new Double(6.5D),  new Double(6D), new Double(5.5D),  new Double(5D), new Double(4.5D),  new Double(4D), new Double(3.5D),  new Double(3D), new Double(2.5D),  new Double(2D), new Double(1.5D), new Double(1D)};
Database.getCurrentSession().beginTransaction();

boolean authorized = this.checkAuthorization(session, "MatchEdit.jsp!enabled");

Match match = (Match) Database.getCurrentSession().get(Match.class, new Long(request.getParameter("match")));
Club club = (Club) Database.getCurrentSession().get(Club.class, new Long(request.getParameter("club")));

if (request.getParameter("save") != null)
{
	Iterator playerIterator = club.getPlayerSet().iterator();
	Player player;
	PlayerMatch playerMatch;
	String temp;
	while (playerIterator.hasNext())
	{
		player = (Player) playerIterator.next();
		playerMatch = match.getPlayerMatchForPlayer(player);
		
		temp = request.getParameter("olePoints_" + player.getId());
		if (temp == null || "".equals(temp))
		{
			if (playerMatch != null)
			{
				Database.getCurrentSession().delete(playerMatch);
				match.getPlayerMatchSet().remove(playerMatch);
			}
			continue;
		}
		
		if (playerMatch == null)
		{
			playerMatch = new PlayerMatch();
			playerMatch.setPlayer(player);
			playerMatch.setMatch(match);
			match.getPlayerMatchSet().add(playerMatch);
		}
		
		playerMatch.setOlePoints(new Double(temp));

		temp = request.getParameter("cleanGoal_" + player.getId());
		playerMatch.setCleanGoal(new Boolean(temp != null));
		
		temp = request.getParameter("recivedGoals_" + player.getId());
		if (temp == null || "".equals(temp))
		{
			playerMatch.setRecivedGoals(null);
		}
		else
		{
			playerMatch.setRecivedGoals(new Integer(temp));
		}
		
		temp = request.getParameter("mom_" + player.getId());
		playerMatch.setMom(new Boolean(temp != null));
		
		temp = request.getParameter("goals_" + player.getId());
		if (temp != null && !"".equals(temp))
		{
			playerMatch.setGoals(new Integer(temp));
		}
		
		temp = request.getParameter("penaltyGoals_" + player.getId());
		if (temp != null && !"".equals(temp))
		{
			playerMatch.setPenaltyGoals(new Integer(temp));
		}
		
		temp = request.getParameter("freeKickGoals_" + player.getId());
		if (temp != null && !"".equals(temp))
		{
			playerMatch.setFreeKickGoals(new Integer(temp));
		}
		
		temp = request.getParameter("ownGoals_" + player.getId());
		if (temp != null && !"".equals(temp))
		{
			playerMatch.setOwnGoals(new Integer(temp));
		}
		
		temp = request.getParameter("missedPenalties_" + player.getId());
		if (temp != null && !"".equals(temp))
		{
			playerMatch.setMissedPenalties(new Integer(temp));
		}
		
		temp = request.getParameter("cachedPenalties_" + player.getId());
		if (temp != null && !"".equals(temp))
		{
			playerMatch.setCachedPenalties(new Integer(temp));
		}
		
		temp = request.getParameter("yellowCard_" + player.getId());
		playerMatch.setYellowCard(new Boolean(temp != null));
		
		temp = request.getParameter("redCard_" + player.getId());
		playerMatch.setRedCard(new Boolean(temp != null));
		
		playerMatch.calculate();
		
		Database.getCurrentSession().saveOrUpdate(playerMatch);
	}
	
	temp = request.getParameter("homeGoals");
	match.setHomeGoals(new Integer(temp == null ? "0" : temp));
	
	temp = request.getParameter("awayGoals");
	match.setAwayGoals(new Integer(temp == null ? "0" : temp));
	
	Database.getCurrentSession().saveOrUpdate(match);
	
	Database.getCurrentSession().flush();
	
	this.addMessage(
			session,
			"Datos actualizados"
			);
}

Criteria playerCriteria = Database.getCurrentSession().createCriteria(Player.class);
playerCriteria.add(Expression.eq("club", (club)));
playerCriteria.addOrder(Order.asc("position")).addOrder(Order.asc("lastname")).addOrder(Order.asc("firstname"));
List playerList = playerCriteria.list();
%>
<html>
	<head>
	    <title>Match Edit</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
		<script src="MatchEdit.js"></script>
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
									<a href="WeekEdit.jsp?week=<%=match.getWeek().getId()%>">Fecha&nbsp;<%=match.getWeek().getNumber()%></a>
									&nbsp;|&nbsp;
<%
if (match.getHomeClub().getId().equals(club.getId()))
{
%>
									<b><%=match.getHomeClub().getName()%></b>
<%
}
else
{
%>
									<a href="MatchEdit.jsp?match=<%=match.getId()%>&club=<%=match.getHomeClub().getId()%>"><%=match.getHomeClub().getName()%></a>
<%
}
%>
									&nbsp;
									<select id="homeGoals" name="homeGoals" <%=authorized ? "" : "disabled"%>>
<%
	for (
			int goalsIndex = 0; 
			goalsIndex < maxGoalsCount; 
			goalsIndex++
			)
	{
%>
										<option value="<%=goalsIndex%>" <%=match.getHomeGoals() == null && goalsIndex == 0 ? "selected" : (match.getHomeGoals() != null && match.getHomeGoals().intValue() == goalsIndex ? "selected" : "")%>><%=goalsIndex%>
<%
	}
%>
									</select>
									&nbsp;-&nbsp;
									<select id="awayGoals" name="awayGoals" <%=authorized ? "" : "disabled"%>>
<%
	for (
			int goalsIndex = 0; 
			goalsIndex < maxGoalsCount; 
			goalsIndex++
			)
	{
%>
										<option value="<%=goalsIndex%>" <%=match.getAwayGoals() == null && goalsIndex == 0 ? "selected" : (match.getAwayGoals() != null && match.getAwayGoals().intValue() == goalsIndex ? "selected" : "")%>><%=goalsIndex%>
<%
	}
%>
									</select>
									&nbsp;
<%
	if (match.getAwayClub().getId().equals(club.getId()))
	{
%>
									<b><%=match.getAwayClub().getName()%></b>
<%
	}
	else
	{
%>
									<a href="MatchEdit.jsp?match=<%=match.getId()%>&club=<%=match.getAwayClub().getId()%>"><%=match.getAwayClub().getName()%></a>
<%
	}
%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridHeader">
					<td id="code" rowspan="2">
						N&uacute;mero
					</td>
					<td id="name" rowspan="2">
						Apellido
					</td>
					<td id="name" rowspan="2">
						Nombre
					</td>
					<td id="name" rowspan="2">
						Posici&oacute;n
					</td>
					<td id="code" rowspan="2">
						Puntaje
					</td>
					<td id="code" rowspan="2">
						Figura
					</td>
					<td id="code" rowspan="2">
						Valla invicta
					</td>
					<td id="code" rowspan="2">
						Goles recibidos
					</td>
					<td id="code" rowspan="2">
						Penales atajados
					</td>
					<td id="code" colspan="4">
						Goles
					</td>
					<td id="code" rowspan="2">
						Penales errados
					</td>
					<td id="code" rowspan="2">
						Tarjeta amarilla
					</td>
					<td id="code" rowspan="2">
						Tarjeta roja
					</td>
					<td id="code" rowspan="2">
						Total
					</td>
				</tr>
				<tr id="gridHeader">
					<td id="code">
						de jugada
					</td>
					<td id="code">
						de penal
					</td>
					<td id="code">
						de tiro libre
					</td>
					<td id="code">
						en contra
					</td>
				</tr>
<%
	if (playerList.size() == 0)
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
		PlayerMatch playerMatch = null;
		Iterator playerIterator = playerList.iterator();
		Player player = null;
		int plyerCount = 0;	
		while (playerIterator.hasNext())
		{
			player = (Player) playerIterator.next();
			if (!player.getSelected().booleanValue())
			{
				continue;
			}
			playerMatch = match.getPlayerMatchForPlayer(player);
	%>
				<tr id="gridRow<%= plyerCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<%=player.getNumber() == null ? "" : player.getNumber().toString()%>
					</td>
					<td id="name">
						<%=player.getLastname()%>
					</td>
					<td id="name">
						<%=player.getFirstname()%>
					</td>
					<td id="name">
						<%=player.getPosition().getName()%>
					</td>
					<td id="code">
						<select 
							id="olePoints_<%=player.getId()%>"
							name="olePoints_<%=player.getId()%>"
							onchange="javascript:setEnabled(<%=player.getId()%>, (this.value == ''));"
							<%=authorized ? "" : "disabled"%>
							>
							<option value="" <%=playerMatch == null ? "selected" : ""%>>
<%
			for (
					int olePointsIndex = 0; 
					olePointsIndex < olePointsList.length; 
					olePointsIndex++
					)
			{
%>
							<option value="<%=olePointsList[olePointsIndex]%>" <%=playerMatch != null && playerMatch.getOlePoints().equals(olePointsList[olePointsIndex]) ? "selected" : ""%>><%=Calculator.decimalFormat.format(olePointsList[olePointsIndex])%>
<%
			}
%>
						</select>
					</td>
					<td id="code">
						<input 
							type="checkbox" 
							id="mom_<%=player.getId()%>" 
							name="mom_<%=player.getId()%>" 
							<%=playerMatch == null ? "disabled" : ""%>
							<%=playerMatch != null && playerMatch.getMom() != null && playerMatch.getMom().booleanValue() ? "checked" : ""%>
							<%=authorized ? "" : "disabled"%>
							/>
					</td>
					<td id="code">
						<input 
							type="checkbox" 
							id="cleanGoal_<%=player.getId()%>" 
							name="cleanGoal_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=playerMatch != null && playerMatch.getCleanGoal() != null && playerMatch.getCleanGoal().booleanValue() ? "checked" : ""%>
							onchange="javascript:document.getElementById('recivedGoals_<%=player.getId()%>').disabled = this.checked;"
							<%=authorized ? "" : "disabled"%>
							/>
					</td>
					<td id="code">
						<select 
							id="recivedGoals_<%=player.getId()%>" 
							name="recivedGoals_<%=player.getId()%>"
							<%=playerMatch == null || (playerMatch.getCleanGoal() != null && playerMatch.getCleanGoal().booleanValue()) ? "disabled" : ""%>
							<%=authorized ? "" : "disabled"%>
							 >
<%
			for (
					int recivedIndex = 0; 
					recivedIndex < maxGoalsCount; 
					recivedIndex++
					)
			{
%>
							<option value="<%=recivedIndex%>" <%=playerMatch == null && recivedIndex == 0 ? "selected" : (playerMatch != null && playerMatch.getRecivedGoals() != null && playerMatch.getRecivedGoals().intValue() == recivedIndex ? "selected" : "")%>><%=recivedIndex%>
<%
			}
%>
						</select>
					</td>
					<td id="code">
						<select 
							id="cachedPenalties_<%=player.getId()%>" 
							name="cachedPenalties_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=authorized ? "" : "disabled"%>
							>
<%
			for (
					int cachedPenaltiesIndex = 0; 
					cachedPenaltiesIndex < 9; 
					cachedPenaltiesIndex++
					)
			{
%>
							<option value="<%=cachedPenaltiesIndex%>" <%=playerMatch == null && cachedPenaltiesIndex == 0 ? "selected" : (playerMatch != null && playerMatch.getCachedPenalties() != null && playerMatch.getCachedPenalties().intValue() == cachedPenaltiesIndex ? "selected" : "")%>><%=cachedPenaltiesIndex%>
<%
			}
%>
						</select>
					</td>
					<td id="code">
						<select 
							id="goals_<%=player.getId()%>" 
							name="goals_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=authorized ? "" : "disabled"%>
							>
<%
			for (
					int goalsIndex = 0; 
					goalsIndex < maxGoalsCount; 
					goalsIndex++
					)
			{
%>
							<option value="<%=goalsIndex%>" <%=playerMatch == null && goalsIndex == 0 ? "selected" : (playerMatch != null && playerMatch.getGoals() != null && playerMatch.getGoals().intValue() == goalsIndex ? "selected" : "")%>><%=goalsIndex%>
<%
			}
%>
						</select>
					</td>
					<td id="code">
						<select 
							id="penaltyGoals_<%=player.getId()%>" 
							name="penaltyGoals_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=authorized ? "" : "disabled"%>
							>
<%
			for (
					int penaltyGoalsIndex = 0; 
					penaltyGoalsIndex < maxGoalsCount; 
					penaltyGoalsIndex++
					)
			{
%>
							<option value="<%=penaltyGoalsIndex%>" <%=playerMatch == null && penaltyGoalsIndex == 0 ? "selected" : (playerMatch != null && playerMatch.getPenaltyGoals() != null && playerMatch.getPenaltyGoals().intValue() == penaltyGoalsIndex ? "selected" : "")%>><%=penaltyGoalsIndex%>
<%
			}
%>
						</select>
					</td>
					<td id="code">
						<select 
							id="freeKickGoals_<%=player.getId()%>" 
							name="freeKickGoals_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=authorized ? "" : "disabled"%>
							>
<%
			for (
					int freeKickGoalsIndex = 0; 
					freeKickGoalsIndex < maxGoalsCount; 
					freeKickGoalsIndex++
					)
			{
%>
							<option value="<%=freeKickGoalsIndex%>" <%=playerMatch == null && freeKickGoalsIndex == 0 ? "selected" : (playerMatch != null && playerMatch.getFreeKickGoals() != null && playerMatch.getFreeKickGoals().intValue() == freeKickGoalsIndex ? "selected" : "")%>><%=freeKickGoalsIndex%>
<%
			}
%>
						</select>
					</td>
					<td id="code">
						<select 
							id="ownGoals_<%=player.getId()%>" 
							name="ownGoals_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=authorized ? "" : "disabled"%>
							>
<%
			for (
					int ownGoalsIndex = 0; 
					ownGoalsIndex < maxGoalsCount; 
					ownGoalsIndex++
					)
			{
%>
							<option value="<%=ownGoalsIndex%>" <%=playerMatch == null && ownGoalsIndex == 0 ? "selected" : (playerMatch != null && playerMatch.getOwnGoals() != null && playerMatch.getOwnGoals().intValue() == ownGoalsIndex ? "selected" : "")%>><%=ownGoalsIndex%>
<%
			}
%>
						</select>
					</td>
					<td id="code">
						<select 
							id="missedPenalties_<%=player.getId()%>" 
							name="missedPenalties_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=authorized ? "" : "disabled"%>
							>
<%
			for (
					int missedPenaltiesIndex = 0; 
					missedPenaltiesIndex < maxGoalsCount; 
					missedPenaltiesIndex++
					)
			{
%>
							<option value="<%=missedPenaltiesIndex%>" <%=playerMatch == null && missedPenaltiesIndex == 0 ? "selected" : (playerMatch != null && playerMatch.getMissedPenalties() != null && playerMatch.getMissedPenalties().intValue() == missedPenaltiesIndex ? "selected" : "")%>><%=missedPenaltiesIndex%>
<%
			}
%>
						</select>
					</td>
					<td id="code">
						<input 
							type="checkbox" 
							id="yellowCard_<%=player.getId()%>" 
							name="yellowCard_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=playerMatch != null && playerMatch.getYellowCard() != null && playerMatch.getYellowCard().booleanValue() ? "checked" : ""%>
							<%=authorized ? "" : "disabled"%>
							/>
					</td>
					<td id="code">
						<input 
							type="checkbox" 
							id="redCard_<%=player.getId()%>" 
							name="redCard_<%=player.getId()%>"
							<%=playerMatch == null ? "disabled" : ""%>
							<%=playerMatch != null && playerMatch.getRedCard() != null && playerMatch.getRedCard().booleanValue() ? "checked" : ""%>
							<%=authorized ? "" : "disabled"%>
							/>
					</td>
					<td id="code">
						<b><%=playerMatch == null ? "" : "" + Calculator.decimalFormat.format(playerMatch.getTotalPoints())%></b>
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
							name="save"
							value="Guardar"
							<%=authorized ? "" : "disabled"%>
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
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 6;
int rowIndex = 0;	

String positionTeamWeekString = request.getParameter("positionTeamWeek");

PositionTeamWeek positionTeamWeek = (PositionTeamWeek) Database.getCurrentSession().get(PositionTeamWeek.class, new Long(positionTeamWeekString));
%>
<html>
	<head>
	    <title>PositionTeamWeek List</title>
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
									<a href="PositionEdit.jsp?week=<%=positionTeamWeek.getWeek().getId()%>">Fecha&nbsp;<%=positionTeamWeek.getWeek().getNumber()%></a>
									&nbsp;|&nbsp;
									<%=positionTeamWeek.getTeam().getName()%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="name">
						Jugador
					</td>
					<td id="code">
						Capit&aacute;n
					</td>
					<td id="name">
						Puesto
					</td>
					<td id="code">
						Calificaci&oacute;n
					</td>
					<td id="name">
						Club
					</td>
					<td id="code">
						Puntaje
					</td>
				</tr>
<%
if (positionTeamWeek.getTeam().getPlayerTeamSet().size() == 0)
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
%>
	<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
		<td id="name" colspan="<%=colspan%>">
			<b>Titulares</b>
		</td>
	</tr>
<%
	Iterator playerTeamIterator = this.sortByPosition(positionTeamWeek.getTeam().getPrincipalPlayerTeamList()).iterator();
	PlayerTeam playerTeam;
	PlayerTeamWeek playerTeamWeek;
	while (playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
		playerTeamWeek = (PlayerTeamWeek) Database.getCurrentSession().createCriteria(PlayerTeamWeek.class)
			.add(Expression.eq("playerteam", playerTeam))
			.add(Expression.eq("week", positionTeamWeek.getWeek()))
			.uniqueResult();
%>
			<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
				<td id="name">
					<%=playerTeam.getPlayer().getLastname()%>,&nbsp;<%=playerTeam.getPlayer().getFirstname()%>
				</td>
				<td id="code">
					<%=Boolean.TRUE.equals(playerTeam.getIsCaptain1()) ? "C1" : Boolean.TRUE.equals(playerTeam.getIsCaptain2()) ? "C2" : Boolean.TRUE.equals(playerTeam.getIsCaptain3()) ? "C3" : ""%>
				</td>
				<td id="code">
					<%=playerTeam.getPlayer().getPosition().getName()%>
				</td>
				<td id="code">
					<%=playerTeam.getPlayer().getValue()%>
				</td>
				<td id="name">
					<%=playerTeam.getPlayer().getClub().getName()%>
				</td>
				<td id="code">
					<%=Boolean.TRUE.equals(playerTeamWeek.getPlays()) ? "<b>" : "<s>"%>
					<%=playerTeamWeek.getPoints() == null ? "" : playerTeamWeek.getPoints().toString()%>
					<%=Boolean.TRUE.equals(playerTeamWeek.getPlays()) ? "</b>" : "</s>"%>
				</td>
			</tr>
<%
	}
	%>
	<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
		<td id="name" colspan="<%=colspan%>">
			<b>Suplentes</b>
		</td>
	</tr>
<%
	playerTeamIterator = this.sortByPosition(positionTeamWeek.getTeam().getSubstitutePlayerTeamList()).iterator();
	while (playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
		playerTeamWeek = (PlayerTeamWeek) Database.getCurrentSession().createCriteria(PlayerTeamWeek.class)
			.add(Expression.eq("playerteam", playerTeam))
			.add(Expression.eq("week", positionTeamWeek.getWeek()))
			.uniqueResult();
%>
			<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
				<td id="name">
					<%=playerTeam.getPlayer().getLastname()%>,&nbsp;<%=playerTeam.getPlayer().getFirstname()%>
				</td>
				<td id="code">
					<%=Boolean.TRUE.equals(playerTeam.getIsCaptain1()) ? "C1" : Boolean.TRUE.equals(playerTeam.getIsCaptain2()) ? "C2" : Boolean.TRUE.equals(playerTeam.getIsCaptain3()) ? "C3" : ""%>
				</td>
				<td id="code">
					<%=playerTeam.getPlayer().getPosition().getName()%>
				</td>
				<td id="code">
					<%=playerTeam.getPlayer().getValue()%>
				</td>
				<td id="name">
					<%=playerTeam.getPlayer().getClub().getName()%>
				</td>
				<td id="code">
					<%=Boolean.TRUE.equals(playerTeamWeek.getPlays()) ? "<b>" : "<s>"%>
					<%=playerTeamWeek.getPoints() == null ? "" : playerTeamWeek.getPoints().toString()%>
					<%=Boolean.TRUE.equals(playerTeamWeek.getPlays()) ? "</b>" : "</s>"%>
				</td>
			</tr>
<%
	}
}
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan - 1%>">
						&nbsp;
					</td>
					<td id="code">
						<%=positionTeamWeek.getWeekPoints()%>
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>

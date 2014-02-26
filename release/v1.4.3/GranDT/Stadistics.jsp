<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
int colspan = 15;
int rowIndex = 0;

Class.forName("org.gjt.mm.mysql.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/waretech_GranDT_Apertura2010", "Apertura2010", "Pa$$word");
ResultSet resultSet = connection.createStatement().executeQuery(
		"SELECT p.lastname, p.firstname, pp.name, c.name, played, ROUND(totalPoints / played, 2) AS average, mom, ROUND(olePoints  / played, 2) AS oleAverage, cleanGoal, goals, penaltyGoals, freeKickGoals, missedPenalties, cachedPenalties, yellowCard, redCard"
		+ " FROM ("
		+ " SELECT player, COUNT(player) played, SUM(totalPoints) totalPoints, SUM(mom) mom, SUM(olePoints) olePoints, SUM(cleanGoal) cleanGoal, SUM(goals) goals, SUM(penaltyGoals) penaltyGoals, SUM(freeKickGoals) freeKickGoals, SUM(missedPenalties) missedPenalties, SUM(cachedPenalties) cachedPenalties, SUM(yellowCard) yellowCard, SUM(redCard) redCard"
		+ " FROM playermatch"
		+ " GROUP BY player"
		+ " ) t"
		+ " LEFT JOIN player p ON p.id = player"	
		+ " LEFT JOIN playerposition pp ON pp.id = p.position"
		+ " LEFT JOIN club c ON c.id = p.club"
		+ " ORDER BY average DESC"
		);
%>
<html>
	<head>
	    <title>Stadistics Apertura 2010</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
		<style type="text/css">
			div.scrolled {
				width: 100%;
				height: 400px;
				overflow: auto;
				}
		</style>
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
									<a href="StatisticsList.jsp">Estad&iacute;sticas</a>
									&nbsp;|&nbsp;
									Apertura 2010
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridHeader">
					<td id="code">
						#
					</td>
					<td id="name">
						Jugador
					</td>
					<td id="name">
						Puesto
					</td>
					<td id="name">
						Club
					</td>
					<td id="code">
						Partidos Jugados
					</td>
					<td id="code">
						Promedio
					</td>
					<td id="code">
						Figura
					</td>
					<td id="code">
						Promedio Olé
					</td>
					<td id="code">
						Valla Invicta
					</td>
					<td id="code">
						Goles
					</td>
					<td id="code">
						Penales
					</td>
					<td id="code">
						Tiros Libres
					</td>
					<td id="code">
						Penales Atajados
					</td>
					<td id="code">
						Amarillas
					</td>
					<td id="code">
						Rojas
					</td>
				</tr>
<%
while (resultSet.next())
{
	int columnIndex = 1;
%>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<%=rowIndex%>
					</td>
					<td id="name">
						<%=resultSet.getString(columnIndex++)%>, <%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="name">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="name">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
					<td id="code">
						<%=resultSet.getString(columnIndex++)%>
					</td>
				</tr>
<%
}
%>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>
<%
connection.close();
%>
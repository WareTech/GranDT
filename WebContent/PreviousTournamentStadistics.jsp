<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
int colspan = 16;
int rowIndex = 0;

Class.forName("org.gjt.mm.mysql.Driver");
String[] connectionValues = ((String) ApplicationContext.getInstance().get(ApplicationContext.PREVIOUS_TOURNAMENT_CONNECTION)).split("\\|");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/" + connectionValues[0], connectionValues[1], connectionValues[2]);
ResultSet resultSet = connection.createStatement().executeQuery(
		"SELECT p.lastname, p.firstname, pp.name, c.name, played, ROUND(totalPoints / played, 2) AS average, mom, ROUND(olePoints  / played, 2) AS oleAverage, cleanGoal, goals, penaltyGoals, freeKickGoals, cachedPenalties, missedPenalties, yellowCard, redCard"
		+ " FROM ("
		+ " SELECT player, COUNT(player) played, SUM(totalPoints) totalPoints, SUM(mom) mom, SUM(olePoints) olePoints, SUM(cleanGoal) cleanGoal, SUM(goals) goals, SUM(penaltyGoals) penaltyGoals, SUM(freeKickGoals) freeKickGoals, SUM(cachedPenalties) cachedPenalties, SUM(missedPenalties) missedPenalties, SUM(yellowCard) yellowCard, SUM(redCard) redCard"
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
	    <title>Estad&iacute;sticas <%=ApplicationContext.getInstance().get(ApplicationContext.PREVIOUS_TOURNAMENT_NAME)%></title>
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
									<%=ApplicationContext.getInstance().get(ApplicationContext.PREVIOUS_TOURNAMENT_NAME)%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridHeader">
					<td id="code" rowspan="2">
						#
					</td>
					<td id="name" rowspan="2">
						Jugador
					</td>
					<td id="name" rowspan="2">
						Puesto
					</td>
					<td id="name" rowspan="2">
						Club
					</td>
					<td id="code" rowspan="2">
						Partidos Jugados
					</td>
					<td id="code" rowspan="2">
						Promedio
					</td>
					<td id="code" rowspan="2">
						Figura
					</td>
					<td id="code" rowspan="2">
						Promedio Olé
					</td>
					<td id="code" rowspan="2">
						Valla Invicta
					</td>
					<td id="code" colspan="3">
						Goles
					</td>
					<td id="code" colspan="2">
						Penales
					</td>
					<td id="code" rowspan="2">
						Amarillas
					</td>
					<td id="code" rowspan="2">
						Rojas
					</td>
				</tr>
				<tr id="gridHeader">
					<td id="code">
						Jugada
					</td>
					<td id="code">
						Penal
					</td>
					<td id="code">
						Tiro Libre
					</td>
					<td id="code">
						Atajados
					</td>
					<td id="code">
						Errados
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
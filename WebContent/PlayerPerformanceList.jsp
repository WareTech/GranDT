<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.services.Calculator"%>
<%@page import="java.math.BigInteger"%>
<%
int colspan = 8;
int rouwCount = 0;
%>
<html>
	<head>
	    <title>Player Performance List</title>
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
									<a href="StatisticsList.jsp">Estad&iacute;sticas</a>
									&nbsp;|&nbsp;
									Estad&iacute;sticas&nbsp;de&nbsp;jugadores
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<b>Apellido</b>
					</td>
					<td id="name">
						<b>Nombre</b>
					</td>
					<td id="code">
						<b>Valor</b>
					</td>
					<td id="name">
						<b>Club</b>
					</td>
					<td id="code">
						<b>Puntos</b>
					</td>
					<td id="code">
						<b>Jugados</b>
					</td>
					<td id="code">
						<b>Promedio</b>
					</td>
					<%--td id="code">
						<b>Ol&eacute;</b>
					</td>
					<td id="code">
						<b>Valla invicta</b>
					</td>
					<td id="code">
						<b>Goles recibidos</b>
					</td>
					<td id="code">
						<b>Figura</b>
					</td>
					<td id="code">
						<b>Goles</b>
					</td>
					<td id="code">
						<b>Penales</b>
					</td>
					<td id="code">
						<b>Penales</b>
					</td>
					<td id="code">
						<b>Tiros libres</b>
					</td>
					<td id="code">
						<b>Penales errados</b>
					</td>
					<td id="code">
						<b>Penales atajados</b>
					</td>
					<td id="code">
						<b>Amarillas</b>
					</td>
					<td id="code">
						<b>Rojas</b>
					</td--%>
				</tr>
<%
Iterator resultIterator = Database.getCurrentSession().createSQLQuery(
//		"SELECT p.lastname, p.firstname, p.value, c.name, SUM(pm.totalpoints), COUNT(1), SUM(pm.totalpoints) / COUNT(1), SUM(pm.olepoints), 'SUM(pm.cleangoal)', SUM(pm.owngoal), 'SUM(pm.mom)', SUM(pm.goals), SUM(pm.penaltygoals), SUM(pm.freekickgoals), SUM(pm.missedpenalties), SUM(pm.cachedpenalties), 'SUM(pm.yellowcard)', 'SUM(pm.redcard)' FROM playermatch pm LEFT JOIN player p ON p.id = pm.player LEFT JOIN club c ON c.id = p.club GROUP BY pm.player ORDER BY 5 DESC, 6 ASC"
		"SELECT p.lastname, p.firstname, p.value, c.name, SUM(pm.totalpoints), COUNT(1), SUM(pm.totalpoints) / COUNT(1) FROM playermatch pm LEFT JOIN player p ON p.id = pm.player LEFT JOIN club c ON c.id = p.club GROUP BY pm.player ORDER BY 5 DESC, 6 ASC"
		).list().iterator();
Object[] resultRow;
while(resultIterator.hasNext())
{
	resultRow = (Object[]) resultIterator.next();
%>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<%=resultRow[0]%>
					</td>
					<td id="name">
						<%=resultRow[1]%>
					</td>
					<td id="code">
						<%=resultRow[2]%>
					</td>
					<td id="name">
						<%=resultRow[3]%>
					</td>
					<td id="code">
						<%=Calculator.decimalFormat.format(resultRow[4])%>
					</td>
					<td id="code">
						<%=resultRow[5]%>
					</td>
					<td id="code">
						<%=Calculator.decimalFormat.format(resultRow[6])%>
					</td>
				</tr>
<%
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

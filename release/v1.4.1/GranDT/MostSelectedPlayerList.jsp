<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%
int colspan = 6;
int rouwCount = 0;

Database.getCurrentSession().beginTransaction();

%>
<html>
	<head>
	    <title>Most Selected Player List</title>
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
									Jugadores&nbsp;m&aacute;s&nbsp;elegidos
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
						<b>Cantidad</b>
					</td>
				</tr>
<%
Iterator resultIterator = Database.getCurrentSession().createSQLQuery(
		"SELECT p.lastname, p.firstname, p.value, c.name, COUNT(1) _count FROM playerteam pt LEFT JOIN player p ON p.id = pt.player LEFT JOIN club c ON c.id = p.club WHERE pt.islist = 0 GROUP BY pt.player ORDER BY _count DESC, p.lastname, p.firstname, p.value DESC"
		).list().iterator();
Object[] resultRow;
int resultRowIndex;
while (resultIterator.hasNext())
{
	resultRowIndex = 0;
	resultRow = (Object[]) resultIterator.next();
%>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<%=resultRow[resultRowIndex++]%>
					</td>
					<td id="name">
						<%=resultRow[resultRowIndex++]%>
					</td>
					<td id="code">
						<%=resultRow[resultRowIndex++]%>
					</td>
					<td id="name">
						<%=resultRow[resultRowIndex++]%>
					</td>
					<td id="code">
						<%=resultRow[resultRowIndex++]%>
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
<%
Database.getCurrentSession().getTransaction().commit();
%>

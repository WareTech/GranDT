<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 6;

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy");
String weekString = request.getParameter("week");
System.out.println("Week=" + weekString);

Database.getCurrentSession().beginTransaction();
Week week =  (Week) Database.getCurrentSession().get(Week.class, new Long(weekString));
%>
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
					<td colspan="6">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									Partidos&nbsp;|&nbsp;Lista
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
					<td id="name">
						Día
					</td>
					<td id="name">
						Hora
					</td>
				</tr>
<%
Iterator matchIterator = week.getMatchSet().iterator();
Match match;
while (matchIterator.hasNext())
{
	match = (Match) matchIterator.next();
%>
				<tr id="gridRow1">
					<td id="code">
						<input type="checkbox" id="match_<%=match.getId()%>" name="match_<%=match.getId()%>"/>
					</td>
					<td id="name">
						<a href="PlayerList.jsp?club=<%=match.getHomeClub().getId()%>"><%=match.getHomeClub().getName()%></a>
					</td>
					<td id="code">
						<a href="MatchEdit.jsp?match=<%=match.getId()%>"><%=match.getHomeGoals() == null ? "vs." : "" + match.getHomeGoals() + "-" + match.getAwayGoals()%></a>
					</td>
					<td id="name">
						<a href="PlayerList.jsp?club=<%=match.getAwayClub().getId()%>"><%=match.getAwayClub().getName()%></a>
					</td>
					<td id="name">
						<%=match.getDate() == null ? "" : simpleDateFormat.format(match.getDate())%>
					</td>
					<td id="name">
						HH:MM hs
					</td>
				</tr>
<%
}
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							value="create"
							/>
						<input 
							type="submit"
							value="edit"
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

<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 7;

Database.getCurrentSession().beginTransaction();
Criteria changeCriteria = Database.getCurrentSession().createCriteria(Change.class);

Week week = null;
String weekSelected = request.getParameter("week");
if (weekSelected != null && !"".equals(weekSelected))
{
	week = (Week) Database.getCurrentSession().get(Week.class, new Long(weekSelected));
	changeCriteria.add(Expression.eq("week", week));
}

Team team = null;
String teamSelected = request.getParameter("team");
if (teamSelected != null && !"".equals(teamSelected))
{
	team = (Team) Database.getCurrentSession().get(Team.class, new Long(teamSelected));
	changeCriteria.add(Expression.eq("team", team));
}

changeCriteria.addOrder(Order.desc("week")).addOrder(Order.asc("team"));
List changeList = changeCriteria.list();

List weekList = Database.getCurrentSession().createCriteria(Week.class).addOrder(Order.asc("number")).list();
List teamList = Database.getCurrentSession().createCriteria(Team.class).addOrder(Order.asc("name")).list();
%>
<html>
	<head>
	    <title>Change List</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="ChangeList.jsp" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="<%=colspan%>">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									Cambios
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridHeader">
					<td id="code">
						&nbsp;
					</td>
					<td id="code">
						<select name="week" onchange="javascript:document.forms[0].submit();">
							<option value="">[Fecha]
<%
Iterator weekIterator = weekList.iterator();
Week _week = null;
while (weekIterator.hasNext())
{
	_week = (Week) weekIterator.next();
%>
							<option value="<%=_week.getId()%>" <%=week != null && week.getId().equals(_week.getId()) ? "selected" : ""%>><%=_week.getNumber()%>
<%
}
%>
						</select>
					</td>
					<td id="name">
						<select name="team" onchange="javascript:document.forms[0].submit();">
							<option value="">[Equipo]
<%
Iterator teamIterator = teamList.iterator();
Team _team = null;
while (teamIterator.hasNext())
{
	_team = (Team) teamIterator.next();
%>
							<option value="<%=_team.getId()%>" <%=team != null && team.getId().equals(_team.getId()) ? "selected" : ""%>><%=_team.getName()%>
<%
}
%>
						</select>
					</td>
					<td id="name">
						Entr&oacute;
					</td>
					<td id="name">
						Sali&oacute;
					</td>
					<td id="name">
						Autor
					</td>
					<td id="code">
						D&iacute;a
					</td>
				</tr>
<%
if (changeList.size() == 0)
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
	Iterator changeIterator = changeList.iterator();
	Change change = null;
	int changeCount = 0;	
	while (changeIterator.hasNext())
	{
		change = (Change) changeIterator.next();
%>
				<tr id="gridRow<%= changeCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="checkbox" name="change_<%=change.getId()%>"/>
					</td>
					<td id="code">
						<%=change.getWeek().getNumber()%>
					</td>
					<td id="name">
						<a href="TeamEdit.jsp?team=<%=change.getTeam().getId()%>"><%=change.getTeam().getName()%></a>
					</td>
					<td id="name">
						<%=change.getPlayerIn().getFirstname()%>&nbsp;<%=change.getPlayerIn().getLastname()%>&nbsp;(<%=change.getPlayerIn().getClub().getName()%>)
					</td>
					<td id="name">
						<%=change.getPlayerOut().getFirstname()%>&nbsp;<%=change.getPlayerOut().getLastname()%>&nbsp;(<%=change.getPlayerOut().getClub().getName()%>)
					</td>
					<td id="name">
						<a href="UserEdit.jsp?user=<%=change.getUser().getId()%>"><%=change.getUser().getFirstname()%>&nbsp;<%=change.getUser().getLastname()%></a>
					</td>
					<td id="code">
						<%=Change.DATE_FORMAT.format(change.getDate())%>
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
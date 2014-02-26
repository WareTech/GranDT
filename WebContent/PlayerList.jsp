<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 6;

Database.getCurrentSession().beginTransaction();
Criteria playerCriteria = Database.getCurrentSession().createCriteria(Player.class);

PlayerPosition playerPosition = null;
String positionSelected = request.getParameter("position");
if (positionSelected != null && !"".equals(positionSelected))
{
	playerPosition = (PlayerPosition) Database.getCurrentSession().get(PlayerPosition.class, new Long(positionSelected));
	playerCriteria.add(Expression.eq("position", playerPosition));
}

String valueSelected = request.getParameter("value");
if (valueSelected != null && !"".equals(valueSelected))
{
	playerCriteria.add(Expression.eq("value", valueSelected));
}

Club club = null;
String clubSelected = request.getParameter("club");
if (clubSelected != null && !"".equals(clubSelected))
{
	club = (Club) Database.getCurrentSession().get(Club.class, new Long(clubSelected));
	playerCriteria.add(Expression.eq("club", club));
}
playerCriteria.addOrder(Order.asc("position")).addOrder(Order.asc("lastname")).addOrder(Order.asc("firstname"));
List playerList = playerCriteria.list();

List positionList = Database.getCurrentSession().createCriteria(PlayerPosition.class).addOrder(Order.asc("id")).list();
List valueList = Database.getCurrentSession().createQuery("SELECT DISTINCT(value) FROM Player ORDER BY 1").list();
List clubList = Database.getCurrentSession().createCriteria(Club.class).addOrder(Order.asc("name")).list();
%>
<html>
	<head>
	    <title>Player List</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="PlayerList.jsp" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="<%=colspan%>">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									<a href="PlayerList.jsp">Jugadores</a>
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
						Apellido
					</td>
					<td id="name">
						Nombre
					</td>
					<td id="name">
						<select name="position" onchange="javascript:document.forms[0].submit();">
							<option value="">[Posici&oacute;n]
<%
Iterator positionIterator = positionList.iterator();
PlayerPosition _playerPosition = null;
while (positionIterator.hasNext())
{
	_playerPosition = (PlayerPosition) positionIterator.next();
%>
							<option value="<%=_playerPosition.getId()%>" <%=playerPosition != null && playerPosition.getId().equals(_playerPosition.getId()) ? "selected" : ""%>><%=_playerPosition.getName()%>
<%
}
%>
						</select>
					</td>
					<td id="name">
						<select name="value" onchange="javascript:document.forms[0].submit();">
							<option value="">[Valor]
<%
Iterator valueIterator = valueList.iterator();
String _value = null;
while (valueIterator.hasNext())
{
	_value = (String) valueIterator.next();
%>
							<option value="<%=_value%>" <%=valueSelected != null && _value.equals(valueSelected) ? "selected" : "" %>><%=_value%>
<%
}
%>
						</select>
					</td>
					<td id="name">
						<select name="club" onchange="javascript:document.forms[0].submit();">
							<option value="">[Club]
<%
Iterator clubIterator = clubList.iterator();
Club _club = null;
while (clubIterator.hasNext())
{
	_club = (Club) clubIterator.next();
%>
							<option value="<%=_club.getId()%>" <%=club != null && _club.getId().equals(club.getId()) ? "selected" : ""%>><%=_club.getName()%>
<%
}
%>
						</select>
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
	Iterator playerIterator = playerList.iterator();
	Player player = null;
	int plyerCount = 0;	
	while (playerIterator.hasNext())
	{
		player = (Player) playerIterator.next();
%>
				<tr id="gridRow<%= plyerCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="checkbox" name="player_<%=player.getId()%>"/>
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
					<td id="name">
						<%=player.getValue()%>
					</td>
					<td id="name">
						<%=player.getClub().getName()%>
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
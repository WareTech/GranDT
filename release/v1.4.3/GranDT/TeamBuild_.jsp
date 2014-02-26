<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%
final String[] _TACTIC_LIST = {"3-4-3", "3-5-2", "4-3-3", "4-4-2", "4-5-1", "5-3-2", "5-4-1"};

int colspan = 7;
int rowIndex = 1;	

String teamString = request.getParameter("team");

Database.getCurrentSession().beginTransaction();
Team team = (Team) Database.getCurrentSession().get(Team.class, new Long(teamString));

if (request.getParameter("save") != null)
{
}
else if ("true".equalsIgnoreCase(request.getParameter("tacticChanged")))
{
	team.setTactic(request.getParameter("tactic"));
	Database.getCurrentSession().save(team);
}
else if (request.getParameter("change") != null)
{
	String[] playerTeamList = (String[]) request.getParameterMap().get("playerTeam");
	if (playerTeamList == null)
	{
		this.addError(session, "Debe seleccionar los jugadores a intercambiar");
	}
	else if (playerTeamList.length == 1)
	{
		this.addError(session, "Debe seleccionar 2 jugadores a intercambiar");
	}
	else if (playerTeamList.length > 2)
	{
		this.addError(session, "Debe seleccionar sólo 2 jugadores a intercambiar");
	}
	else
	{
		PlayerTeam playerTeam1 = (PlayerTeam) Database.getCurrentSession().get(PlayerTeam.class, new Long(playerTeamList[0]));
		PlayerTeam playerTeam2 = (PlayerTeam) Database.getCurrentSession().get(PlayerTeam.class, new Long(playerTeamList[1]));
		if (!playerTeam1.getPlayer().getPosition().equals(playerTeam2.getPlayer().getPosition()))
		{
			this.addError(session, "Sólo puede intercambiar 2 jugadores de la misma posición");
		}
		else
		{
			Integer number = playerTeam1.getNumber();
			playerTeam1.setNumber(playerTeam2.getNumber());
			playerTeam2.setNumber(number);
			Database.getCurrentSession().save(playerTeam1);
			Database.getCurrentSession().save(playerTeam2);
			Database.getCurrentSession().flush();
			Database.getCurrentSession().refresh(team);
		}
	}
}
else if (request.getParameter("add") != null && request.getParameter("toAddPlayerList") != null)
{
	String[] playerList = (String[]) request.getParameterMap().get("toAddPlayerList");
	Player player;
	PlayerTeam playerTeam;
	for(
			int playerIndex = 0; 
			playerIndex < playerList.length; 
			playerIndex++
			)
	{
		player = (Player) Database.getCurrentSession().get(Player.class, new Long(playerList[playerIndex]));
		playerTeam = new PlayerTeam();
		playerTeam.setTeam(team);
		playerTeam.setPlayer(player);
		playerTeam.setNumber(new Integer(team.getPlayerTeamSet().size()));
		Database.getCurrentSession().save(playerTeam);
	}
	Database.getCurrentSession().flush();
	Database.getCurrentSession().refresh(team);
}
else if (request.getParameter("remove") != null && request.getParameter("playerTeam") != null)
{
	String[] playerTeamList = (String[]) request.getParameterMap().get("playerTeam");
	Player player;
	PlayerTeam playerTeam;
	for(
			int playerTeamIndex = 0; 
			playerTeamIndex < playerTeamList.length; 
			playerTeamIndex++
			)
	{
		playerTeam = (PlayerTeam) Database.getCurrentSession().get(PlayerTeam.class, new Long(playerTeamList[playerTeamIndex]));
		Database.getCurrentSession().delete(playerTeam);
	}
	Database.getCurrentSession().flush();
	Database.getCurrentSession().refresh(team);
}
%>
<html>
	<head>
	    <title>Team Build</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="3">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									<a href="TeamList.jsp">Equipos</a>
									&nbsp;|&nbsp;
									<%=team.getName()%>
									&nbsp;|&nbsp;
									<input type="hidden" id="tacticChanged" name="tacticChanged" value="false"/>
									<select name="tactic" onchange="javascript:document.forms[0].tacticChanged.value = 'true'; document.forms[0].submit();">
<%
for (int tacticIndex = 0; tacticIndex < _TACTIC_LIST.length; tacticIndex++)
{
%>
										<option value="<%=_TACTIC_LIST[tacticIndex]%>" <%=_TACTIC_LIST[tacticIndex].equals(team.getTactic()) ? "selected" : ""%>>
										<%=_TACTIC_LIST[tacticIndex]%>
<%
}
%>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridRow<%=(rowIndex++ % 2) + 1%>">
					<td width="49%">Elegidos</td>
					<td width="2%">&nbsp;</td>
					<td width="49%">Disponibles</td>
				</tr>
				<tr id="gridRow<%=(rowIndex++ % 2) + 1%>">
					<td valign="top">
						<table width="100%">
							<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
								<td id="code">
									&nbsp;
								</td>
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
									&nbsp;
								</td>
							</tr>
<%
Iterator playerTeamIterator = this.sortByPosition(team.getPlayerTeamSet()).iterator();
if (!playerTeamIterator.hasNext())
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
	PlayerTeam playerTeam;
	while (playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
%>
							<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
								<td id="code"> 
									<input type="checkbox" name="playerTeam" value="<%=playerTeam.getId()%>"/>
								</td>
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
								<td id="code" style="background-color:<%=Boolean.TRUE.equals(playerTeam.getIsPrincipal()) ? "#00FF00" : Boolean.TRUE.equals(playerTeam.getIsSubstitute()) ? "#00FFFF" : Boolean.TRUE.equals(playerTeam.getIsList()) ? "#FF0000" :"#000000"%>">
									&nbsp;
								</td>
							</tr>
<%
	}
}
%>
						</table>
					</td>
					<td>
						<table width="100%">
							<tr>
								<td align="center">
									<input type="submit" name="remove" value="&gt;"/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" name="add" value="&lt;"/>
								</td>
							</tr>
						</table>
					</td>
					<td valign="top">
						<table width="100%">
							<tr>
								<td width="15%">
									<select name="valueSelected" style="overflow:auto; width:100%;" onchange="javascript:document.forms[0].submit();">
<%
Criteria playerCriteria = Database.getCurrentSession().createCriteria(Player.class);

String valueSelected = request.getParameter("valueSelected");
if (valueSelected != null && !"".equals(valueSelected))
{
	playerCriteria.add(Expression.eq("value", valueSelected));
}
%>
										<option value="" <%=valueSelected == null ? "selected" : ""%>>[Valor]
										<option value="1" <%="1".equals(valueSelected) ? "selected" : ""%>>1
										<option value="2" <%="2".equals(valueSelected) ? "selected" : ""%>>2
										<option value="3" <%="3".equals(valueSelected) ? "selected" : ""%>>3
									</select>
								</td>
								<td width="35%">
									<select name="playerPositionSelected" style="overflow:auto; width:100%;" onchange="javascript:document.forms[0].submit();">
<%
PlayerPosition playerPosition = null;
String playerPositionSelected = request.getParameter("playerPositionSelected");
if (playerPositionSelected != null && !"".equals(playerPositionSelected))
{
	playerPosition = (PlayerPosition) Database.getCurrentSession().get(PlayerPosition.class, new Long(playerPositionSelected));
	playerCriteria.add(Expression.eq("position", playerPosition));
%>
										<option value="">[Posición]
<%
}
else
{
%>
										<option value="" selected>[Posición]
<%	
}
Iterator playerPositionIterator = Database.getCurrentSession().createCriteria(PlayerPosition.class).addOrder(Order.asc("id")).list().iterator();
PlayerPosition _playerPosition;
while(playerPositionIterator.hasNext())
{
	_playerPosition = (PlayerPosition) playerPositionIterator.next();
%>

										<option value="<%=_playerPosition.getId()%>" <%=(playerPosition != null && playerPosition.getId().longValue() == _playerPosition.getId().longValue()) ? "selected" : ""%>>
											<%=_playerPosition.getName()%>
<%
}
%>
									</select>
								</td>
								<td width="50%">
									<select name="clubSelected" style="overflow:auto; width:100%;" onchange="javascript:document.forms[0].submit();">
										<option value="">[Club]
<%
Club club = null;
String clubSelected = request.getParameter("clubSelected");
if (clubSelected != null && !"".equals(clubSelected))
{
	club = (Club) Database.getCurrentSession().get(Club.class, new Long(clubSelected));
	playerCriteria.add(Expression.eq("club", club));
}
Iterator clubIterator = Database.getCurrentSession().createCriteria(Club.class).addOrder(Order.asc("name")).list().iterator();
Club _club;
while(clubIterator.hasNext())
{
	_club = (Club) clubIterator.next();
%>
										<option value="<%=_club.getId()%>" <%=(club != null && club.getId().longValue() == _club.getId().longValue()) ? "selected" : "" %>>
											<%=_club.getName()%>
<%
}
%>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<select name="toAddPlayerList" size="26" style="overflow:auto; width:100%;" multiple="multiple">
<%
if (team.getPlayerTeamSet().size() > 0)
{
	List excludedPlayerList = new ArrayList();
	playerTeamIterator = team.getPlayerTeamSet().iterator();
	PlayerTeam playerTeam;
	while (playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
		excludedPlayerList.add(playerTeam.getPlayer().getId());
	}
	playerCriteria.add(Expression.not(Expression.in("id", excludedPlayerList)));
}
playerCriteria.addOrder(Order.desc("value")).addOrder(Order.asc("position")).addOrder(Order.asc("lastname")).addOrder(Order.asc("firstname"));
Iterator playerIterator = playerCriteria.list().iterator();
Player _player;
_playerPosition = null;
while(playerIterator.hasNext())
{
	_player = (Player) playerIterator.next();
	if (_playerPosition == null)
	{
%>
										<optgroup label="<%=_player.getPosition().getName()%>">
<%
		
	}
	else if (_player.getPosition().getId().longValue() != _playerPosition.getId().longValue())
	{
%>
										</optgroup>
										<optgroup label="<%=_player.getPosition().getName()%>">
<%
		
	}
	_playerPosition = _player.getPosition();
%>
											<option value="<%=_player.getId()%>">[<%=_player.getValue()%>] [<%=_player.getPosition().getName()%>] <%=_player.getLastname()%>, <%=_player.getFirstname()%> (<%=_player.getClub().getName()%>)
<%
}
%>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="3">
						<input 
							type="submit"
							name="change"
							value="Cambiar"
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

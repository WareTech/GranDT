<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
final String[] _TACTIC_LIST = {"3-4-3", "3-5-2", "4-3-3", "4-4-2", "4-5-1", "5-3-2", "5-4-1"};

int colspan = 8;
int rowIndex = 1;	

String teamString = request.getParameter("team");

Database.getCurrentSession().beginTransaction();
Team team = (Team) Database.getCurrentSession().get(Team.class, new Long(teamString));

Configuration configuration = (Configuration) Database.getCurrentSession().get(Configuration.class, new Long(1));
if (configuration != null && "true".equalsIgnoreCase(configuration.getValue()))
{
	this.addError(session, "El torneo ya ha comenzado, y no se pueden efectuar modificaciones a los equipos");
	Database.getCurrentSession().getTransaction().commit();
	response.sendRedirect("TeamList.jsp");
	return;
}
	
Long captain1 = request.getParameter("captain1") == null ? null : new Long(request.getParameter("captain1"));
Long captain2 = request.getParameter("captain2") == null ? null : new Long(request.getParameter("captain2"));
Long captain3 = request.getParameter("captain3") == null ? null : new Long(request.getParameter("captain3"));
if (captain1 != null || captain2 != null || captain3 != null)
{
	Iterator playerTeamIterator = team.getPlayerTeamSet().iterator();
	PlayerTeam playerTeam;
	while (playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
		playerTeam.setIsCaptain1(Boolean.valueOf(captain1 != null && captain1.longValue() == playerTeam.getId().longValue()));
		playerTeam.setIsCaptain2(Boolean.valueOf(captain2 != null && captain2.longValue() == playerTeam.getId().longValue()));
		playerTeam.setIsCaptain3(Boolean.valueOf(captain3 != null && captain3.longValue() == playerTeam.getId().longValue()));
	}
}

if (request.getParameter("validate") != null)
{
	this.update(team);
	if (this.validate(session, team))
	{
		this.addMessage(session, "El equipo esta formado correctamente");
	}
}
else if (request.getParameter("close") != null)
{
	this.update(team);
	if (this.validate(session, team))
	{
		team.setIsClosed(Boolean.TRUE);
		Database.getCurrentSession().save(team);
		this.addMessage(session, "El equipo fue cerrado correctamente");
		
		StringBuffer text = new StringBuffer();
		text.append(team.getName() + "\n");
		text.append("Táctica: " + team.getTactic() + "\n");

		text.append("> Titulares:\n");
		Iterator playerTeamIterator = team.getPrincipalPlayerTeamList().iterator();
		PlayerTeam playerTeam;
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			text.append(playerTeam.getPlayer().getLastname());
			text.append(", ");
			text.append(playerTeam.getPlayer().getFirstname());
			text.append(" (");
			text.append(playerTeam.getPlayer().getClub().getName());
			text.append(") ");
			text.append(Boolean.TRUE.equals(playerTeam.getIsCaptain1()) ? "(C1)" : Boolean.TRUE.equals(playerTeam.getIsCaptain2()) ? "(C2)" : Boolean.TRUE.equals(playerTeam.getIsCaptain3()) ? "(C3)" : "");
			text.append(" ");
			text.append(playerTeam.getPlayer().getPosition().getName());
			text.append("\n");
		}
		
		text.append("> Suplentes:\n");
		playerTeamIterator = team.getSubstitutePlayerTeamList().iterator();
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			text.append(playerTeam.getPlayer().getLastname());
			text.append(", ");
			text.append(playerTeam.getPlayer().getFirstname());
			text.append(" (");
			text.append(playerTeam.getPlayer().getClub().getName());
			text.append(") ");
			text.append(playerTeam.getPlayer().getPosition().getName());
			text.append("\n");
		}
		
		text.append("> Lista de buena fé:\n");
		playerTeamIterator = team.getListPlayerTeamList().iterator();
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			text.append(playerTeam.getPlayer().getLastname());
			text.append(", ");
			text.append(playerTeam.getPlayer().getFirstname());
			text.append(" (");
			text.append(playerTeam.getPlayer().getClub().getName());
			text.append(") ");
			text.append(playerTeam.getPlayer().getPosition().getName());
			text.append("\n");
		}
		
		Database.getCurrentSession().getTransaction().commit();

		this.sendMailToUser(
				session, 
				team.getUser(), 
				"El equipo fue cerrado correctamente", 
				text.toString()
				);
		
		response.sendRedirect("TeamList.jsp");
		return;
	}
}
else if ("true".equalsIgnoreCase(request.getParameter("tacticChanged")))
{
	team.setTactic(request.getParameter("tactic"));
	this.update(team);

	Database.getCurrentSession().save(team);
	Database.getCurrentSession().flush();
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

		Integer number = playerTeam1.getNumber();
		playerTeam1.setNumber(playerTeam2.getNumber());
		playerTeam2.setNumber(number);

		Boolean isPrincipal = playerTeam1.getIsPrincipal();
		playerTeam1.setIsPrincipal(playerTeam2.getIsPrincipal());
		playerTeam2.setIsPrincipal(isPrincipal);

		Boolean isSubstitute = playerTeam1.getIsSubstitute();
		playerTeam1.setIsSubstitute(playerTeam2.getIsSubstitute());
		playerTeam2.setIsSubstitute(isSubstitute);

		Boolean isList = playerTeam1.getIsList();
		playerTeam1.setIsList(playerTeam2.getIsList());
		playerTeam2.setIsList(isList);

		Database.getCurrentSession().save(playerTeam1);
		Database.getCurrentSession().save(playerTeam2);
		Database.getCurrentSession().flush();
		Database.getCurrentSession().refresh(team);
	}
}
else if (request.getParameter("add") != null && request.getParameter("toAddPlayerList") != null)
{
	Integer nextNumber = (Integer) Database.getCurrentSession().createSQLQuery(
			"SELECT MAX(number) FROM playerteam WHERE team = :team"
			)
			.setParameter("team", team.getId())
			.uniqueResult();
	if (nextNumber == null)
	{
		nextNumber = new Integer(1);
	}
	else
	{
		nextNumber = new Integer(nextNumber.intValue() + 1);
	}
	
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
		playerTeam.setNumber(nextNumber);
		Database.getCurrentSession().save(playerTeam);
		nextNumber = new Integer(nextNumber.intValue() + 1);
	}

	this.update(team);
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
	
	this.update(team);
}
%>
<%@page import="java.math.BigInteger"%>
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
						<div style="width:100%; height:420px; overflow: auto;">
						<table width="100%">
							<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
								<td id="code">
									&nbsp;
								</td>
								<td id="name">
									Jugador
								</td>
								<td id="code">
									C1
								</td>
								<td id="code">
									C2
								</td>
								<td id="code">
									C3
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
							</tr>
<%
List playerPositionList = Database.getCurrentSession().createCriteria(PlayerPosition.class).addOrder(Order.asc("id")).list();
Collection playerTeamCollection = this.sortByPosition(team.getPlayerTeamSet());
if (playerTeamCollection.size() == 0)
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
	Iterator playerPositionIterator = playerPositionList.iterator();
	PlayerPosition playerPosition;
	while (playerPositionIterator.hasNext())
	{
		playerPosition = (PlayerPosition) playerPositionIterator.next();
%>
							<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
								<td id="name" colspan="<%=colspan %>"> 
									<b><%=playerPosition.getName()%><%=playerPosition.getName().endsWith("r") ? "es" : "s"%></b>
								</td>
<%		
		Iterator playerTeamIterator = playerTeamCollection.iterator();
		PlayerTeam playerTeam;
		
		while (playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			if (playerTeam.getPlayer().getPosition().getId().longValue() != playerPosition.getId().intValue())
			{
				continue;
			}
%>
							<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
								<td id="code" style="background-color: <%=playerTeam.getIsPrincipal().booleanValue() ? "#008000" : playerTeam.getIsSubstitute().booleanValue() ? "#FFFF00" : "#FF0000"%>"> 
									<input type="checkbox" name="playerTeam" value="<%=playerTeam.getId()%>"/>
								</td>
								<td id="name">
									<%=playerTeam.getPlayer().getLastname()%>,&nbsp;<%=playerTeam.getPlayer().getFirstname()%>
								</td>
								<td id="code">
									<input 
										type="radio" 
										name="captain1" 
										id="captain1_<%=playerTeam.getId()%>" 
										value="<%=playerTeam.getId()%>"
										<%=Boolean.TRUE.equals(playerTeam.getIsCaptain1()) ? "checked" : ""%>
										onchange="javascript: document.forms[0].captain2_<%=playerTeam.getId()%>.checked = false; document.forms[0].captain3_<%=playerTeam.getId()%>.checked = false;"
										>
								</td>
								<td id="code">
									<input 
										type="radio" 
										name="captain2" 
										id="captain2_<%=playerTeam.getId()%>" 
										value="<%=playerTeam.getId()%>"
										<%=Boolean.TRUE.equals(playerTeam.getIsCaptain2()) ? "checked" : ""%>
										onchange="javascript: document.forms[0].captain1_<%=playerTeam.getId()%>.checked = false; document.forms[0].captain3_<%=playerTeam.getId()%>.checked = false;"
										>
								</td>
								<td id="code">
									<input 
										type="radio" 
										name="captain3" 
										id="captain3_<%=playerTeam.getId()%>" 
										value="<%=playerTeam.getId()%>"
										<%=Boolean.TRUE.equals(playerTeam.getIsCaptain3()) ? "checked" : ""%>
										onchange="javascript: document.forms[0].captain1_<%=playerTeam.getId()%>.checked = false; document.forms[0].captain2_<%=playerTeam.getId()%>.checked = false;"
										>
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
							</tr>
<%
		}
	}
}
%>
						</table>
						</div>
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
										<option value="">[Puesto]
<%
}
else
{
%>
										<option value="" selected>[Puesto]
<%	
}
Iterator playerPositionIterator = playerPositionList.iterator();
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
						</table>
<%
rowIndex = 1;
%>
						<div style="width:100%; height:390px; overflow: auto;">
						<table width="100%">
							<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
								<td id="code"> 
								</td>
								<td id="name">
									Jugador
								</td>
								<td id="code">
									Puesto
								</td>
								<td id="code">
									Valor
								</td>
								<td id="name">
									Club
								</td>
							</tr>
<%
if (team.getPlayerTeamSet().size() > 0)
{
	List excludedPlayerList = new ArrayList();
	Iterator playerTeamIterator = team.getPlayerTeamSet().iterator();
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
while(playerIterator.hasNext())
{
	_player = (Player) playerIterator.next();
%>
							<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
								<td id="code"> 
									<input type="checkbox" name="toAddPlayerList" value="<%=_player.getId()%>"/>
								</td>
								<td id="name">
									<%=_player.getLastname()%>,&nbsp;<%=_player.getFirstname()%>
								</td>
								<td id="code">
									<%=_player.getPosition().getName()%>
								</td>
								<td id="code">
									<%=_player.getValue()%>
								</td>
								<td id="name">
									<%=_player.getClub().getName()%>
								</td>
							</tr>
<%
}
%>
						</table>
						</div>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="3">
						<input 
							type="submit"
							name="change"
							value="Cambiar"
							/>
						<input 
							type="submit"
							name="validate"
							value="Validar"
							/>
						&nbsp;|&nbsp;
						<input 
							type="submit"
							name="close"
							value="Cerrar"
							onclick="javascript: return confirm('Está seguro que desea cerrar su equipo?');"
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
<%!
//------------------------------------------------------------------------------------------------
public void update(
		Team team
		)
{
	Iterator playerTeamIterator;
	PlayerTeam playerTeam;
	int playerCount;
	
	//Goalkeeper
	playerTeamIterator = this.sortByNumber(team.getGoalkeeperPlayerTeamList()).iterator();
	playerCount = 1;
	while(playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
		playerTeam.setIsPrincipal(Boolean.FALSE);
		playerTeam.setIsSubstitute(Boolean.FALSE);
		playerTeam.setIsList(Boolean.FALSE);
		if (playerCount > 0)
		{
			playerTeam.setIsPrincipal(Boolean.TRUE);
		}
		else if (playerCount == 0)
		{
			playerTeam.setIsSubstitute(Boolean.TRUE);
		}
		else
		{
			playerTeam.setIsList(Boolean.TRUE);
		}
		playerCount--;			
		Database.getCurrentSession().save(playerTeam);
	}
	
	//Defender
	playerTeamIterator = this.sortByNumber(team.getDefensorPlayerTeamList()).iterator();
	playerCount = new Integer(team.getTactic().substring(0, 1)).intValue();
	while(playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
		playerTeam.setIsPrincipal(Boolean.FALSE);
		playerTeam.setIsSubstitute(Boolean.FALSE);
		playerTeam.setIsList(Boolean.FALSE);
		if (playerCount > 0)
		{
			playerTeam.setIsPrincipal(Boolean.TRUE);
		}
		else if (playerCount > -2)
		{
			playerTeam.setIsSubstitute(Boolean.TRUE);
		}
		else
		{
			playerTeam.setIsList(Boolean.TRUE);
		}
		playerCount--;			
		Database.getCurrentSession().save(playerTeam);
	}
	
	//Middfield
	playerTeamIterator = this.sortByNumber(team.getMiddfieldPlayerTeamList()).iterator();
	playerCount = new Integer(team.getTactic().substring(2, 3)).intValue();
	while(playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
		playerTeam.setIsPrincipal(Boolean.FALSE);
		playerTeam.setIsSubstitute(Boolean.FALSE);
		playerTeam.setIsList(Boolean.FALSE);
		if (playerCount > 0)
		{
			playerTeam.setIsPrincipal(Boolean.TRUE);
		}
		else if (playerCount > -2)
		{
			playerTeam.setIsSubstitute(Boolean.TRUE);
		}
		else
		{
			playerTeam.setIsList(Boolean.TRUE);
		}
		playerCount--;			
		Database.getCurrentSession().save(playerTeam);
	}
	
	//Forward
	playerTeamIterator = this.sortByNumber(team.getForwardPlayerTeamList()).iterator();
	playerCount = new Integer(team.getTactic().substring(4, 5)).intValue();
	while(playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
		playerTeam.setIsPrincipal(Boolean.FALSE);
		playerTeam.setIsSubstitute(Boolean.FALSE);
		playerTeam.setIsList(Boolean.FALSE);
		if (playerCount > 0)
		{
			playerTeam.setIsPrincipal(Boolean.TRUE);
		}
		else if (playerCount > -2)
		{
			playerTeam.setIsSubstitute(Boolean.TRUE);
		}
		else
		{
			playerTeam.setIsList(Boolean.TRUE);
		}
		playerCount--;			
		Database.getCurrentSession().save(playerTeam);
	}

	Database.getCurrentSession().flush();
}

public boolean validate(
		HttpSession session,
		Team team
		)
{
	if (team.getGoalkeeperPlayerTeamList().size() != 3)
	{
		this.addError(session, "Debe seleccionar exactamente 1 arquero titular, 1 suplente y 1 para la lista de buena f&eacute;");
	}
	
	int defensorCount = new Integer(team.getTactic().substring(0, 1)).intValue();
	if (team.getDefensorPlayerTeamList().size() != defensorCount + 3)
	{
		this.addError(session, "Debe seleccionar exactamente " + defensorCount + " defensores titulares, 2 suplentes y 1 para la lista de buena f&eacute;");
	}
	
	int middfieldCount = new Integer(team.getTactic().substring(2, 3)).intValue();
	if (team.getMiddfieldPlayerTeamList().size() != middfieldCount + 3)
	{
		this.addError(session, "Debe seleccionar exactamente " + middfieldCount + " volantes titulares, 2 suplentes y 1 para la lista de buena f&eacute;");
	}
	
	int forwardCount = new Integer(team.getTactic().substring(4, 5)).intValue();
	if (team.getForwardPlayerTeamList().size() != forwardCount + 3)
	{
		this.addError(session, "Debe seleccionar exactamente " + forwardCount + " delanteros titulares, 2 suplentes y 1 para la lista de buena f&eacute;");
	}
	
	if (this.getErrorList(session).size() > 0)
	{
		return false;
	}
	
	List result = Database.getCurrentSession().createSQLQuery(
			"SELECT club, _count FROM (SELECT C.name club, COUNT(1) _count FROM playerteam PT LEFT JOIN player P ON PT.player = P.id LEFT JOIN club C ON C.id = P.club WHERE NOT(PT.islist) AND PT.team = :team GROUP BY C.id) t WHERE _count > 3 ORDER BY _count DESC"
			)
			.setParameter("team", team.getId())
			.list();
	if (result.size() > 0)
	{
		this.addError(session, "No se puede seleccionar más de 3 jugadores de un mismo club:");
		for(
				int index = 0; 
				index < result.size(); 
				index++
				)
		{
			Object[] resultItem = (Object[])result.get(index);
			this.addError(session, "> fueron seleccionados " + resultItem[1] + " de " + resultItem[0]);
		}
	}
	if (this.getErrorList(session).size() > 0)
	{
		return false;
	}
	
	result = Database.getCurrentSession().createSQLQuery(
			"SELECT P.value, COUNT(1) _count FROM playerteam PT LEFT JOIN player P ON PT.player = P.id WHERE NOT(PT.islist) AND PT.team = :team GROUP BY P.value ORDER BY P.value DESC"
			)
			.setParameter("team", team.getId())
			.list();
	if ("Primera A".equals(team.getCategory().getName()))
	{
		// 3 de 3, 10 de 2, 5 de 1
		for(
				int index = 0; 
				index < result.size(); 
				index++
				)
		{
			Object[] resultItem = (Object[])result.get(index);
			System.out.println(resultItem[0].toString());
			System.out.println(resultItem[1].toString());
			if (new Integer(resultItem[0].toString()).intValue() == 3 && new Integer(resultItem[1].toString()).intValue() > 3)
			{
				this.addError(session, "No puede elegir m&aacute;s de 3 jugadores de valor 3");
			}
			else if (new Integer(resultItem[0].toString()).intValue() == 2 && new Integer(resultItem[1].toString()).intValue() > 10)
			{
				this.addError(session, "No puede elegir m&aacute;s de 10 jugadores de valor 2");
			}
		}			
	}
	else if ("Nacional B".equals(team.getCategory().getName()))
	{
		// 13 de 2, 5 de 1
		for(
				int index = 0; 
				index < result.size(); 
				index++
				)
		{
			Object[] resultItem = (Object[])result.get(index);
			if (new Integer(resultItem[0].toString()).intValue() == 3 && new Integer(resultItem[1].toString()).intValue() > 0)
			{
				this.addError(session, "No puede elegir ning&uacute;n jugador de valor 3");
			}
			else if (new Integer(resultItem[0].toString()).intValue() == 2 && new Integer(resultItem[1].toString()).intValue() > 13)
			{
				this.addError(session, "No puede elegir m&aacute;s de 13 jugadores de valor 2");
			}
		}
	}	
	if (this.getErrorList(session).size() > 0)
	{
		return false;
	}

	BigInteger countInListValue3 = (BigInteger) Database.getCurrentSession().createSQLQuery(
			"SELECT COUNT(1) FROM playerteam PT LEFT JOIN player P ON PT.player = P.id WHERE PT.isList AND P.value = 3 AND PT.team = :team "
			)
			.setParameter("team", team.getId())
			.uniqueResult();
	if (countInListValue3.intValue() > 0)
	{
		this.addError(session, "Los jugadores en lista de buena f&eacute; no pueden ser de valor 3");
		return false;
	}

	if (team.getCaptain1ForPlayerTeamSet() == null || !team.getCaptain1ForPlayerTeamSet().getIsPrincipal().booleanValue())
	{
		this.addError(session, "El capit&aacute;n C1 tiene que ser un jugador titular");
	}
	if (team.getCaptain2ForPlayerTeamSet() == null || !team.getCaptain2ForPlayerTeamSet().getIsPrincipal().booleanValue())
	{
		this.addError(session, "El capit&aacute;n C2 tiene que ser un jugador titular");
	}
	if (team.getCaptain3ForPlayerTeamSet() == null || !team.getCaptain3ForPlayerTeamSet().getIsPrincipal().booleanValue())
	{
		this.addError(session, "El capit&aacute;n C3 tiene que ser un jugador titular");
	}
	if (this.getErrorList(session).size() > 0)
	{
		return false;
	}

	return true;
}
%>
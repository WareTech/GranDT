<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 6;
int rowIndex = 0;	

String teamString = request.getParameter("team");

User user = this.getUser(session);

Database.getCurrentSession().beginTransaction();
Team team = (Team) Database.getCurrentSession().get(Team.class, new Long(teamString));

if (request.getParameter("change") != null)
{
	String principalString = request.getParameter("principal");
	if (principalString == null)
	{
		this.addError(
				session, 
				"Debe seleccionar un jugador titular a ser sustituido"
				);
	}
	else
	{
		String substituteString = request.getParameter("substitute");
		if (substituteString == null)
		{
			this.addError(
					session, 
					"Debe seleccionar un jugador suplente a ingresar"
					);
		}
		else
		{
			PlayerTeam principalPlayerTeam = (PlayerTeam) Database.getCurrentSession().get(
					PlayerTeam.class, 
					new Long(principalString)
					);
			PlayerTeam substitutePlayerTeam = (PlayerTeam) Database.getCurrentSession().get(
					PlayerTeam.class, 
					new Long(substituteString)
					);
			
			if (principalPlayerTeam.getPlayer().getPosition().getId().longValue() != substitutePlayerTeam.getPlayer().getPosition().getId().longValue())
			{
				this.addError(
						session, 
						"Los jugadores a cambiar deber jugar de la misma posición"
						);
			}
			else
			{
				Long weekId = new Long((String) ApplicationContext.getInstance().get(ApplicationContext.CURRENT_WEEK));
				Week week = (Week) Database.getCurrentSession().get(
						Week.class, 
						weekId
						);
				if (!week.getIsOpened().booleanValue())
				{
					this.addError(
							session, 
							"La fecha #" + week.getNumber() + " no est&aacute; abierta para realizar cambios"
							);
				}
				else
				{
					Change change = (Change) Database.getCurrentSession().createCriteria(
							Change.class
							)
							.add(Expression.eq("week", week))
							.add(Expression.eq("team", team))
							.uniqueResult();
					
					if (change != null)
					{
						this.addError(
								session, 
								MessageFormat.format(
										"{0} {1} ya realizó un cambio para este equipo en la fecha #{2} el d&iacute;a {3}",
										new Object[]{
												change.getUser().getFirstname(),
												change.getUser().getLastname(),
												change.getWeek().getNumber(),
												Change.DATE_FORMAT.format(change.getDate())
												}
										)
								);
					}
					else
					{
						Integer number = substitutePlayerTeam.getNumber();
						substitutePlayerTeam.setIsPrincipal(Boolean.TRUE);
						substitutePlayerTeam.setIsSubstitute(Boolean.FALSE);
						substitutePlayerTeam.setIsList(Boolean.FALSE);
						substitutePlayerTeam.setNumber(principalPlayerTeam.getNumber());
						
						principalPlayerTeam.setIsPrincipal(Boolean.FALSE);
						principalPlayerTeam.setIsSubstitute(Boolean.TRUE);
						principalPlayerTeam.setIsList(Boolean.FALSE);
						principalPlayerTeam.setNumber(number);
						
						Database.getCurrentSession().save(principalPlayerTeam);
						Database.getCurrentSession().save(substitutePlayerTeam);
						Database.getCurrentSession().flush();
						Database.getCurrentSession().refresh(team);
		
						change = new Change();
						change.setWeek(week);
						change.setTeam(team);
						change.setPlayerIn(substitutePlayerTeam.getPlayer());
						change.setPlayerOut(principalPlayerTeam.getPlayer());
						change.setDate(new Date());
						change.setUser(user);
						Database.getCurrentSession().save(change);
						
						this.addMessage(
								session, 
								MESSAGE_PLAYER_CHANGE.format(
										new Object[]{
												substitutePlayerTeam.getPlayer().getFirstname(),
												substitutePlayerTeam.getPlayer().getLastname(),
												substitutePlayerTeam.getPlayer().getClub().getName(),
												principalPlayerTeam.getPlayer().getFirstname(),
												principalPlayerTeam.getPlayer().getLastname(),
												principalPlayerTeam.getPlayer().getClub().getName()
												}
										)
								);
						
					    this.sendMailToUser(
					    		session, 
					    		team.getUser(), 
					    		MESSAGE_PLAYER_CHANGE_SUBJECT.format(new Object[]{team.getName()}),
					    		MESSAGE_PLAYER_CHANGE_MAIL.format(
					    				new Object[]{
					    						user.getFirstname(), 
					    						user.getLastname(), 
					    						team.getName(),
					    						substitutePlayerTeam.getPlayer().getFirstname(), 
					    						substitutePlayerTeam.getPlayer().getLastname(),
					    						substitutePlayerTeam.getPlayer().getClub().getName(),
					    						principalPlayerTeam.getPlayer().getFirstname(),
					    						principalPlayerTeam.getPlayer().getLastname(),
					    						principalPlayerTeam.getPlayer().getClub().getName()
					    						}
					    				)
					    		);
					}
				}
			}
		}
	}
}
else if (request.getParameter("injuredChange") != null)
{
	String principalString = request.getParameter("principal");
	String substituteString = request.getParameter("substitute");
	if (principalString == null && substituteString == null)
	{
		this.addError(
				session, 
				"Debe seleccionar un jugador titular o suplente a ser reemplazado x lesi&oacutre;n"
				);
	}
	else if (principalString != null && substituteString != null)
	{
		this.addError(
				session, 
				"Debe seleccionar s&oacute;lo un jugador ser reemplazado x lesi&oacutre;n"
				);
	}
	else if (principalString != null)
	{
		PlayerTeam principalPlayerTeam = (PlayerTeam) Database.getCurrentSession().get(
				PlayerTeam.class, 
				new Long(principalString)
				);

		List substitutePlayerTeamList = team.getSubstitutePlayerTeamList();
		Collections.sort(substitutePlayerTeamList, PlayerTeam.NUMBER_COMPARATOR);
		Iterator substitutePlayerTeamIterator = substitutePlayerTeamList.iterator();
		PlayerTeam substitutePlayerTeam = null;
		while (substitutePlayerTeamIterator.hasNext())
		{
			substitutePlayerTeam = (PlayerTeam) substitutePlayerTeamIterator.next();
			if (substitutePlayerTeam.getPlayer().getPosition().getId().longValue() == principalPlayerTeam.getPlayer().getPosition().getId().longValue())
			{
				break;
			}
		}

		PlayerTeam substitute2PlayerTeam = (PlayerTeam) Database.getCurrentSession().createQuery(
				"FROM PlayerTeam WHERE team = :team AND player.position = :position AND issubstitute = 1 AND number > :number"
				)
				.setParameter("team", team)
				.setParameter("position", substitutePlayerTeam.getPlayer().getPosition())
				.setParameter("number", substitutePlayerTeam.getNumber())
				.uniqueResult();

		Iterator listPlayerTeamIterator = team.getListPlayerTeamList().iterator();
		PlayerTeam listPlayerTeam = null;
		while (listPlayerTeamIterator.hasNext())
		{
			listPlayerTeam = (PlayerTeam) listPlayerTeamIterator.next();
			if (listPlayerTeam.getPlayer().getPosition().getId().longValue() == principalPlayerTeam.getPlayer().getPosition().getId().longValue())
			{
				break;
			}
		}

		Integer number = listPlayerTeam.getNumber();
		
		listPlayerTeam.setIsPrincipal(Boolean.FALSE);
		listPlayerTeam.setIsSubstitute(Boolean.TRUE);
		listPlayerTeam.setIsList(Boolean.FALSE);
		if (substitute2PlayerTeam == null)
		{
			listPlayerTeam.setNumber(substitutePlayerTeam.getNumber());
		}
		else
		{
			listPlayerTeam.setNumber(substitute2PlayerTeam.getNumber());
			substitute2PlayerTeam.setNumber(substitutePlayerTeam.getNumber());
			Database.getCurrentSession().save(substitute2PlayerTeam);
		}
		Database.getCurrentSession().save(listPlayerTeam);
		
		substitutePlayerTeam.setIsPrincipal(Boolean.TRUE);
		substitutePlayerTeam.setIsSubstitute(Boolean.FALSE);
		substitutePlayerTeam.setIsList(Boolean.FALSE);
		substitutePlayerTeam.setNumber(principalPlayerTeam.getNumber());
		Database.getCurrentSession().save(substitutePlayerTeam);
		
		principalPlayerTeam.setIsPrincipal(Boolean.FALSE);
		principalPlayerTeam.setIsSubstitute(Boolean.FALSE);
		principalPlayerTeam.setIsList(Boolean.TRUE);
		principalPlayerTeam.setNumber(number);
		Database.getCurrentSession().save(principalPlayerTeam);

		Database.getCurrentSession().flush();
		Database.getCurrentSession().refresh(team);

		this.addMessage(
				session,
				MESSAGE_PLAYER_INJURED_PRINCIPAL_CHANGE.format(
						new Object[]{
								principalPlayerTeam.getPlayer().getFirstname(),
								principalPlayerTeam.getPlayer().getLastname(),
								principalPlayerTeam.getPlayer().getClub().getName(),
								substitutePlayerTeam.getPlayer().getFirstname(),
								substitutePlayerTeam.getPlayer().getLastname(),
								substitutePlayerTeam.getPlayer().getClub().getName(),
								listPlayerTeam.getPlayer().getFirstname(),
								listPlayerTeam.getPlayer().getLastname(),
								listPlayerTeam.getPlayer().getClub().getName()
								}
						)
				);

	    this.sendMailToUser(
	    		session, 
	    		team.getUser(), 
	    		MESSAGE_PLAYER_INJURED_PRINCIPAL_CHANGE_SUBJECT.format(new Object[]{team.getName()}),
	    		MESSAGE_PLAYER_INJURED_PRINCIPAL_CHANGE_MAIL.format(
	    				new Object[]{
	    						user.getFirstname(), 
	    						user.getLastname(), 
	    						team.getName(),
	    						principalPlayerTeam.getPlayer().getFirstname(),
	    						principalPlayerTeam.getPlayer().getLastname(),
	    						principalPlayerTeam.getPlayer().getClub().getName(),
	    						substitutePlayerTeam.getPlayer().getFirstname(), 
	    						substitutePlayerTeam.getPlayer().getLastname(),
	    						substitutePlayerTeam.getPlayer().getClub().getName(),
	    						listPlayerTeam.getPlayer().getFirstname(), 
	    						listPlayerTeam.getPlayer().getLastname(),
	    						listPlayerTeam.getPlayer().getClub().getName()
	    						}
	    				)
	    		);
	}
	else if (substituteString != null)
	{
		PlayerTeam substitutePlayerTeam = (PlayerTeam) Database.getCurrentSession().get(
				PlayerTeam.class, 
				new Long(substituteString)
				);

		Iterator listPlayerTeamIterator = team.getListPlayerTeamList().iterator();
		PlayerTeam listPlayerTeam = null;
		while (listPlayerTeamIterator.hasNext())
		{
			listPlayerTeam = (PlayerTeam) listPlayerTeamIterator.next();
			if (listPlayerTeam.getPlayer().getPosition().getId().longValue() == substitutePlayerTeam.getPlayer().getPosition().getId().longValue())
			{
				break;
			}
		}

		PlayerTeam substitute2PlayerTeam = (PlayerTeam) Database.getCurrentSession().createQuery(
				"FROM PlayerTeam WHERE team = :team AND player.position = :position AND issubstitute = 1 AND number > :number"
				)
				.setParameter("team", team)
				.setParameter("position", substitutePlayerTeam.getPlayer().getPosition())
				.setParameter("number", substitutePlayerTeam.getNumber())
				.uniqueResult();

		Integer number = listPlayerTeam.getNumber();
		
		listPlayerTeam.setIsPrincipal(Boolean.FALSE);
		listPlayerTeam.setIsSubstitute(Boolean.TRUE);
		listPlayerTeam.setIsList(Boolean.FALSE);
		if (substitute2PlayerTeam == null)
		{
			listPlayerTeam.setNumber(substitutePlayerTeam.getNumber());
		}
		else
		{
			listPlayerTeam.setNumber(substitute2PlayerTeam.getNumber());
			substitute2PlayerTeam.setNumber(substitutePlayerTeam.getNumber());
			Database.getCurrentSession().save(substitute2PlayerTeam);
		}
		Database.getCurrentSession().save(listPlayerTeam);
		
		substitutePlayerTeam.setIsPrincipal(Boolean.FALSE);
		substitutePlayerTeam.setIsSubstitute(Boolean.FALSE);
		substitutePlayerTeam.setIsList(Boolean.TRUE);
		substitutePlayerTeam.setNumber(number);
		Database.getCurrentSession().save(substitutePlayerTeam);

		Database.getCurrentSession().flush();
		Database.getCurrentSession().refresh(team);

		this.addMessage(
				session,
				MESSAGE_PLAYER_INJURED_SUBSTITUTE_CHANGE.format(
						new Object[]{
								substitutePlayerTeam.getPlayer().getFirstname(),
								substitutePlayerTeam.getPlayer().getLastname(),
								substitutePlayerTeam.getPlayer().getClub().getName(),
								listPlayerTeam.getPlayer().getFirstname(),
								listPlayerTeam.getPlayer().getLastname(),
								listPlayerTeam.getPlayer().getClub().getName()
						}
					)
				);

	    this.sendMailToUser(
	    		session, 
	    		team.getUser(), 
	    		MESSAGE_PLAYER_INJURED_SUBSTITUTE_CHANGE_SUBJECT.format(new Object[]{team.getName()}),
	    		MESSAGE_PLAYER_INJURED_SUBSTITUTE_CHANGE_MAIL.format(
	    				new Object[]{
	    						user.getFirstname(), 
	    						user.getLastname(), 
	    						team.getName(),
	    						substitutePlayerTeam.getPlayer().getFirstname(), 
	    						substitutePlayerTeam.getPlayer().getLastname(),
	    						substitutePlayerTeam.getPlayer().getClub().getName(),
	    						listPlayerTeam.getPlayer().getFirstname(), 
	    						listPlayerTeam.getPlayer().getLastname(),
	    						listPlayerTeam.getPlayer().getClub().getName()
	    						}
	    				)
	    		);
	}
	else
	{
		this.addError(
				session,
				"Error inesperado"
				);
	}
}
%>
<html>
	<head>
	    <title>Team Edit</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="TeamEdit.jsp" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="<%=colspan%>">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									<a href="TeamList.jsp">Equipos</a>
									&nbsp;|&nbsp;
									<select name="team" onchange="javascript:document.forms[0].submit();">
<%
Iterator teamIterator = Database.getCurrentSession().createCriteria(Team.class).addOrder(Order.asc("name")).list().iterator();
Team _team;
while(teamIterator.hasNext())
{
	_team = (Team) teamIterator.next();
%>
										<option value="<%=_team.getId()%>" <%=_team == team ? "selected" : "" %>>
											<%=_team.getName()%>
									
<%
}
%>
									</select>
									&nbsp;>&nbsp;
									<a href="UserEdit.jsp?user=<%=team.getUser().getId()%>"><%=team.getUser().getFirstname()%>&nbsp;<%=team.getUser().getLastname()%></a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code" colspan="<%=colspan%>">
						<b>T&aacute;ctica:&nbsp;<%=team.getTactic()%></b>
					</td>
				</tr>
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
					<td id="code">
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
if (team.getPlayerTeamSet().size() == 0)
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
					<td id="code">
						&nbsp;
					</td>
					<td id="name" colspan="<%=colspan - 1%>">
						<b>Titulares</b>
					</td>
				</tr>
<%	
	Iterator playerTeamIterator = this.sortByPosition(team.getPrincipalPlayerTeamList()).iterator();
	PlayerTeam playerTeam;
	while (playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
%>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code"> 
						<input type="radio" name="principal" value="<%=playerTeam.getId()%>"/>
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
				</tr>
<%
	}
%>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name" colspan="<%=colspan - 1%>">
						<b>Suplentes</b>
					</td>
				</tr>
<%
	playerTeamIterator = this.sortByPosition(team.getSubstitutePlayerTeamList()).iterator();
	while (playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
%>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="radio" name="substitute" value="<%=playerTeam.getId()%>"/>
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
				</tr>
<%
	}
%>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name" colspan="<%=colspan - 1%>">
						<b>Lista de espera</b>
					</td>
				</tr>
<%
	playerTeamIterator = this.sortByPosition(team.getListPlayerTeamList()).iterator();
	while (playerTeamIterator.hasNext())
	{
		playerTeam = (PlayerTeam) playerTeamIterator.next();
%>
				<tr id="gridRow<%=rowIndex++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="radio" name="list" value="<%=playerTeam.getId()%>"/>
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
				</tr>
<%
	}
}

boolean tournamentStarted = Boolean.valueOf((String) ApplicationContext.getInstance().get(ApplicationContext.TOURNAMENT_STARTED)).booleanValue();
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="change"
							value="Cambiar"
							<%=tournamentStarted && (team.getUser().equals(user) || this.checkAuthorization(session, "TeamEdit.jsp!change")) ? "" : "disabled"%>
							/>
						<input 
							type="submit"
							name="injuredChange"
							value="Cambiar x Lesión"
							<%=tournamentStarted && this.checkAuthorization(session, "TeamEdit.jsp!change") ? "" : "disabled"%>
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

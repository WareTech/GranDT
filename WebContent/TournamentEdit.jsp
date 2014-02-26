<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="org.hibernate.Transaction"%>
<%
int colspan = 2;
int rouwCount = 0;

Transaction transaction = Database.getCurrentSession().beginTransaction();

String weekId = (String) ApplicationContext.getInstance().get(ApplicationContext.CURRENT_WEEK);
%>
<html>
	<head>
	    <title>Tournament List</title>
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
									<%=_TOURNAMENT_NAME%>
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
<%
if (weekId == null)
{
%>
						Posiciones
<%
}
else
{
%>
						<a href="PositionEdit.jsp?week=<%=weekId%>">Posiciones</a>
<%
}
%>
					</td>
				</tr>
<%--
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="CupPositionEdit.jsp?week=26&cupPhase=1">Copa</a>
					</td>
				</tr>
--%>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="WeekList.jsp">Fechas</a>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="PlayerList.jsp">Jugadores</a>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="ClubList.jsp">Clubes</a>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="TeamList.jsp">Equipos</a>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="StatisticsList.jsp">Estad&iacute;sticas</a>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="ClaimList.jsp">Reclamos</a>
					</td>
				</tr>
<%
if (this.checkAuthorization(session, "ChangeList.jsp"))
{
%>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="ChangeList.jsp">Cambios</a>
					</td>
				</tr>
<%
}

if (this.checkAuthorization(session, "UserList.jsp"))
{
%>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="UserList.jsp">Usuarios</a>
					</td>
				</tr>
<%
}

if (this.checkAuthorization(session, "AccessList.jsp"))
{
%>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="AccessList.jsp">Accesos</a>
					</td>
				</tr>
<%
}

if (this.checkAuthorization(session, "ConfigurationList.jsp"))
{
%>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="ConfigurationList.jsp">Configuraci&oacute;n</a>
					</td>
				</tr>
<%
}

if (this.checkAuthorization(session, "EMailSend.jsp"))
{
%>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="EMailSend.jsp">Enviar eMail</a>
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
transaction.commit();
%>

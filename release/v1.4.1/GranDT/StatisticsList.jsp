<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%
int colspan = 2;
int rouwCount = 0;
%>
<html>
	<head>
	    <title>Statistics List</title>
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
									Estad&iacute;sticas
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
						<a href="MostSelectedPlayerList.jsp">Jugadores m&aacute;s elegidos</a>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="PlayerPerformanceList.jsp">Estad&iacute;sticas&nbsp;de&nbsp;jugadores</a>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<a href="Stadistics.jsp">Apertura 2010</a>
					</td>
				</tr>
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

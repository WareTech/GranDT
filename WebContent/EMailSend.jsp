<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
int colspan = 2;

if (request.getParameter("send") != null)
{
	this.sendMailToAll(
			session,
			request.getParameter("subject"),
			request.getParameter("text")
			);
	this.addMessage(
			session, 
			"El email ha sido enviado correctamente"
			);
}
%>
<html>
	<head>
	    <title>eMail Send</title>
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
									Enviar eMail
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridRow2">
					<td id="code">
						T&iacute;tulo
					</td>
					<td id="name">
						<input type="text" name="subject" style="overflow:auto; width:100%;"/>
					</td>
				</tr>
				<tr id="gridRow2">
					<td id="code" style="vertical-align: top">
						Texto
					</td>
					<td id="name">
						<textarea name="text" rows="20" cols="20" style="overflow:auto; width:100%;"></textarea>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="send"
							value="Enviar"
							/>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>

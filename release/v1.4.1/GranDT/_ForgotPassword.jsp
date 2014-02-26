<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%
if (request.getParameter("submit") != null)
{
	String email = request.getParameter("email");
	if (email == null || "".equals(email))
	{
		this.addError(session, "'eMail' es requerido");	
	}
	
	if (this.getErrorList(session).size() == 0)
	{
		Database.getCurrentSession().beginTransaction();
		User user = (User) Database.getCurrentSession().createCriteria(
				User.class
				)
				.add(Expression.eq("email", email))
				.uniqueResult();
		
		if (user != null)
		{
			String password = new Long(System.currentTimeMillis()).toString().substring(0, 6);
			user.setPassword((new sun.misc.BASE64Encoder()).encode(password.getBytes()));
			Database.getCurrentSession().save(user);
			
			Database.getCurrentSession().getTransaction().commit();
			this.sendMailToUser(
					session, 
					user, 
					"GranDT - Nueva Clave",
					new StringBuffer()
						.append("Usuario: ").append(user.getUsername()).append("\n")
						.append("Clave: ").append(password).append("\n")
						.append("\n")
						.append("http://GranDT.WareTech.com.ar\n")
						.toString()
					);
			this.addMessage(session, "La nueva clave le ha sido enviada por email");
			
			response.sendRedirect("_Login.jsp");
			return;
		}

		Database.getCurrentSession().getTransaction().commit();
		this.addError(session, "Dirección de email no registrada");
	}
}
int colspan = 2;
%>
<html>
	<head>
	    <title>Forgot Password</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="" method="post">
			<table width="100%" border="0">
				<tr id="title" bordercolor="#FFFFFF">
					<td colspan="<%=colspan%>">
						Olvid&oacute; su clave?						
					</td>
				</tr>
				<tr id="gridRow1">
					<td id="name" style="width:50%; text-align:right">
						eMail
					</td>
					<td id="name" style="width:50%">
						<input type="text" name="email" size="50"/>
						&nbsp;&nbsp;&nbsp;
						<a href="#" onclick="javascript: alert('Sos muy pelotudo!\nMandá un mail a GranDT@WareTech.com.ar, y...\nCHUPALA!!!')"><i>Olvid&eacute; mi email ...</i></a>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>" align="center">
						<input 
							type="submit"
							name="submit"
							value="Enviar"
							/>
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>

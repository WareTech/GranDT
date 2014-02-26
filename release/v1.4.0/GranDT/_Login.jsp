<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%
if (request.getParameter("login") != null)
{
	String username = request.getParameter("username");
	if (username == null || "".equals(username))
	{
		this.addError(session, "'Usuario' es requerido");	
	}
	
	String password = request.getParameter("password");
	if (password == null || "".equals(password))
	{
		this.addError(session, "'Clave' es requerido");	
	}
	
	if (this.getErrorList(session).size() == 0)
	{
		Database.getCurrentSession().beginTransaction();
		User user = (User) Database.getCurrentSession().createCriteria(
				User.class
				)
				.add(Expression.eq("username", username))
				.add(Expression.eq("password", (new sun.misc.BASE64Encoder()).encode(password.getBytes())))
				.uniqueResult();
		
		Database.getCurrentSession().getTransaction().commit();
	
		if (user != null)
		{
			session.setAttribute(User.class.getName(), user);
			response.sendRedirect("index.jsp");
		}
		
		this.addError(session, "Login incorrecto");
	}
}
else if (session.getAttribute(User.class.getName()) != null)
{
	response.sendRedirect("index.jsp");
}

int colspan = 2;
%>
<html>
	<head>
	    <title>Login</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	
	<body onload="document.forms[0].username.focus();">
<%@include file="Header.jsp"%>
		<form action="" method="post">
			<table width="100%" border="0">
				<tr id="title" bordercolor="#FFFFFF">
					<td colspan="<%=colspan%>">
						Ingrese a GranDT						
					</td>
				</tr>
				<tr id="gridRow1">
					<td id="name" style="width:50%; text-align:right">
						Usuario
					</td>
					<td id="name" style="width:50%">
						<input type="text" name="username"/>
					</td>
				</tr>
				<tr id="gridRow1">
					<td id="name" style="width:50%; text-align:right">
						Clave
					</td>
					<td id="name" style="width:50%">
						<input type="password" name="password"/>
						&nbsp;&nbsp;&nbsp;
						<a href="_ForgotPassword.jsp"><i>Olvid&eacute; mi clave ...</i></a>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>" align="center">
						<input 
							type="submit"
							name="login"
							value="Ingresar"
							/>
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>

<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.frontend.web.SecurityFilter"%>
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
		User user = (User) Database.getCurrentSession().createCriteria(
				User.class
				)
				.add(Expression.eq("username", username))
				.add(Expression.eq("password", (new sun.misc.BASE64Encoder()).encode(password.getBytes())))
				.uniqueResult();
		
		if (user != null)
		{
			session.setAttribute(User.class.getName(), user);
			String redirectAfterLogin = this.popRedirectAfterLogin(session);
			if (redirectAfterLogin == null)
			{
				redirectAfterLogin = request.getContextPath() + "/index.jsp";
			}
			response.sendRedirect(redirectAfterLogin);

			return;
		}
		
		this.addError(session, "Login incorrecto");
	}
}
else if (session.getAttribute(User.class.getName()) != null)
{
	response.sendRedirect(request.getContextPath() + "/index.jsp");

	return;
}

int colspan = 2;
%>
<html>
	<head>
	    <title>Login</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
		<link rel="stylesheet" type="text/css" href="mobile.css">
	</head>
	
	
	<body onload="document.forms[0].username.focus();">
<%@include file="Header.jsp"%>
		<form action="" method="post">
			<table class="login">
				<thead>
					<tr class="title">
						<td colspan="<%=colspan%>">Ingres&aacute; al Gran DT</td>
					</tr>
				</thead>
				<tbody>
					<tr class="username">
						<td class="label">Usuario</td>
						<td class="input">
							<input type="text" name="username" placeholder="Usuario"/>
						</td>
					</tr>
					<tr class="password">
						<td class="label">Clave</td>
						<td class="input">
							<input type="password" name="password" placeholder="Clave"/>
						</td>
					</tr>
					<tr class="submit">
						<td colspan="<%=colspan%>" class="input">
							<input type=submit name="login" value="Ingresar"/>
						</td>
					</tr>
					<tr class="forgotPassword">
						<td colspan="<%=colspan%>" class="link">
							<a href="_ForgotPassword.jsp"><i>Olvid&eacute; mi clave ...</i></a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>

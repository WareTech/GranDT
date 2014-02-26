<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%
Database.getCurrentSession().beginTransaction();

boolean authorized = this.checkAuthorization(session, "UserEdit.jsp!update");

String userId = request.getParameter("user");
User user = (User) Database.getCurrentSession().get(User.class, new Long(userId));

Access access;
UserAccess userAccess;
if (request.getParameter("save") != null)
{
	String firstname = request.getParameter("firstname");
	if (firstname == null || "".equals(firstname))
	{
		this.addError(session, "'Nombre' es requerido");
	}
	String lastname = request.getParameter("lastname");
	if (lastname == null || "".equals(lastname))
	{
		this.addError(session, "'Apellido' es requerido");
	}
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
	String email = request.getParameter("email");
	if (email == null || "".equals(email))
	{
		this.addError(session, "'eMail' es requerido");
	}
	
	if (this.getErrorList(session).size() == 0)
	{
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setUsername(username);
		user.setPassword((new sun.misc.BASE64Encoder()).encode(password.getBytes()));
		user.setEmail(email);
		Database.getCurrentSession().update(user);
		Database.getCurrentSession().flush();
		
		this.addMessage(session, "Usuario actualizado correctamente");
		
		if (user.getEmail() != null && !"".equals(user.getEmail()))
		{
    		String text = new StringBuffer()
				.append("Su usuario de GranDT ha sido actualizado. Los nuevos datos son:\n")
				.append("Nombre: ").append(user.getUsername()).append("\n")
				.append("Apellido: ").append(user.getLastname()).append("\n")
				.append("Usuario: ").append(user.getUsername()).append("\n")
				.append("Clave: ").append(password).append("\n")
				.append("eMail: ").append(user.getEmail()).append("\n")
				.append("Acceda al GranDT a través de http://GranDT.WareTech.com.ar\n")
				.append("\nGerencia de Sistemas del GranDT\n")
				.append("Comunidad Azuliana\n")
				.append("República Bolivariana de Robinson\n")
				.toString();
    		
			this.sendMailToUser(
					session, 
					user, 
					"GranDT - Actualización de usuario",
					text
					);
		}
	}
}
else if (request.getParameter("add") != null && request.getParameterMap().get("toAddAccessList") != null)
{
	String[] accessIdArray = (String[]) request.getParameterMap().get("toAddAccessList");
	for(
			int index = 0; 
			index < accessIdArray.length; 
			index++
			)
	{
		access = (Access) Database.getCurrentSession().get(Access.class, new Long(accessIdArray[index]));
		userAccess = new UserAccess();
		userAccess.setUser(user);
		userAccess.setAccess(access);
		Database.getCurrentSession().save(userAccess);
	}
	Database.getCurrentSession().flush();
}
else if (request.getParameter("remove") != null && request.getParameterMap().get("toRemoveAccessList") != null)
{
	String[] accessIdArray = (String[]) request.getParameterMap().get("toRemoveAccessList");
	for(
			int index = 0; 
			index < accessIdArray.length; 
			index++
			)
	{
		userAccess = (UserAccess) Database.getCurrentSession().get(UserAccess.class, new Long(accessIdArray[index]));
		Database.getCurrentSession().delete(userAccess);
	}
	Database.getCurrentSession().flush();
}
else if (request.getParameter("addAll") != null)
{
	Criteria accessCriteria = Database.getCurrentSession().createCriteria(Access.class);
	
	List accessList = Database.getCurrentSession().createQuery(
			"SELECT access.id FROM UserAccess WHERE user = :user"
			)
			.setEntity("user", user)
			.list();
	if (accessList.size() > 0)
	{
		accessCriteria.add(Expression.not(Expression.in("id", accessList)));
	}
	Iterator accessIterator = accessCriteria.list().iterator();
	
	while(accessIterator.hasNext())
	{
		access = (Access) accessIterator.next();
		userAccess = new UserAccess();
		userAccess.setUser(user);
		userAccess.setAccess(access);
		Database.getCurrentSession().save(userAccess);
	}
	Database.getCurrentSession().flush();
}
else if (request.getParameter("removeAll") != null)
{
	Iterator userAccessIterator = Database.getCurrentSession().createCriteria(
			UserAccess.class
			)
			.add(Expression.eq("user", user))
			.list()
			.iterator();
	while(userAccessIterator.hasNext())
	{
		userAccess = (UserAccess) userAccessIterator.next();
		Database.getCurrentSession().delete(userAccess);
	}
	Database.getCurrentSession().flush();
}
%>
<%
int colspan = 2;
int rouwCount = 0;
%>
<html>
	<head>
	    <title>User Edit</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="UserEdit.jsp" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="<%=colspan%>">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									<a href="UserList.jsp">Usuarios</a>
									&nbsp;|&nbsp;
									<select name="user" onchange="javascript:document.forms[0].submit();">
<%
Iterator userIterator = Database.getCurrentSession().createCriteria(User.class).addOrder(Order.asc("lastname")).list().iterator();
User _user;
while(userIterator.hasNext())
{
	_user = (User) userIterator.next();
%>
										<option value="<%=_user.getId()%>" <%=_user == user ? "selected" : "" %>>
											<%=_user.getLastname()%>, <%=_user.getFirstname()%>
									
<%
}
%>
									</select>
<%
if (user.getTeam() != null)
{
%>
									&nbsp;>&nbsp;
									<a href="TeamEdit.jsp?team=<%=user.getTeam().getId()%>"><%=user.getTeam().getName()%></a>
<%
}
%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Nombre
					</td>
					<td id="name">
						<input type="text" name="firstname" value="<%=user.getFirstname()%>" readonly <%=authorized || _USER.getId().longValue() == user.getId().longValue() ? "" : "disabled" %>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Apellido
					</td>
					<td id="name">
						<input type="text" name="lastname" value="<%=user.getLastname()%>" readonly <%=authorized || _USER.getId().longValue() == user.getId().longValue() ? "" : "disabled" %>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Usuario
					</td>
					<td id="name">
						<input type="text" name="username" value="<%=user.getUsername()%>" readonly <%=authorized || _USER.getId().longValue() == user.getId().longValue() ? "" : "disabled"%>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						Clave
					</td>
					<td id="name">
						<input type="password" name="password" value="" <%=authorized || _USER.getId().longValue() == user.getId().longValue() ? "" : "disabled"%>/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						eMail
					</td>
					<td id="name">
						<input type="name" name="email" value="<%=user.getEmail()%>" size="50" <%=authorized || _USER.getId().longValue() == user.getId().longValue() ? "" : "disabled"%>/>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="save"
							value="Guardar"
							<%=authorized || _USER.getId().longValue() == user.getId().longValue() ? "" : "disabled"%>
							/>
					</td>
				</tr>
			</table>
			<table width="100%">
				<tr id="gridHeader">
					<td colspan="3" align="right">
						Accessos
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td width="45%">Disponibles</td>
					<td width="10%">&nbsp;</td>
					<td width="45%">Asignados</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td>
						<select name="toAddAccessList" size="18" style="overflow:auto; width:100%;" multiple="multiple" <%=authorized ? "" : "disabled"%>>
<%
List userAccessList = Database.getCurrentSession().createCriteria(
		UserAccess.class
		)
		.add(Expression.eq("user", user))
		.list();
Criteria accessCriteria = Database.getCurrentSession().createCriteria(Access.class);
if (userAccessList.size() > 0)
{
	Iterator userAccessIterator = userAccessList.iterator();
	while(userAccessIterator.hasNext())
	{
		userAccess = (UserAccess) userAccessIterator.next();
		accessCriteria.add(Expression.ne("id", userAccess.getAccess().getId()));
	}
}
Iterator accessIterator = accessCriteria.list().iterator();
while(accessIterator.hasNext())
{
	access = (Access) accessIterator.next();
%>
						    <option value="<%=access.getId()%>">
						    	<%=access.getDescription()%>&nbsp;(<%=access.getValue()%>)
						    </option>
<%
}
%>
						</select>
					</td>
					<td>
						<table width="100%">
							<tr>
								<td align="center">
									<input type="submit" name="add" value="&gt;" <%=authorized ? "" : "disabled"%>/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" name="remove" value="&lt;" <%=authorized ? "" : "disabled"%>/>
								</td>
							</tr>
							<tr>
								<td align="center">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" name="addAll" value="&gt;&gt;" <%=authorized ? "" : "disabled"%>/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" name="removeAll" value="&lt;&lt;" <%=authorized ? "" : "disabled"%>/>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<select name="toRemoveAccessList" size="18" style="overflow:auto; width:100%;" multiple="multiple" <%=authorized ? "" : "disabled"%>>
<%
Iterator userAccessIterator = userAccessList.iterator();
while(userAccessIterator.hasNext())
{
	userAccess = (UserAccess) userAccessIterator.next();
%>
						    <option value="<%=userAccess.getId()%>">
						    	<%=userAccess.getAccess().getDescription()%>&nbsp;(<%=userAccess.getAccess().getValue()%>)
						    </option>
<%
}
%>
						</select>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="3">
						&nbsp;
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

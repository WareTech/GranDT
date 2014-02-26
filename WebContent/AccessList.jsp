<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 3;
int accessCount = 0;	

Database.getCurrentSession().beginTransaction();

Access access = null;
if (request.getParameter("edit") != null)
{
	String accessId = request.getParameter("access");
	if (accessId != null && !"".equals(accessId))
	{
		access = (Access) Database.getCurrentSession().get(Access.class, new Long(accessId));
	}
}
else if (request.getParameter("delete") != null)
{
	String accessId = request.getParameter("access");
	if (accessId != null && !"".equals(accessId))
	{
		access = (Access) Database.getCurrentSession().get(Access.class, new Long(accessId));
		Database.getCurrentSession().delete(access);
		Database.getCurrentSession().flush();
		this.addMessage(session, "El acceso fue eliminado correctamente");		
		access = null;
	}
}
else if  (request.getParameter("accept") != null)
{
	String accessId = request.getParameter("access");

	String description = request.getParameter("description");
	if (description == null || "".equals(description))
	{
		this.addError(session, "'Descripci&oacute;n' es requerido");		
	}
	
	String value = request.getParameter("value");
	if (value == null || "".equals(value))
	{
		this.addError(session, "'Valor' es requerido");		
	}

	if (this.getErrorList(session).size() == 0)
	{
		if (accessId == null || "".equals(accessId))
		{
			access = new Access();
			access.setDescription(description);
			access.setValue(value);
			Database.getCurrentSession().save(access);
			this.addMessage(session, "El acceso fue creado correctamente");		
		}
		else
		{
			access = (Access) Database.getCurrentSession().get(Access.class, new Long(accessId));
			access.setDescription(description);
			access.setValue(value);
			Database.getCurrentSession().update(access);
			this.addMessage(session, "El acceso fue modificado correctamente");		
		}
		Database.getCurrentSession().flush();
		access = null;
	}
}

Criteria accessCriteria = Database.getCurrentSession().createCriteria(Access.class);
accessCriteria.addOrder(Order.asc("description"));
Iterator accessIterator = accessCriteria.list().iterator();
%>
<html>
	<head>
	    <title>Access List</title>
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
									Accesos
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridHeader">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						Descripci&oacute;n
					</td>
					<td id="name">
						Valor
					</td>
				</tr>
<%
if (access == null)
{
%>
				<tr id="gridRow<%= accessCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<input type="text" name="description" style="overflow:auto; width:100%;"/> 
					</td>
					<td id="name">
						<input type="text" name="value" style="overflow:auto; width:100%;"/> 
					</td>
				</tr>
<%
}
else 
{
%>
				<tr id="gridRow<%= accessCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="hidden" name="access" value="<%=access.getId()%>"/>
					</td>
					<td id="name">
						<input type="text" name="description" value="<%=access.getDescription()%>" style="overflow:auto; width:100%;"/> 
					</td>
					<td id="name">
						<input type="text" name="value" value="<%=access.getValue()%>" style="overflow:auto; width:100%;"/> 
					</td>
				</tr>
<%
}
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="accept"
							value="Aceptar"
							/>
					</td>
				</tr>
<%
if (!accessIterator.hasNext())
{
%>
				<tr id="gridRow<%= accessCount++ % 2 == 0 ? 1 : 2%>">
					<td colspan="<%=colspan%>">
						No hay elementos
					</td>
				</tr>	
<%
}
else
{
	while (accessIterator.hasNext())
	{
		access = (Access) accessIterator.next();
%>
				<tr id="gridRow<%= accessCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="radio" name="access" value="<%=access.getId()%>"/>
					</td>
					<td id="name">
						<%=access.getDescription()%>
					</td>
					<td id="name">
						<%=access.getValue()%>
					</td>
				</tr>
<%
	}
}
%>
				<tr id="buttonBar">
					<td colspan="<%=colspan%>">
						<input 
							type="submit"
							name="create"
							value="Crear"
							/>
						<input 
							type="submit"
							name="edit"
							value="Editar"
							/>
						&nbsp;|&nbsp;
						<input 
							type="submit"
							name="delete"
							value="Borrar"
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
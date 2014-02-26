<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 3;
int configurationCount = 0;	

Database.getCurrentSession().beginTransaction();

Configuration configuration = null;
if (request.getParameter("edit") != null)
{
	String configurationId = request.getParameter("configuration");
	if (configurationId != null && !"".equals(configurationId))
	{
		configuration = (Configuration) Database.getCurrentSession().get(Configuration.class, new Long(configurationId));
	}
}
else if (request.getParameter("delete") != null)
{
	String configurationId = request.getParameter("configuration");
	if (configurationId != null && !"".equals(configurationId))
	{
		configuration = (Configuration) Database.getCurrentSession().get(Configuration.class, new Long(configurationId));
		Database.getCurrentSession().delete(configuration);
		Database.getCurrentSession().flush();
		this.addMessage(session, "El registro fue eliminado correctamente");
		ApplicationContext.getInstance().init();
		configuration = null;
	}
}
else if  (request.getParameter("accept") != null)
{
	String configurationId = request.getParameter("configuration");

	String key = request.getParameter("key");
	if (key == null || "".equals(key))
	{
		this.addError(session, "'Clave' es requerido");		
	}
	
	String value = request.getParameter("value");
	if (value == null || "".equals(value))
	{
		this.addError(session, "'Valor' es requerido");		
	}

	if (this.getErrorList(session).size() == 0)
	{
		if (configurationId == null || "".equals(configurationId))
		{
			configuration = new Configuration();
			configuration.setKey(key);
			configuration.setValue(value);
			Database.getCurrentSession().save(configuration);
			this.addMessage(session, "El registro fue creado correctamente");		
		}
		else
		{
			configuration = (Configuration) Database.getCurrentSession().get(Configuration.class, new Long(configurationId));
			configuration.setKey(key);
			configuration.setValue(value);
			Database.getCurrentSession().update(configuration);
			this.addMessage(session, "El registro fue modificado correctamente");		
		}
		Database.getCurrentSession().flush();
		ApplicationContext.getInstance().init();
		configuration = null;
	}
}

Criteria configurationCriteria = Database.getCurrentSession().createCriteria(Configuration.class);
configurationCriteria.addOrder(Order.asc("key"));
Iterator configurationIterator = configurationCriteria.list().iterator();
%>
<html>
	<head>
	    <title>Configuration List</title>
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
									Configuraci&oacute;n
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
						Clave
					</td>
					<td id="name">
						Valor
					</td>
				</tr>
<%
if (configuration == null)
{
%>
				<tr id="gridRow<%= configurationCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						&nbsp;
					</td>
					<td id="name">
						<input type="text" name="key" style="overflow:auto; width:100%;"/> 
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
				<tr id="gridRow<%= configurationCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="hidden" name="configuration" value="<%=configuration.getId()%>"/>
					</td>
					<td id="name">
						<input type="text" name="key" value="<%=configuration.getKey()%>" style="overflow:auto; width:100%;"/> 
					</td>
					<td id="name">
						<input type="text" name="value" value="<%=configuration.getValue()%>" style="overflow:auto; width:100%;"/> 
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
if (!configurationIterator.hasNext())
{
%>
				<tr id="gridRow<%= configurationCount++ % 2 == 0 ? 1 : 2%>">
					<td colspan="<%=colspan%>">
						No hay elementos
					</td>
				</tr>	
<%
}
else
{
	while (configurationIterator.hasNext())
	{
		configuration = (Configuration) configurationIterator.next();
%>
				<tr id="gridRow<%= configurationCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="radio" name="configuration" value="<%=configuration.getId()%>"/>
					</td>
					<td id="name">
						<%=configuration.getKey()%>
					</td>
					<td id="name">
						<%=configuration.getValue()%>
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
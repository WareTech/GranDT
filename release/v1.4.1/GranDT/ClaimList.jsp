<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%
if (request.getParameter("create") != null)
{
	response.sendRedirect("ClaimCreate.jsp");
	return;
}
else if (request.getParameter("delete") != null)
{
	String[] claimList = (String[]) request.getParameterMap().get("claim");
	if (claimList == null)
	{
		this.addError(session, "Debe seleccionar alg&uacute;n reclamo para borrar");	
	}
	else
	{
		Database.getCurrentSession().beginTransaction();
		for(
				int claimIndex = 0;
				claimIndex < claimList.length;
				claimIndex++
				)
		{
			Database.getCurrentSession().createQuery(
					"DELETE FROM Claim WHERE id = :claim"
					)
					.setLong("claim", new Long(claimList[claimIndex]).longValue())
					.executeUpdate();
		}
		Database.getCurrentSession().getTransaction().commit();
		
		this.addMessage(session, "Los reclamos han sido borrados");
	}
}

int colspan = 8;

Database.getCurrentSession().beginTransaction();
Criteria criteria = Database.getCurrentSession().createCriteria(Claim.class);
if (request.getParameter("state") == null)
{
	criteria.add(Expression.ne("state", new Integer(Claim.STATE_CLOSE)));
}
criteria.addOrder(Order.asc("priority"));
criteria.addOrder(Order.asc("date"));
Iterator claimIterator = criteria.list().iterator();
%>
<html>
	<head>
	    <title>Claim List</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<form action="ClaimList.jsp" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="<%=colspan%>">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									Reclamos
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
						T&iacute;tulo
					</td>
					<td id="name">
						Descripci&oacute;n
					</td>
					<td id="code">
						Objetivo
					</td>
					<td id="code">
						Prioridad
					</td>
					<td id="code">
						Usuario
					</td>
					<td id="code">
						Fecha
					</td>
					<td id="code" nowrap>
						Estado&nbsp;
						<input 
							type="checkbox" 
							name="state" 
							<%=request.getParameter("state") == null ? "" : "checked" %>
							onchange="javascript:document.forms[0].submit();"
							>
					</td>
				</tr>
<%
if (!claimIterator.hasNext())
{
%>
				<tr id="gridRow1">
					<td colspan="<%=colspan%>">
						No hay elementos
					</td>
				</tr>	
<%
}
else
{
	Claim claim = null;
	int rowCount = 0;	
	while (claimIterator.hasNext())
	{
		claim = (Claim) claimIterator.next();
%>
				<tr id="gridRow<%=rowCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="checkbox" name="claim" value="<%=claim.getId()%>"/>
					</td>
					<td id="name">
						<%=claim.getTitle()%>
					</td>
					<td id="name">
<%
if (claim.getDescription().length() < 20)
{
%>
						<%=claim.getDescription()%>
<%
}
else
{
%>
						<%=claim.getDescription().substring(0, 20)%>&nbsp;<a href="#" onclick="javascript:alert('<%=claim.getDescription()%>');">...</a>
<%
}
%>
					</td>
					<td id="code">
						<%=Claim.TARGET[claim.getTarget().intValue()]%>
					</td>
					<td id="code">
						<%=Claim.PRIORITY[claim.getPriority().intValue()]%>
					</td>
					<td id="code" nowrap>
						<%=claim.getUser().getLastname()%>,&nbsp;<%=claim.getUser().getFirstname()%>
					</td>
					<td id="code" nowrap>
						<%=Claim.DATE_FORMAT.format(claim.getDate())%>
					</td>
					<td id="code">
						<%=Claim.STATE[claim.getState().intValue()]%>
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
							name="delete"
							value="Borrar"
							<%=this.checkAuthorization(session, "ClaimList.jsp!delete") ? "" : "disabled"%>
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
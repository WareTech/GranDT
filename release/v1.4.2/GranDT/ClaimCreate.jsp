<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
Claim claim = null;
if (request.getParameter("accept") != null)
{
	claim = new Claim();
	
	if ("".equals(request.getParameter("title")))
	{
		this.addError(session, "'T&iacute;tulo' es requerido");
	}
	else
	{
		claim.setTitle(request.getParameter("title"));
	}
	
	claim.setDescription(request.getParameter("description"));
	if ("".equals(request.getParameter("description")))
	{
		this.addError(session, "'Descripci&oacute;n' es requerido");
	}
	else
	{
		claim.setDescription(request.getParameter("description"));
	}
	
	claim.setTarget(new Integer(request.getParameter("target")));
	claim.setPriority(new Integer(request.getParameter("priority")));

	if (this.getErrorList(session).size() == 0)
	{
		claim.setUser(this.getUser(session));
		claim.setDate(new Date());
		claim.setState(new Integer(0));
		
		Database.getCurrentSession().beginTransaction();
		Database.getCurrentSession().save(claim);
		Database.getCurrentSession().getTransaction().commit();
		
		this.addMessage(session, "Reclamo guardado");
		this.sendMail(
				session,
				Arrays.asList(
						new Object[]{
							claim.getTarget().intValue() == Claim.TARGET_ORGA ?
							"ESPNDePrimera@Hotmail.com" :
							"GranDT@WareTech.com.ar"
							}
						),
				new StringBuffer()
					.append("Nuevo reclamo de ")
					.append(this.getUser(session).getFirstname())
					.append(" ")
					.append(this.getUser(session).getLastname())
					.toString(),
				new StringBuffer()
					.append(claim.getTitle()).append("\n")
					.append(claim.getDescription()).append("\n")
					.append("Prioridad: ").append(Claim.PRIORITY[claim.getPriority().intValue()])
					.toString()
				);
		
		response.sendRedirect("ClaimList.jsp");
		return;
	}
}
else if (request.getParameter("cancel") != null)
{
	response.sendRedirect("ClaimList.jsp");
	return;
}
%>
<html>
	<head>
	    <title>Claim List</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
<%
int rouwCount = 0;
%>
		<form action="ClaimCreate.jsp" method="post">
			<table width="100%">
				<tr id="title">
					<td colspan="2">
						<table width="100%">
							<tr id="title">
								<td width="1%">
									<a href="TournamentEdit.jsp"><%=_TOURNAMENT_NAME%></a>
									&nbsp;|&nbsp;
									<a href="ClaimList.jsp">Reclamos</a>
									&nbsp;|&nbsp;
									Crear
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						<b>T&iacute;tulo</b>
					</td>
					<td id="name">
						<input type="text" name="title" value="<%=claim == null || claim.getTitle() == null ? "" : claim.getTitle()%>" style="overflow:auto; width:100%;"/>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						<b>Descripci&oacute;n</b>
					</td>
					<td id="name">
						<textarea name="description" rows="10" cols="20" style="overflow:auto; width:100%;"><%=claim == null || claim.getDescription() == null ? "" : claim.getDescription()%></textarea>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						<b>Objetivo</b>
					</td>
					<td id="name">
						<select name="target">
<%
for(
		int targetIndex = 0;
		targetIndex < Claim.TARGET.length;
		targetIndex++
		)
{
%>
							<option 
								value="<%=targetIndex%>" 
								<%=claim == null || claim.getTarget() == null || claim.getTarget().intValue() != targetIndex ? "" : "selected"%>
								>
								<%=Claim.TARGET[targetIndex]%>
<%
}
%>
						</select>
					</td>
				</tr>
				<tr id="gridRow<%=(rouwCount++ % 2) + 1%>">
					<td id="name">
						<b>Prioridad</b>
					</td>
					<td id="name">
						<select name="priority">
<%
for(
		int priorityIndex = Claim.PRIORITY.length - 1;
		priorityIndex >= 0;
		priorityIndex--
		)
{
%>
							<option 
								value="<%=priorityIndex%>" 
								<%=claim == null || claim.getPriority() == null || claim.getPriority().intValue() != priorityIndex ? "" : "selected"%>
								>
								<%=Claim.PRIORITY[priorityIndex]%>
<%
}
%>
						</select>
					</td>
				</tr>
				<tr id="buttonBar">
					<td colspan="2">
						<input 
							type="submit"
							name="accept"
							value="Aceptar"
							/>
						<input 
							type="submit"
							name="cancel"
							value="Cancelar"
							/>
					</td>
				</tr>
			</table>
		</form>
<%@include file="Footer.jsp"%>
	</body>
</html>

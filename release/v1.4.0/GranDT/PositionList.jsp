<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 2;

Database.getCurrentSession().beginTransaction();
Criteria weekCriteria = Database.getCurrentSession().createCriteria(Week.class);
weekCriteria.addOrder(Order.asc("number"));
List weekList = weekCriteria.list();
%>
<html>
	<head>
	    <title>Week List</title>
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
									Posiciones
								</td>
							</tr>
						</table>
					</td>
				</tr>
<%
if (weekList.size() == 0)
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
	Iterator weekIterator = weekList.iterator();
	Week week = null;
	int weekCount = 0;	
	while (weekIterator.hasNext())
	{
		week = (Week) weekIterator.next();
%>
				<tr id="gridRow<%= weekCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="checkbox" id="week_<%=week.getId()%>" name="week_<%=week.getId()%>"/>
					</td>
					<td id="name">
						<a href="PositionEdit.jsp?week=<%=week.getId()%>">Fecha&nbsp;<%=week.getNumber()%></a>
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
						&nbsp;<b>|</b>&nbsp;
						<input 
							type="submit"
							name="calculate"
							value="Calcular"
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

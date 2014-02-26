<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
int colspan = 2;
int rouwCount = 0;

Database.getCurrentSession().beginTransaction();
Criteria categoryCriteria = Database.getCurrentSession().createCriteria(Category.class);
categoryCriteria.addOrder(Order.asc("id"));
List categoryList = categoryCriteria.list();
%>
<html>
	<head>
	    <title>Category List</title>
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
									Categor&iacute;as
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
						Nombre
					</td>
				</tr>
<%
if (categoryList.size() == 0)
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
	Iterator categoryIterator = categoryList.iterator();
	Category category = null;
	int categoryCount = 0;	
	while (categoryIterator.hasNext())
	{
		category = (Category) categoryIterator.next();
%>
				<tr id="gridRow<%= categoryCount++ % 2 == 0 ? 1 : 2%>">
					<td id="code">
						<input type="checkbox" id="category_<%=category.getId()%>" name="category_<%=category.getId()%>"/>
					</td>
					<td id="name">
						<a href="CategoryEdit.jsp?category=<%=category.getId()%>"><%=category.getName()%></a>
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
							value="create"
							/>
						<input 
							type="submit"
							value="edit"
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
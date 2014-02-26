<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
Database.getCurrentSession().beginTransaction();

Iterator playerIterator = Database.getCurrentSession().createCriteria(Player.class).list().iterator();
Player player = null;
while (playerIterator.hasNext())
{
	player = (Player) playerIterator.next();
	
	
	
}

Database.getCurrentSession().getTransaction().commit();
%>
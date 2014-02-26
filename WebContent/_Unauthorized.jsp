<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
this.addError(session, "No esta autorizado para acceder a la pagina");
%>
<html>
	<head>
	    <title>Unauthorized</title>
		<link rel="stylesheet" type="text/css" href="style1.css">
	</head>
	
	<body>
<%@include file="Header.jsp"%>
		<br>
<%@include file="Footer.jsp"%>
	</body>
</html>

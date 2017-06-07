<%@page import="org.hibernate.criterion.Criterion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.User"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="org.json.JSONObject"%>

<%
JSONObject jsonResponse = new JSONObject();

String id = request.getQueryString();
if (id == null)
{
	out.print(jsonResponse);
	return;
}

id = id.trim();
if ("".equals(id))
{
	out.print(jsonResponse);
	return;
}

User user = (User) Database.getCurrentSession().get(User.class, new Long(id));

if (user == null)
{
	out.print(jsonResponse);
	return;
}
	
jsonResponse.put("id", user.getId());
jsonResponse.put("email", user.getEmail());	
jsonResponse.put("firstname", user.getFirstname());	
jsonResponse.put("lastname", user.getLastname());	
jsonResponse.put("username", user.getUsername());	

out.print(jsonResponse);
%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.WareTech.GranDT.middleware.entities.User"%>
<%@page import="ar.com.WareTech.GranDT.backend.Database"%>
<%@page import="org.json.*"%>

<%
Iterator userIterator = Database.getCurrentSession().createCriteria(User.class).list().iterator();
JSONArray jsonResponse = new JSONArray(); 
while(userIterator.hasNext()) 
{
	User user = (User) userIterator.next();
	
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("id", user.getId());	
	jsonObject.put("email", user.getEmail());	
	jsonObject.put("firstname", user.getFirstname());	
	jsonObject.put("lastname", user.getLastname());	
	jsonObject.put("username", user.getUsername());	

	jsonResponse.put(jsonObject);
}
out.print(jsonResponse);
%>
<%@page import="org.json.JSONObject"%>
<%
JSONObject jsonObject = new JSONObject();
jsonObject.put("JSON", "Hello, World!");
jsonObject.put("NUMBER", 1);
jsonObject.put("Array", new String[]{"One", "Two", "Three", "Four", "Five"});

out.print(jsonObject);
%>
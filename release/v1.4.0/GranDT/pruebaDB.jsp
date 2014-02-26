<%@page import="java.sql.*"%>
<%
try
{
	String driverName = request.getParameter("driverName") == null ? "org.gjt.mm.mysql.Driver" : request.getParameter("driverName");
	String connectionString = request.getParameter("connectionString") == null? "jdbc:mysql://localhost/waretech_GranDT" : request.getParameter("connectionString");
	String username = request.getParameter("username") == null ? "grandt" : request.getParameter("username");
	String password = request.getParameter("password") == null ? "Pa$$word" : request.getParameter("password");
	String query = request.getParameter("query") == null ? null : request.getParameter("query");
%>
<form method="post">
	<input type="text" name="driverName" value="<%=driverName%>" size="50"/>
	<br>
	<input type="text" name="connectionString" value="<%=connectionString%>" size="50"/>
	<br>
	<input type="text" name="username" value="<%=username%>" size="50"/>
	<br>
	<input type="text" name="password" value="<%=password%>" size="50"/>
	<br>
	<textarea rows="8" cols="50" name="query"><%=query == null ? "" : query%></textarea>
	<br>
	<input type="submit" value="submit"/>
</form>
<%
	if (query == null)
	{
		return;
	}

	Class.forName(driverName);
	Connection connection = DriverManager.getConnection(connectionString, username, password);
	ResultSet resultSet = connection.createStatement().executeQuery(query);
	ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
	
	int columnCount = resultSetMetaData.getColumnCount();
	out.println("<table>");
	out.println("<tr>");
	for (int columnIndex = 0; columnIndex < columnCount; columnIndex++)
	{
		out.print("<td>");
		out.print(resultSetMetaData.getColumnName(columnIndex + 1));
		out.print("</td>");
		out.println();
	}
	out.println("</tr>");

	while (resultSet.next())
	{
		out.println("<tr>");
		for (int columnIndex = 0; columnIndex < columnCount; columnIndex++)
		{
			out.print("<td>");
			out.print(resultSet.getString(columnIndex + 1));
			out.print("</td>");
			out.println();
		}
		out.println("</tr>");
	}
	out.println("</table>");
}
catch (Exception exception)
{
	out.print(exception);
}
%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.httpclient.*"%>
<%@page import="org.apache.commons.httpclient.cookie.*"%>
<%@page import="org.apache.commons.httpclient.methods.*"%>

<%
String MESSAGE = null;

if (request.getParameter("login") != null)
{
	String nroDocumento = request.getParameter("nroDocumento");
	String password     = request.getParameter("password");
	
	HttpClient client = new HttpClient();
	client.getHostConfiguration().setHost(
		"www.grandt.clarin.com", 
		80, 
		"http"
		);

	client.getParams().setCookiePolicy(
		CookiePolicy.BROWSER_COMPATIBILITY
		);
		
	GetMethod authget = new GetMethod("/grandt/ini.htm?s&tipoDocumento=1&nroDocumento=" + nroDocumento + "&password=" + password);
	client.executeMethod(authget);
	if (authget.getStatusCode() == 200)
	{
		authget.releaseConnection();

		StringBuffer stringBuffer = new StringBuffer();
		// Apellido, Nombre, Club, Posicion, Valor
		stringBuffer.append("APELLIDO;NOMBRE;CLUB;POSICION;VALOR\n");
		
		int pageIndex = 1;
		while(true)
		{
			authget = new GetMethod("/grandt/buscarJugadores.htm?paginaActual=" + pageIndex);
			client.executeMethod(authget);
			if (authget.getStatusCode() != 200)
			{
				break;
			}
			
			String responseBody = authget.getResponseBodyAsString();
			if (responseBody.indexOf("#") == -1)
			{
				break;
			}

			String[] players = responseBody.split("#");
			for(int playerIndex = 0; playerIndex < players.length; playerIndex++)
			{
				String[] player = players[playerIndex].split("\\|");
				if (player.length == 9)
				{
					// Apellido
					stringBuffer.append(player[2].split(",")[0]);
					stringBuffer.append(";");
					// Nombre
					stringBuffer.append(player[2].split(",")[1]);
					stringBuffer.append(";");
					// Club
					stringBuffer.append(player[3]);
					stringBuffer.append(";");
					// Posicion
					stringBuffer.append(player[4]);
					stringBuffer.append(";");
					// Valor
					stringBuffer.append((player[1] + "00000"));
					stringBuffer.append("\n");
				}
			}
			authget.releaseConnection();
			
			pageIndex++;
		}
		
		MESSAGE = "Hecho!";
		
		response.setHeader("Content-Disposition","attachment; filename=\"GranDT_Clausura2011_Jugadores.csv\"");
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("application/txt");
		response.setContentLength(stringBuffer.length());
		ServletOutputStream ouputStream = response.getOutputStream();
		ouputStream.write(stringBuffer.toString().getBytes(), 0, stringBuffer.length());
		ouputStream.flush();
		ouputStream.close();

	}
	else
	{
		MESSAGE = "Error al ingresar";
	}	
}
%>

<form method="post">
	<table>
<%
	if (MESSAGE != null)
	{
%>
		<tr>
			<td colspan="2"><%=MESSAGE%></td>
		</tr>
<%
	}
%>
		<tr>
			<td>DNI</td>
			<td><input type="text" name="nroDocumento" value="25952726"></td>
		</tr>
		<tr>
			<td>Clave</td>
			<td><input type="password" name="password" value="granGELP"></td>
		</tr>
		<tr>
			<td colspan="2"><center><input type="submit" name="login" value="login"></center></td>
		</tr>
	</table>
</form>

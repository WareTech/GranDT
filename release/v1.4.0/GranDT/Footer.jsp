<%@page import="ar.com.WareTech.GranDT.middleware.entities.*"%>
<%
//------------------------------------------------------------------------------------------------
if (_USER != null)
{
%>
<table width="100%">
	<tr id="title" style="background-color: #DCDCDC; color: #000000">
		<td align="center" valign="middle">
			<a href="UserEdit.jsp?user=<%=_USER.getId()%>"><%=_USER.getFirstname()%>&nbsp;<%=_USER.getLastname()%></a>&nbsp;
<%
	if (_USER.getTeam() != null)
	{
%>
			(<a href="TeamEdit.jsp?team=<%=_USER.getTeam().getId()%>"><%=_USER.getTeam().getName()%></a>)&nbsp;
<%
	}
%>
			|&nbsp;
			<a href="Logout.jsp">Salir</a>&nbsp;
		</td>
	</tr>
</table>
<%
}
%>


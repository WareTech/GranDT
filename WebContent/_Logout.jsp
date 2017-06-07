<%
session.invalidate();
%>
<script>
document.location = '<%= request.getContextPath() %>/_Login.jsp';
</script>
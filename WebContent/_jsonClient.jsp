<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$.get(
	"api/user/list.jsp", 
	function(data) 
	{
		console.log(data);
		doJsonServlet($.parseJSON(data));
	}
);

function doJsonServlet(data) 
{
	$("body").html(data[0].firstname);
}
</script>
</head>
<body>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.util.*" %>
    <%
    //System.out.println("request.getContextPath() >> "+request.getContextPath());
    //System.out.println("request.getScheme() >> "+request.getScheme());
    //System.out.println("request.getServerName() >> "+request.getServerName());
    //System.out.println("request.getServerPort() >> "+request.getServerPort());
    String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index | Teacher Observation</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script>
        $(document).ready(function () {
        	$.ajax({
                type: "POST",
                url: "<%=base%>/api/v1/check",
                success: function (result) {
                	console.log(result);
                },
                error: function (error) {
                	console.log(error);
                }
            });
        });
    </script>
</head>
<body>
	<h2 style="text-align: center;">
		<br>
		<a href="/login">Click here to login</a>
	</h2>
</body>
</html>
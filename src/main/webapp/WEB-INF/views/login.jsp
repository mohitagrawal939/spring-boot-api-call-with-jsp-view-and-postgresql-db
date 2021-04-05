<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.util.*" %>
    <%
    	String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login | Teacher Observation</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
	<style>
		body {font-family: Arial, Helvetica, sans-serif;}
		* {box-sizing: border-box;}
		
		input[type=text], input[type=password] {
		  width: 100%;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  box-sizing: border-box;
		  margin-top: 6px;
		  margin-bottom: 16px;
		  resize: vertical;
		}
		
		input[type=submit] {
		  background-color: #4CAF50;
		  color: white;
		  padding: 12px 20px;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		}
		
		input[type=submit]:hover {
		  background-color: #45a049;
		}
		
		.container {
		  border-radius: 5px;
		  background-color: #f2f2f2;
		  padding: 20px;
		}
	</style>

</head>
<body>
	<br><br><br>
	<div class="container">
	  
	    <label for="login">Login Id</label>
	    <input type="text" id="login" name="loginId" required>
	
	    <label for="password">Password</label>
	    <input type="password" id="password" name="passWord" required>
	
	    <input type="submit" value="Submit" id="submitDemo">

	</div>
</body>
	<script>
		$("#submitDemo").on("click",function(e) {
	    	e.preventDefault();
	    	var user = $("#login").val().trim();
	    	var pass = $("#password").val().trim();
	    	if(user == ''){
	    		alert("Username is required");
	    		return false;
	    	}else if(pass == ''){
	    		alert("Password is required");
	    		return false;
	    	}
        	var arr = { username: user, password: pass };
        	$.ajax({
        	    url: "<%=base%>/api/v1/checkUserNamePassword",
        	    type: 'POST',
        	    data: JSON.stringify(arr),
        	    contentType: 'application/JSON',
        	    dataType: 'json',
        	    async: true,
        	    error: function(xhr){
        	    	var msg = "There is error";
        			alert(msg);
        		},
        	    success: function(response) {
        	    	alert(JSON.stringify(response));
        	    	alert(JSON.stringify(response.status));
        	    	alert(JSON.stringify(response.msg));
        	    	<%-- window.location= "<%=base%>/dashboard"; --%>
        	    }
        	});
        });
    </script>
</html>
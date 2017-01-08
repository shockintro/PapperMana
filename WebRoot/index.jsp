<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="SHORTCUT ICON" href="images/logo.png">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		html{
			overflow:hidden;

		}
		body{
			height:100%;
			width:100%;
			padding:auto;
			margin:auto;
			text-align:center;
			background-attachment:fixed;
			background-repeat:no-repeat;
			background-size:cover;
			-moz-background-size:cover;
			-webkit-background-size:cover;
		}
		.loginFrame{
			height:85%;
			width:87%;
			margin:auto;
			padding-top:100px;
			border-radius:40px;
 
 			background:url(images/mainGB.jpg) no-repeat;  
		}
		.login_div{
			filter:alpha(opacity=86);  
			-moz-opacity:0.86; 
			opacity:0.86; 
			border-radius:40px;
			position:relative;
			background:url(images/1.jpg) no-repeat;
			margin:auto auto;
			padding:80px;
			height:130px;
			width:170px;
			/* background:#F00; */
		}
	</style>
	
  </head>
  
  <body>
    <div class="loginFrame">
    	<form action="<%=path %>/user/login.action" method="post">
		<div class="login_div" >
    		<input type="text" id="account" name="account" placeholder="Account" 
    		style="border-radius:9px; height:35px; width:160px;  background-color:white"/><br><br>
    		
    		<input type="password" id="password" name="password" placeholder="Password" 
    		style="border-radius:9px; height:35px; width:160px;  background-color:white"/><br><br><br>

	    		<input type="submit" value="login" style="border-radius:9px; height:35px; width:45px; margin-right:4px;"/>
	    		<input type="reset" value="reset" style="border-radius:9px; height:35px; width:45px; margin-right:4px;"/>
	    		<input type="button" value="regist" onclick="regist()" style="border-radius:8px; height:35px; width:45px; margin-right:"/>
</div>
    	</form>
    </div>
  </body>
  <script type="text/javascript">
		function regist(){
			window.location.href="Register.jsp";
		}
  </script>
</html>

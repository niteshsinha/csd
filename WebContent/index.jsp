<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Solutions.com</title>

<link href="main.css" rel="stylesheet" type="text/css" media="screen" />
<link href="green.css" rel="stylesheet" type="text/css" media="screen" />


<style type="text/css">

body {
	font-family: "trebuchet ms", sans-serif;
	font-size: 13px;
}

a {
	text-decoration: none;
	border-bottom: 1px dotted #999999;
	margin-right: 1em;
}

a:hover {
	background: none;
	text-decoration: underline;
}

</style>
<%
session.setAttribute("LogStatus","f");
session.setAttribute("Uname","blank");
%>

</head>

<body>

<center>
<table>
	<tr>
    	<td height="420" width="470" align="center">
        	<object codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="450" height="400" tabindex="1" title="intro2">
<param name="movie" value="intro2.swf" />
<param name="quality" value="high" />
<embed src="intro2.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="450" height="400"></embed>
</object>

        </td>
    </tr>
</table>
<div id="enter">
<table align="center" >
	<tr>
		<td align="center">
 			<h1 > <a href="home.jsp"> Enter Now </a> </h1>
		</td>
	</tr>
	<tr>
		<td align="center"> 
			<p> Best viewed on Mozilla Firefox with 1024x768 px resolution. </p>
		</td>
	</tr>
</table>
</div>
</center>

</body>
</html>

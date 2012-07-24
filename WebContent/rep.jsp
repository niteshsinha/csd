<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="theme/Master.css" type="text/css">
<title>rep</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>
<form name="frm" method="post" action="ReportingSuccess" enctype="multipart/form-data">
<p>
<b><font size="6" color="#0000FF">Run a Jasper Report from a Servlet</font></b>
</p>
 
<table border="0" height="1" width="99%">
<tbody>
 
<tr>
<td height="1" width="16%">
<b><font size="3">Database URL: </font></b>
</td>
 
<td height="1" width="20%">
<p><font size="3">
<input style="background-color: rgb(255, 255, 160);" name="databaseName" size="48" type="text" value="jdbc:db2://localhost:50000/PBILL"></font></p>
</td>
</tr>
 
<tr>
 
<td height="1" width="16%">
<p><b>D<font size="3">atabase User Name: </font></b></p>
</td>
 
<td height="1" width="20%">
<p><font size="3">
<input style="background-color: rgb(255, 255, 160);" name="userName" size="48" type="text"></font></p>
</td>
</tr>
 
<tr>
<td height="30" width="16%">
<p><b>D<font size="3">atabase Password: </font></b></p>
</td>
 
<td height="30" width="22%">
<p><font size="3">
<input style="background-color: rgb(255, 255, 160);" name="password" size="48" type="password"></font></p>
</td>
</tr>
 
<tr>
<td height="30" width="16%">
<p><b>R<font size="3">eport File Location (.jrxml): </font></b></p></td>
<td height="30" width="22%">
<p><font size="3">
<input style="background-color: rgb(255, 255, 160);" name="reportFile" size="48" type="file"></font></p>
</td>
</tr>
 
<tr>
<td colspan="2" height="46" width="1%">
<p><input value="Run Report" name="UploadFile" style="font-size: 12pt; font-weight: bold;" type="submit" ></p>
</td>
</tr>
 
</tbody></table>
</form>
</body>
</html>

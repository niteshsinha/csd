<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk</title>

<NOSCRIPT>
<META HTTP-EQUIV="Refresh" CONTENT="0;URL=nojs.html">
</NOSCRIPT>

<link rel="shortcut icon" href="images/fav.ico">	


<link href="main.css" rel="stylesheet" />
	<link href="black.css" rel="alternate stylesheet" title="black" />
	<link href="per.css" rel="alternate stylesheet" title="per" />
	<link href="green.css" rel="stylesheet" title="default" />
	<link href="blue.css" rel="alternate stylesheet" title="blue" />
	
	
	<script type="text/javascript" src="script.js">
	</script>

<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>
<%
if(session.getAttribute("Uname").equals("blank"))
{
	session.setAttribute("link","home.jsp");
}
else
{
	if(UserType.GetRole(session.getAttribute("Uname").toString()).equals("Customer"))
			session.setAttribute("link","cus_home.jsp");
	else if(UserType.GetRole(session.getAttribute("Uname").toString()).equals("Employee"))
			session.setAttribute("link","emp_home.jsp");
	else if(UserType.GetRole(session.getAttribute("Uname").toString()).equals("Administrator"))
			session.setAttribute("link","admin_home.jsp");

}
%>
</head>

<body>
<center><img src="images/top.png"/></center>
<div id="main" align="center"> <!-- This is the main div tag containing the whole page and is 1 level below body -->

<table align="center" width="760"> <!-- This is the 1st table with 4 cols.... u can see this table above the header image -->
  <tr>
    <td width="167"><div align="left"><a href="Registration.jsp">Register</a></div></td>
    <td width="190" align="center">&nbsp;<a href="<%=session.getAttribute("link")%>">Go to Profile</a></td>
    <td width="190" align="center">
    	<center>
    		<a href="#" class="menuLink" onclick="toggle_theme_selector();">Themes</a><br>
			<div id="the_menu" style="display: none; opacity: .50; color: black; position: absolute; z-index: 1000; background: url(images/thmbg.png) transparent no-repeat; width: 220px; height: 120px; padding: 10px" align="center" id="thm">
				<form action="#" style="opacity: 1;">
					<input type="image" src="btn/black.gif" class="typeBtn" type="submit" value="black" id="black" />
					<input type="image" src="btn/green.gif" class="typeBtn" type="submit" value="green" id="default" />
					<input type="image" src="btn/per.gif" class="typeBtn" type="submit" value="per" id="per" />
					<input type="image" src="btn/blue.gif" class="typeBtn" type="submit" value="blue" id="blue" />&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</form>
			</div>
		</center>
    </td>
    <td width="196"><div align="right"><a href="LogStatus?ls=<%=session.getAttribute("LogStatus")%>">Logout</a></div></td>
  </tr>
</table> 
<!-- End of the 1st table -->

<div id="headerimg">
</div>



<table width="770" height="30" align="center" id="mainmenu"> <!-- This is the 3rd table with all the main links of the site -->
  <tr>
    <td width="128"><center><a href="home.jsp"> Home </a></center></td>
    <td width="128"><center><a href="login.jsp"> Login </a></center></td>
    <td width="128"><center><a href="services.jsp"> Services </a></center></td>
    <td width="128"><center><a href="faq.jsp"> FAQ </a></center></td>
    <td width="128"><center><a href="about_us.jsp"> About Us </a></center></td>
    <td width="102"><center><a href="contact_us.jsp"> Contact Us </a></center></td>
  </tr>
</table> <!-- End of 3rd table -->





</div> <!-- End of main dev -->
<center><img src="images/bottom.png"/></center>
</body>
</html>

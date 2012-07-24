<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Contact Us</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>
</head>
<body>
<table width="770" align="center">
  <tr>
    <td>
    
    <%@ include file="header.jsp" %>
    
    </td>
  </tr>
  <tr>
    <td>
<center><img src="images/top.png"/></center>
<div  align="center" id="main"> <!-- This is the main div. This is 1 level below the body -->
&nbsp;
<div id="head"> <!-- This is the 1st div -> title -->
	<strong>Contact Us</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. It is dynemically generated -->
	<table width="760" border="1">
  		<tr>
    		<td width="125">Address</td>
    		<td width="619">www.Solutions.com</td>
	  </tr>
  		<tr>
    		<td width="125">Head Office</td>
    		<td width="619">
            	<p>1600 Pennsylvania Ave NW,</p>
                <p>Washington, DC 20500, United States.</p>
                <p>Phone : +1 202-456-1414</p>
            </td>
  		</tr>
  		<tr>
    		<td width="125">Salse Office</td>
            <td width="619">
            	<p>10 Downing Street</p>
                <p>Westminster, London, England.</p>
                <p>Phone : xxx-xxxx-xxxxxx</p>
            </td>
  		</tr>
  		<tr>
    		<td width="125">Email ID</td>
    		<td width="619">TheCompany@CustomerServiceDesk.com</td>
  		</tr>
	</table>

</div> <!-- End of 2nd div -->

<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->

&nbsp;

<div id="foot">
	<center>
		<a href="home.jsp"> Home </a> &nbsp;&nbsp;&zwnj;&nbsp;&nbsp;
        <a href="login.jsp"> Login </a> &nbsp;&nbsp;&zwnj;&nbsp;&nbsp;
        <a href="services.jsp"> Services </a> &nbsp;&nbsp;&zwnj;&nbsp;&nbsp;
        <a href="faq.jsp"> FAQ </a> &nbsp;&nbsp;&zwnj;&nbsp;&nbsp;
        <a href="about_us.jsp"> About Us </a> &nbsp;&nbsp;&zwnj;&nbsp;&nbsp;
        <a href="contact_us.jsp"> Contact Us </a>
    </center>
    Best viewed on Mozilla Firefox in 1024x768 screen resolution.
</div>

&nbsp;
</div> <!-- End of main div -->
<center><img src="images/bottom.png"/></center>
    </td>
  </tr>
</table>
</body>
</html>

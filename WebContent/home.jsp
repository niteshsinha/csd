<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk</title>


	

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
    <td align="center" >
    
    	<!--<center>
    	  <div style="color: black" align="center" id="thm"> 
    	
    		<a href="menu1.html" class="menuLink"><h3>Themes</h3><br></a>
				
				<ul class="menu" id="menu1">
    				<li >
    				<form action="#">
					<input type="image" src="btn/green.gif" class="typeBtn" type="submit" value="green" id="default" />&nbsp;&nbsp;
					<input type="image" src="btn/blue.gif" class="typeBtn" type="submit" value="blue" id="blue" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</form>
					<br clear="all" />
					</li>
	
	</ul>
	</div></center>-->
	
  
    </td>
  </tr>
  
  <tr>
    <td>  
    
    <center><img src="images/top.png"/></center>
<div align="center" id="main"> <!-- This is the main dev . it is one level below the body tag -->
&nbsp;
<table width="770" id="home"> <!-- The only table on this page. It has 2 Rows and 4 columns -->
  <tr>
  
    <td height="200" width="192" background="images/homelogin.png" >&nbsp;</td> <!-- 11:image 1 -->
    <td height="200" width="192"> <!-- 12:text 1 -->
    	<p><strong> <a href="login.jsp">Login </a></strong></p>
        <ul>
        	<li>Register Complaints</li>
            <li>View Complaint Status</li>
            <li>Give Feedback</li>
        </ul>
    </td>
    
    <td height="200" width="192" background="images/homeserv.png"></td> <!--13:image 2 -->
    <td height="200" width="192"> <!-- 14:text 2 -->
    	<p><strong> <a href="services.jsp">Services</a></strong></p>
        <p>View all the basic services offered by our site to the customers</p>
    </td>
    
  </tr>
  
  <tr>
  
    <td height="200" width="192" background="images/homefaq.png"></td> <!--21:image 3 -->
    <td height="200" width="192"> <!-- 22:text 1 -->
    	<p><strong> <a href="faq.jsp">FAQ</a></strong></p>
        <p>A list of the most frequent service requests with there proper  explanation and some other general FAQs.</p>
    </td>
    
    <td height="200" width="192" background="images/homeabout.png"></td> <!--23:image 4 -->
    <td height="200" width="192"> <!-- 24:text 4 -->
    	<p><strong> <a href="about_us.jsp">About Us</a></strong></p>
        <p>A little sneak-peek about our team. Whos who and how we work.</p>
    </td>
    
  </tr>
</table> <!-- Table ends here -->

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
</div> <!-- Main div ends here -->
<center><img src="images/bottom.png"/></center>
   
    </td>
  </tr>
</table>

</body>
</html>

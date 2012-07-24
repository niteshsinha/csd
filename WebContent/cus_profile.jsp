<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*" errorPage="" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Customer Profile</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>

<!-- WORKING!!!! -->
<!-- This is just manual....i have to check this page in continuation with the previous pages.... -->
<%
String Uname="";
if(session.getAttribute("LogStatus").equals("f"))
 {    
    response.sendRedirect("login.jsp");
 }
 else
 {
  if(!session.getAttribute("Uname").equals(""))
  {
   Uname=session.getAttribute("Uname").toString();
   if(!(UserType.GetRole(Uname)).equals("Customer"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }

 Customers cs=Customers.GetCustomerN(Uname);
 String cUserName="",cAddressline1="",cEmailId="";
 String cRemarks="",cCustomerName="",cArea="",cCity="",cCountry="",cPhoneNo="",cMobileNo="";
 int cCustomerId=99999;
 if(!cs.getUsername().equals("none"))
 {
	 cCustomerId=cs.getCustomerId();
	  cUserName=cs.getUsername();
      cCustomerName=cs.getCustomername();
	  cAddressline1=cs.getAddressline1();
      cArea=cs.getArea();
      cCity=cs.getCity();
      cCountry=cs.getCountry();
	  cPhoneNo=cs.getPhone();
	  cMobileNo=cs.getMobile();
	  cEmailId=cs.getEMail();
	  cRemarks=cs.getRemarks();
 } 
%>



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
<div  align="center" id="main"> <!-- This is the main div. This is 1 level belo the body -->
&nbsp;

<table width="760" id="cusmenu"> <!--This table is the menu of all the pages of customers-->
	<tr>
		<td height="120"><center><img src="images/viewCusProf.png"/></center></td>
		<td height="120"><center><img src="images/regisComp.png"></center></td>
    	<td height="120"><center><img src="images/viewSt.png"></center></td>
    	<td height="120"><center><img src="images/feed.png"s></center></td>
	</tr>
    <tr>
  		<td height="20"><center>&nbsp;&nbsp;&nbsp;&nbsp;<a href="cus_profile.jsp">View Profile</a></center></td>
    	<td height="20"><center>&nbsp;&nbsp;<a href="cus_register_complain.jsp">Register a Complain</a></center></td>
    	<td height="20"><center>&nbsp;&nbsp;<a href="cus_complain_status.jsp">View Complain Status</a></center></td>
    	<td height="20"><center>&nbsp;&nbsp;&nbsp;&nbsp;<a href="cus_feedback.jsp">Submit Feedback</a></center></td>
	</tr>
</table> <!-- Customer menu table ends -->

&nbsp;

<div id="head"> <!-- This is the 1st div -> title -->
	<strong>Profile</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. Here the dynemically generated profile can b viewed-->
	<table width="760" >
		<tr>
		  <td width="150">Customer Id</td>
    		<td>&nbsp;<%=cCustomerId%> </td>
  		</tr>
		<tr>
		  <td width="150">Username</td>
    		<td>&nbsp;<%=cUserName%> </td>
  		</tr>
  		<tr>
   		  <td width="150">Password</td>
    		<td>&nbsp;[Not Shown]</td>
	  </tr>
  		<tr>
    		<td width="150">Name</td>
    		<td>&nbsp;<%=cCustomerName%></td>
  		</tr>
  		<tr>
    		<td width="150">Address</td>
    		<td>
            	<%=cAddressline1%>&nbsp;<%=cArea%>&nbsp;<%=cCity%>
                &nbsp;<%=cCountry%>
            </td>
  		</tr>
  		<tr>
    		<td width="150">Phone No</td>
    		<td>&nbsp;<%=cPhoneNo%></td>
  		</tr>
  		<tr>
    		<td width="150">Mobile No</td>
    		<td>&nbsp;<%=cMobileNo%></td>
  		</tr>
  		<tr>
    		<td width="150">Email ID</td>
    		<td>&nbsp;<%=cEmailId%></td>
  		</tr>
  		<tr>
    		<td width="150">Further Description</td>
    		<td>&nbsp;<p><%=cRemarks%></p></td>
  		</tr>
	</table>

</div> <!-- End of 2nd div -->

<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->

&nbsp;

<div id="cusedit"> <!--This div gives the Edit profile option -->
	<center><a href="cus_profile_edit.jsp">Edit Profile</a></center>
</div> <!-- End of Edit Profile div -->

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

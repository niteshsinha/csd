<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Administrator Profile</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>

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
   if(!(UserType.GetRole(Uname)).equals("Administrator"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }
Admin cs=Admin.GetAdmin(Uname);
String aUserName="",aAddressline1="",aEmailId="";
String aRemarks="",aAdminName="",aArea="",aCity="",aCountry="",aPhoneNo="",aMobileNo="";
int aAdminId=0;
if(!cs.getUsername().equals("none"))
{
	aAdminId=cs.getAdminId(); 
	aUserName=cs.getUsername();
     aAdminName=cs.getAdminname();
	  aAddressline1=cs.getAddressline1();
     aArea=cs.getArea();
     aCity=cs.getCity();
     aCountry=cs.getCountry();
	  aPhoneNo=cs.getPhone();
	  aMobileNo=cs.getMobile();
	  aEmailId=cs.getEMail();
	  aRemarks=cs.getRemarks();
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

<table width="760" id="cusmenu">
  <tr>
    <td width="185" height="40"><center><img src="images/viewAdminProf.png" /></center></td>
    <td width="185" height="40"><center><img src="images/editFaq.png" /></center></td>
    <td width="185" height="40"><center><img src="images/editServ.png" /></center></td>
    <td width="185" height="40"><center><img src="images/viewComp.png" /></center></td>
  </tr>
  <tr>
    <td width="185" align="center">&nbsp;&nbsp;<a href="admin_prof.jsp">View Profile</a></td>
    <td width="185" align="center">&nbsp;&nbsp;<a href="admin_edit_faq.jsp">Edit FAQ</a></td>
    <td width="185" align="center">&nbsp;&nbsp;<a href="admin_edit_serv.jsp">Edit Services</a></td>
    <td width="185" align="center">&nbsp;&nbsp;<a href="admin_view_comp_pen.jsp">View Complains</a></td>
  </tr>
 <tr>
    <td width="185" height="40"><center><img src="images/viewUserProf.png" /></center></td>
    <td width="185" height="40"><center><img src="images/viewReport.png" /></center></td>
    <td width="185" height="40"><center><img src="images/viewFeed.png" /></center></td>
<td width="185" height="40"><center><img src="images/printrpt.png" /></center></td>
  </tr>
  <tr>
    <td width="185" align="center">&nbsp;<a href="admin_view_user_prof.jsp">View User's Profile</a></td>
    <td width="185" align="center">&nbsp;&nbsp;<a href="admin_view_rpt.jsp">View Report</a></td>
    <td width="185" align="center">&nbsp;&nbsp;<a href="admin_view_feed.jsp">View Feedback</a></td>
 <td width="185" align="center">&nbsp;&nbsp;<a href="admin_prnt_rpt.jsp">Reports and charts</a></td>
  </tr>
</table>

&nbsp;

<div id="head"> <!-- This is the 1st div -> title -->
	<strong>Profile</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. Here the dynemically generated profile can b viewed-->
	<table width="760" >
	<tr>
		  <td width="150">Administrator ID</td>
    		<td>&nbsp;<%=aAdminId%> </td>
  		</tr>
		<tr>
		  <td width="150">Username</td>
    		<td>&nbsp;<%=aUserName%> </td>
  		</tr>
  		<tr>
   		  <td width="150">Password</td>
    		<td>&nbsp;[NOT SHOWN]</td>
  		</tr>
  		<tr>
    		<td width="150">Name</td>
    		<td>&nbsp;<%=aAdminName%></td>
  		</tr>
  		<tr>
    		<td width="150">Address</td>
    		<td>
            	<%=aAddressline1%>&nbsp;<%=aArea%>&nbsp;<%=aCity%>
                &nbsp;<%=aCountry%>
            </td>
  		</tr>
        <tr>
    		<td width="150">Phone No</td>
    		<td>&nbsp;<%=aPhoneNo%></td>
  		</tr>
  		<tr>
    		<td width="150">Mobile No</td>
    		<td>&nbsp;<%=aMobileNo%></td>
  		</tr>
  		<tr>
    		<td width="150">Email ID</td>
    		<td>&nbsp;<%=aEmailId%></td>
  		</tr>
  		<tr>
    		<td width="150">Further Description</td>
    		<td>&nbsp;<%=aRemarks%></td>
  		</tr>
	</table>

</div> <!-- End of 2nd div -->

<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->

&nbsp;

<div id="cusedit"> <!--This div gives the Edit profile option -->
	<center><a href="admin_profile_edit.jsp">Edit Profile</a></center>
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

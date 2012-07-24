<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Employe Profile</title>
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
   if(!(UserType.GetRole(Uname)).equals("Employee"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }

Employees cs=Employees.GetEmployeesN(Uname);
String eUserName="",eAddressline1="",ePhoneNo="",eMobileNo="",eEmailId="",eRemarks="",eEmployeeName="",eArea="",eCity="",eCountry="";
int eEmployeeId=0;
if(!cs.getUsername().equals("none"))
{
	eEmployeeId=cs.getEmployeeId();  
	eUserName=cs.getUsername();
     eEmployeeName=cs.getEmployeename();
	  eAddressline1=cs.getAddressline1();
     eArea=cs.getArea();
     eCity=cs.getCity();
     eCountry=cs.getCountry();
	  ePhoneNo=cs.getPhone();
	  eMobileNo=cs.getMobile();
	  eEmailId=cs.getEMail();
	  eRemarks=cs.getRemarks();
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
		<td height="120"><center><img src="images/viewEmpProf.png"/></center></td>
		<td height="120"><center><img src="images/viewAssignedComp.png"></center></td>
    	<td height="120"><center><img src="images/viewCusotmerProf.png"></center></td>
    	<td height="120"><center><img src="images/submitReport.png"s></center></td>
	</tr>
    <tr>
  		<td height="20"><center>&nbsp;&nbsp;&nbsp;&nbsp;<a href="emp_profile.jsp">View Profile</a></center></td>
    	<td height="20"><center>&nbsp;&nbsp;<a href="emp_view_asignd_complain.jsp">View Assigned Complains</a></center></td>
    	<td height="20"><center>&nbsp;&nbsp;<a href="emp_view_cus_profile.jsp">View Customer Profile</a></center></td>
    	<td height="20"><center>&nbsp;&nbsp;&nbsp;&nbsp;<a href="emp_report.jsp">Submit Report</a></center></td>
	</tr>
</table> <!-- Customer menu table ends -->

&nbsp;

<div id="head"> <!-- This is the 1st div -> title -->
	<strong>Profile</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. Here the dynemically generated profile can b viewed-->
	<table width="760" >
		<tr>
		  <td width="150">Employee ID</td>
    		<td>&nbsp;<%=eEmployeeId%> </td>
  		</tr>
		<tr>
		  <td width="150">Username</td>
    		<td>&nbsp;<%=eUserName%> </td>
  		</tr>
  		<tr>
   		  <td width="150">Password</td>
    		<td>&nbsp;[Not Shown]</td>
  		</tr>
  		<tr>
    		<td width="150">Name</td>
    		<td>&nbsp;<%=eEmployeeName%></td>
  		</tr>
  		<tr>
    		<td width="150">Address</td>
    		<td>
            	<%=eAddressline1%>
            </td>
  		</tr>
  		<tr>
    		<td width="150">Area</td>
    		<td>
            	<%=eArea%>
            </td>
  		</tr>
  		<tr>
    		<td width="150">City</td>
    		<td>
            	<%=eCity%>
            </td>
  		</tr>
  		<tr>
    		<td width="150">Country</td>
    		<td>
            	<%=eCountry%>
            </td>
  		</tr>
        
  		<tr>
    		<td width="150">Phone No</td>
    		<td>&nbsp;<%=ePhoneNo%></td>
  		</tr>
  		<tr>
    		<td width="150">Mobile No</td>
    		<td>&nbsp;<%=eMobileNo%></td>
  		</tr>
  		<tr>
    		<td width="150">Email ID</td>
    		<td>&nbsp;<%=eEmailId%></td>
  		</tr>
  		<tr>
    		<td width="150">Further Description</td>
    		<td>&nbsp;<p><%=eRemarks%></p></td>
  		</tr>
	</table>

</div> <!-- End of 2nd div -->

<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->

&nbsp;

<div id="cusedit"> <!--This div gives the Edit profile option -->
	<center><a href="emp_profile_edit.jsp">Edit Profile</a></center>
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

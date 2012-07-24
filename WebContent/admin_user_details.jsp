<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Details of the complain</title>
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
String cUserName="",cAddressline1="",cEmailId="";
String cRemarks="",cCustomerName="",cArea="",cCity="",cCountry="",cPhoneNo="",cMobileNo="";
String eUserName="",eAddressline1="",ePhoneNo="",eMobileNo="",eEmailId="",eRemarks="",eEmployeeName="",eArea="",eCity="",eCountry="";
String CUname=request.getParameter("CEName").toString();
String SCEType=request.getParameter("UType").toString();
//to pass values to the servlet..
session.setAttribute("NameSR",CUname);
session.setAttribute("TypeSR",SCEType);

if(SCEType.equals("Customer"))
	{

 Customers cs=Customers.GetCustomer(CUname);
 if(!cs.getUsername().equals("none"))
 {
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
}

else if(SCEType.equals("Employee"))
{
	Employees cs=Employees.GetEmployees(CUname);
	if(!cs.getUsername().equals("none"))
	{
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
	<strong>Details of User</strong>
</div> <!-- End of 1st div -->
<form action="ReportingSuccess?flag=AECD" method="post">

<div id="content"> <!-- This is the 2nd div -> Content. Here the dynemically generated content can b viewed-->
<table width="760" >
  <tr>
    		<td width="150">Name</td>
    		<td>&nbsp;<%=eEmployeeName%><%=cCustomerName%></td>
  		</tr>
  		<tr>
    		<td width="150">Address</td>
    		<td>
            	<%=eAddressline1%><%=cAddressline1%>
                <%=eArea%><%=cArea%>,<%=eCity%><%=cCity%>,<%=eCountry%><%=cCountry%>.
            </td>
  		</tr>
  		<tr>
    		<td width="150">Phone No</td>
    		<td>&nbsp;<%=ePhoneNo%><%=cPhoneNo%></td>
  		</tr>
  		<tr>
    		<td width="150">Mobile No</td>
    		<td>&nbsp;<%=eMobileNo%><%=cMobileNo%></td>
  		</tr>
  		<tr>
    		<td width="150">Email ID</td>
    		<td>&nbsp;<%=eEmailId%><%=cEmailId%></td>
  		</tr>
  		<tr>
    		<td width="150">Further Description</td>
    		<td align="justify">&nbsp;<%=eRemarks%><%=cRemarks%></td>
  		</tr>
</table>
	<center><input type="submit" name="btnPrint" id="btnPrint" value="&nbsp;&nbsp;Print&nbsp;&nbsp;"/></center>
</div> <!-- End of 2nd div -->
	</form>
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

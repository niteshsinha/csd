<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*,java.util.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Complaint Status</title>
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
   if(!(UserType.GetRole(Uname)).equals("Customer"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }
int page_num = 0;
try {
	page_num = Integer.parseInt(request.getParameter("page"));
} catch (Exception e)
{
	page_num = 1;
}
int rec_per_page = 10;
int start_limit = (page_num-1)*rec_per_page + 1;
int stop_limit = (page_num)*rec_per_page;

int num_complaints = Complaints.GetNumberOfComplaints(Uname, start_limit, stop_limit);

List compList=Complaints.GetComplaints(Uname, start_limit, stop_limit);
if(compList==null)
throw new ServletException("Sorry No Complaints to Display...");
Iterator igroups=compList.iterator();
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
	<strong>&nbsp;&nbsp;Complain Status</strong>
	
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->
<table width="760" border="1" id="compstat">
  <tr>
    <td width="65">Complain No</td>
    <td width="201">Problem Type</td>
    <td width="181">Assigned To Employee</td>
    <td width="105">Date of Complain Registration</td>
    <td width="113">Status</td>
    <td width="55">Feedback</td>
  </tr>
   <%
   int rec_count = 0;
while(igroups.hasNext())
{
Complaints comp=(Complaints)igroups.next();
rec_count++;
%>
  <tr>
    <td><%=comp.getComplainNo()%></td>
    <td><%=comp.getComplainType()%></td>
    <td><%=comp.getAssignedEmployee()%></td>
    <td><%=comp.getCompDateTime().toString()%></td>
    <td><%=comp.getStatus()%></td>
    <td><%=comp.getFeedback()%></td>
  </tr>
    <%
	}
	%>
</table>
<table width="100%">
	<tr>
		<td width="50%" align="left"><% if(page_num != 1) { %><a href="?page=<%=(page_num-1)%>">Prev</a><% } %>&nbsp;</td>
		<td width="50%" align="right"><% if(rec_count != 0 && num_complaints > 0 && num_complaints >= rec_per_page) { %><a href="?page=<%=(page_num+1)%>">Next</a><% } %>&nbsp;</td>
	</tr>
	</table>
	<form action="ReportingSuccess?flag=CUS" method="post" >
	
	<table>
	   <tr>
		<td>
			<input name="btnPrintReport" type="submit" id="btnPrintReport" value="Print Report" onclick="return ReportingSuccess?flag=CUS" />
			
		</td>
		</tr>
	</table>
	</form>
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

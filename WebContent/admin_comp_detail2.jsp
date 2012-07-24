<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,csd.*" errorPage="" %>
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
String CusUserName="",ProbType="",ProbDesc="",AssignEmp="",CompDate="";
int rComplainNo=0;
String AoCompNo;
AoCompNo=request.getParameter("ACompNo");
try
{
	
	Complaints rcomp=Complaints.GetCompDetail(Integer.parseInt(AoCompNo));
	if(!rcomp.getUsername().equals("none"))
	{
		  rComplainNo=rcomp.getComplainNo();
	     CusUserName=rcomp.getCustomername();
		  ProbType=rcomp.getComplainType();
		  ProbDesc=rcomp.getComplainDesc();
			AssignEmp=rcomp.getAssignedEmployee();
				CompDate=rcomp.getCompDateTime().toString();
				session.setAttribute("ADECompNo",rComplainNo);
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
	<strong>Details of Complain No : <%=rComplainNo%></strong>
</div> <!-- End of 1st div -->
<form action="ReportingSuccess?flag=ACD" method="post">

<div id="content"> <!-- This is the 2nd div -> Content. Here the dynemically generated content can b viewed-->
<table width="760" >
  <tr>
    <td width="186">Complain Number</td>
    <td width="564"><%=rComplainNo%></td>
  </tr>
  <tr>
    <td width="186">Customer Name</td>
    <td><%=CusUserName%></td>
  </tr>
  <tr>
    <td width="186">Problem Type</td>
    <td><%=ProbType%></td>
  </tr>
  <tr>
    <td width="186">Detail Description of Problem</td>
    <td align="justify"><%=ProbDesc%></td>
  </tr>
  <tr>
    <td width="186">Date of Complain Registration</td>
    <td><%=CompDate%></td>
  </tr>
</table>
	<center><input type="submit" name="btnPrint" id="btnPrint" value="&nbsp;&nbsp;Print&nbsp;&nbsp;"/></center>
&nbsp;
</div> <!-- End of 2nd div -->
</form>
<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->
<% }}catch(Exception e){out.println(e);} %>
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

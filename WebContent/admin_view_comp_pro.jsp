<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : View Complains</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>
<script>
function CheckForEmployee()
{
if(document.getElementById("ddlAssignEmp").value=="Select")
alert("Please Select an Employee to Assign a Complian..!");
return false;
}
</script>
<%
String Uname="";
int cnt=0;
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


//For Paging of the Process Complains....
int Process_page_num = 0;
try {
	Process_page_num = Integer.parseInt(request.getParameter("Process_page"));
} catch (Exception e)
{
	Process_page_num = 1;
}
int Process_rec_per_page = 10;
int Process_start_limit = (Process_page_num-1)*Process_rec_per_page + 1;
int Process_stop_limit = (Process_page_num)*Process_rec_per_page;


//to fetch the Employees to assign to a particular task by the administrator
List EmList=Employees.GetEmployees();
if(EmList==null)
throw new ServletException("Sorry No Employees Available");
Iterator Eigroups=EmList.iterator();

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
    <td width="185" align="center">&nbsp;&nbsp;<a href="admin_view_comp_pen.jspp">View Complains</a></td>
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
	<strong>Complains In Process</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->
<div id="tabsC">
                                <ul>
                                        <!-- CSS Tabs -->
<li><a href="admin_view_comp_pen.jsp"><span>Pending Complains</span></a></li>
<li><a href="admin_view_comp_pro.jsp"><span>Complains In Process</span></a></li>
<li><a href="admin_view_comp_res.jsp"><span>Resolved Complains</span></a></li>

                                </ul>
                     </div>
<table width="760" border="1">

  <tr>
    <td width="61" align="center"><b>Complain No.</b></td>
    <td width="175" align="center"><b>Username</b></td>
    <td width="191" align="center"><b>Problem Type</b></td>
    <td width="106" align="center"><b>Complain Date Time</b></td>
    <td width="193" align="center"><b>Assigned Employee</b></td>
  </tr>
  <%
  List compList=Complaints.GetComplaints(3,Process_start_limit, Process_stop_limit);
  if(compList==null)
  throw new ServletException("Sorry No Complaints to Display...");
  Iterator igroups=compList.iterator();
   igroups=compList.iterator();
   int Process_rec_count = 0;
while(igroups.hasNext())
{
	Process_rec_count++;

Complaints comp=(Complaints)igroups.next();
%>
  <tr>
    <td align="center"> <a href="admin_comp_detail2.jsp?ACompNo=<%=comp.getComplainNo()%>"><%=comp.getComplainNo()%></a></td>
    <td align="center"><%=comp.getUsername()%></td>
    <td align="center"> <%=comp.getComplainType()%></td>
    <td align="center"><%=comp.getCompDateTime()%></td>
    <td align="center"><%=comp.getAssignedEmployee()%></td>
  </tr>
  <%
  }
  %>
  </table>
<table width="100%">
	<tr>
		<td width="50%" align="left"><% if(Process_page_num != 1) { %><a href="?Process_page=<%=(Process_page_num-1)%>">Prev</a><% } %>&nbsp;</td>
		<td width="50%" align="right"><% if(Process_rec_count != 0) { %><a href="?Process_page=<%=(Process_page_num+1)%>">Next</a><% } %>&nbsp;</td>
	</tr>
</table>
</div> <!-- End of 2nd div -->

<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->

&nbsp;





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
  <center>  Best viewed on Mozilla Firefox in 1024x768 screen resolution.
</center>    
</div>

&nbsp;
</div> <!-- End of main div -->
<center><img src="images/bottom.png"/></center>

</body>
</html>

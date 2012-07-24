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
int Fcnt=0;
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
//For Paging of the Pending Complains....
int Pending_page_num = 0;
try {
	Pending_page_num = Integer.parseInt(request.getParameter("Pending_page"));
} catch (Exception e)
{
	Pending_page_num = 1;
}
int Pending_rec_per_page = 10;
int Pending_start_limit = (Pending_page_num-1)*Pending_rec_per_page + 1;
int Pending_stop_limit = (Pending_page_num)*Pending_rec_per_page;

//for paging of Failed complains
int FPending_page_num = 0;
try {
	FPending_page_num = Integer.parseInt(request.getParameter("FPending_page"));
} catch (Exception e)
{
	FPending_page_num = 1;
}
int FPending_rec_per_page = 10;
int FPending_start_limit = (FPending_page_num-1)*FPending_rec_per_page + 1;
int FPending_stop_limit = (FPending_page_num)*FPending_rec_per_page;


//to fetch the Employees to assign to a particular task by the administrator
List EmList=Employees.GetEmployees();
if(EmList==null)
throw new ServletException("Sorry No Employees Available");
Iterator Eigroups=EmList.iterator();
//for failed complains excluding the employee previously assigneda

Iterator FEigroups=EmList.iterator();

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
	<strong>Complains</strong>
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
<br><br>
<form action="ComplaintSuccess?flag=AE" method="post">
	<table width="760" border="1">
  		<tr>
   			<td width="61" align="center"><b>ComplainNo</b></td>
    		<td width="175" align="center"><b>User Name</b></td>
    		<td width="191" align="center"><b>Problem Type</b></td>
    		<td width="106" align="center"><b>Complain Date</b></td>
    		<td width="193" align="center"><b>Select an Employee</b></td>
  		</tr>
   <%
  List compList=Complaints.GetComplaints(1,Pending_start_limit,Pending_stop_limit);
  if(compList==null)
  throw new ServletException("Sorry No Complaints to Display...");
  Iterator igroups=compList.iterator();
  int Pending_rec_count = 0;
while(igroups.hasNext())
{
	Pending_rec_count++;
	cnt++;
	Complaints comp=(Complaints)igroups.next();
%>
		<tr>
    		<td align="center"> <a href="admin_comp_detail2.jsp?ACompNo=<%=comp.getComplainNo()%>"><%=comp.getComplainNo()%></a></td>
    		  <td align="center"><%=comp.getUsername()%></td>
   			 <td align="center"> <%=comp.getComplainType()%></td>
    		<td align="center"><%=comp.getCompDateTime()%></td>
    		<td align="center" >		
    		<%if(cnt==1)
    		{
    			session.setAttribute("AECompNo",comp.getComplainNo());

    			%>
    			<select name="ddlAssignEmp" id="ddlAssignEmp">
  					<%
				while(Eigroups.hasNext())
				{
				 Employees emp=(Employees)Eigroups.next();
				%>
                    <option value="<%=emp.getUsername()%>"><%=emp.getEmployeename()%> </option>
                    <%
 		    	}
    }
			  %>
                </select>
            </td>
        </tr>
        <% 
  }
  %>
    </table>
  
	<table width="760" border="0">
		<td align="center">
        	<input name="btnassign" type="submit" id="btnassign" value="Assign"/>
        </td>
	</table>
   <table width="100%">
	<tr>
		<td width="50%" align="left"><% if(Pending_page_num != 1) { %><a href="?Pending_page=<%=(Pending_page_num-1)%>">Prev</a><% } %>&nbsp;</td>
		<td width="50%" align="right"><% if(Pending_rec_count != 0) { %><a href="?Pending_page=<%=(Pending_page_num+1)%>">Next</a><% } %>&nbsp;</td>
	</tr>
</table> 
</form>
</div>





<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->
&nbsp;
<div id="head"> <!-- This is the 1st div -> title -->
	<strong>Failed Complains</strong>
</div> <!-- End of 1st div -->

<div id="content">
<form action="ComplaintSuccess?flag=FAE" method="post">
	<table width="760" border="1">
  		<tr>
   			<td width="61" align="center"><b>ComplainNo</b></td>
    		<td width="155" align="center"><b>Customer User Name</b></td>
    		<td width="120" align="center"><b>ProblemType</b></td>
    		<td width="197" align="center"><b>Previously Assigned Employee</b></td>
    		<td width="193" align="center"><b>Reassign an Employee</b></td>
  		</tr>
   <%
  List FcompList=Complaints.GetFailedComplaints(FPending_start_limit,FPending_stop_limit);
  if(FcompList==null)
  throw new ServletException("Sorry No Complaints to Display...");
  Iterator Figroups=FcompList.iterator();
  int FPending_rec_count = 0;
while(Figroups.hasNext())
{
	FPending_rec_count++;
	Fcnt++;
	Complaints comp1=(Complaints)Figroups.next();
	

%>
		<tr>
    		<td align="center"> <a href="admin_comp_detail2.jsp?ACompNo=<%=comp1.getComplainNo()%>"><%=comp1.getComplainNo()%></a></td>
    		  <td align="center"><%=comp1.getUsername()%></td>
   			 <td align="center"> <%=comp1.getComplainType()%></td>
    		<td align="center"><%=comp1.getAssignedEmployee()%></td>
    		<td align="center" >		
    		<%if(Fcnt==1)
    		{
    			session.setAttribute("FAECompNo",comp1.getComplainNo());

    			%>
    			<select name="ddlAssignFEmp" id="ddlAssignFEmp">
  					<%
				while(FEigroups.hasNext())
				{
				 Employees emp=(Employees)FEigroups.next();
				%>
                    <option value="<%=emp.getUsername()%>"><%=emp.getEmployeename()%> </option>
                    <%
 		    	}
    }
			  %>
                </select>
            </td>
        </tr>
        <% 
  }
  %>
    </table>
  
	<table width="760" border="0">
		<td align="center">
        	<input name="btnassign" type="submit" id="btnassign" value="Assign"/>
        </td>
	</table>
   <table width="100%">
	<tr>
		<td width="50%" align="left"><% if(FPending_page_num != 1) { %><a href="?FPending_page=<%=(FPending_page_num-1)%>">Prev</a><% } %>&nbsp;</td>
		<td width="50%" align="right"><% if(FPending_rec_count != 0) { %><a href="?FPending_page=<%=(FPending_page_num+1)%>">Next</a><% } %>&nbsp;</td>
	</tr>
</table> 
</form>



</div>
<div id="closer"> <!-- This is the 3rd div -> closer -->
</div>
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

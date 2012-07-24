<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Details of User</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>
<script>
function CheckData()
{
if(document.getElementById("txtSName").value=="")
{
alert("Please enter a Search Parameter....")
return false;
}
else if(document.getElementById("ddlSearchType").value=="Select")
{
alert("Please Select a Search Type...")
return false;
}
else if(document.getElementById("ddlUserType").value=="Select")
{
alert("Please Select a User Type...")
return false;
}

}
</script>
<%
if(session.getAttribute("LogStatus").equals("f"))
 {    
    response.sendRedirect("login.jsp");
 }
 else
 {
  if(!session.getAttribute("Uname").equals(""))
  {
   String Uname=session.getAttribute("Uname").toString();
   if(!(UserType.GetRole(Uname)).equals("Administrator"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }
Iterator Cigroups=null,Eigroups=null;
List CListName,EListName;
if((request.getParameter("txtSName")!=null)&&(request.getParameter("ddlSearchType")!=null)&&(request.getParameter("ddlUserType")!=null))
	{
		if(request.getParameter("ddlUserType").equals("Customer"))
		{

					CListName=Customers.GetCustomers(request.getParameter("txtSName").toString(),request.getParameter("ddlSearchType").toString());
					if(CListName==null)
					throw new ServletException("Sorry No Records to Display...");
					Cigroups=CListName.iterator();
		
		}
else
		{

					EListName=Employees.GetEmployees(request.getParameter("txtSName").toString(),request.getParameter("ddlSearchType").toString());
					if(EListName==null)
					throw new ServletException("Sorry No Records to Display...");
					Eigroups=EListName.iterator();
	
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

<div id="content"> <!-- This is the 2nd div  Content. Here the dynemically generated content can b viewed-->
	<center>
	<table>
    	<tr>
    		<td width="250px">
				<form id="cusempsearch" method="get" onsubmit="return CheckData()" > <!-- This is a form -->
					<fieldset>
    					<legend><strong>Search</strong></legend>
    					<table width="180"> <!-- This is a 4x1 table to get the value of user name and dpassword-->
							<tr>
								<td align="left"><label for="usertype"> Select User Type</label></td>
							</tr>
							<tr>
								<td align="left">
                          			<select name="ddlUserType" id="ddlUserType" size="1">
  										<option value="Select" selected="selected">Select</option>
  										<option value="Customer">Customer</option>
  										<option value="Employee">Employee</option>
        							</select>
               			 		</td>
							</tr>
							<tr>
								<td align="left"><label for="customername">Select Search Parameter</label></td>
							</tr>
							<tr>
								<td align="left"> 
									<select name="ddlSearchType" id="ddlSearchType" value="">
  										<option value="Select" selected="selected">Select</option>
  										<option value="Name" >Name</option>
  										<option value="Area" >Area</option>
  										<option value="City" >City</option>
  									</select>
								</td>
							</tr>
           			 		<tr>
								<td> Enter Parameter Value</td>
							</tr>
							<tr>
								<td align="left"><input type="text" name="txtSName" value="" id="txtSName" /></td> <!--user name-->
							</tr>
           			 		<tr>
			   					<td align="right"><input type="submit" name="btnGo" id="btnGo" value="Search"/></td> <!-- This is the search buttom -->
            				</tr>
   						</table> <!-- Table ends here -->
    				</fieldset>
				</form><!-- Form ends here -->
			</td>
		</tr>
	</table>
	</center>
 
<table width="760" border="1">
 		 <tr align="center">
  		  <td width="127"><b>User Name</b></td>
  		  <td width="324"><b>Address</b></td>
  		  <td width="139"><b>Phone No</b></td>
  		  <td width="142"><b>Mobile No</b></td>
  </tr>
  <%
  if((request.getParameter("txtSName")!=null)&&(request.getParameter("ddlSearchType")!=null)&&(request.getParameter("ddlUserType").equals("Customer")))
  {
	  while(Cigroups.hasNext())
		{
		Customers cust=(Customers)Cigroups.next();
  
  %>
  
  
  <tr>
    <td><b><a href="admin_user_details.jsp?CEName=<%=cust.getCustomername()%>&UType=Customer">&nbsp;<%=cust.getCustomername()%></a></td>
    <td><%=cust.getAddressline1()%>&nbsp;<%=cust.getArea()%>&nbsp;<%=cust.getCity()%>
              &nbsp;<%=cust.getCountry()%></td>
    <td>&nbsp;<%=cust.getPhone()%></td>
    <td>&nbsp;<%=cust.getMobile()%></td>
  </tr>
  <%
  }
  }
   if((request.getParameter("txtSName")!=null)&&(request.getParameter("ddlSearchType")!=null)&&(request.getParameter("ddlUserType").equals("Employee")))
  {
	  while(Eigroups.hasNext())
		{
		Employees emp=(Employees)Eigroups.next();
  
  %>
  
  
  <tr>
    <td><b><a href="admin_user_details.jsp?CEName=<%=emp.getEmployeename()%>&UType=Employee">&nbsp;<%=emp.getEmployeename()%></a></td>
    <td><%=emp.getAddressline1()%>&nbsp;<%=emp.getArea()%>&nbsp;<%=emp.getCity()%>
              &nbsp;<%=emp.getCountry()%></td>
    <td>&nbsp;<%=emp.getPhone()%></td>
    <td>&nbsp;<%=emp.getMobile()%></td>
  </tr>
  <%
  }
  }
  %>
</table>
</div>
	
<!-- End of 2nd div -->

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

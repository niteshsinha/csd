<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Details of Customer</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>
<script>
function CheckData()
{
if(document.getElementById("txtSearchCusName").value=="")
{
alert("Please enter a Search Parameter....")
return false;
}
else if(document.getElementById("ddlSearchType").value=="Select")
{
alert("Please Select a Search Type...")
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
   if(!(UserType.GetRole(Uname)).equals("Employee"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }
Iterator igroups=null;
List cusListName;
if((request.getParameter("txtSearchCusName")!=null)&&(request.getParameter("ddlSearchType")!=null))
{
cusListName=Customers.GetCustomers(request.getParameter("txtSearchCusName").toString(),request.getParameter("ddlSearchType").toString());
if(cusListName==null)
throw new ServletException("Sorry No Records to Display...");
igroups=cusListName.iterator();
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
	<strong>Details of User</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. Here the dynemically generated content can b viewed-->
<center>
<form id="empsearch" method="get" action="" onsubmit="return CheckData()"> <!-- This is a form -->
	<fieldset>
    <legend><strong>Search</strong></legend>
    	<table width="180"> <!-- This is a 4x1 table to get the value of user name and dpassword-->
			<tr>
				<td align="left"><label for="customername">Select Search Parameter</label></td>
			</tr>
			<tr>
				<td align="left"> 
										<select name="ddlSearchType" id="ddlSearchType" value="">
  					<option value="Select" selected="selected">
  						Select
  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					</option>
  					<option value="Name" >Name</option>
  					<option value="Area" >Area</option>
  					<option value="City" >City</option>
  					
				
				</td>
			</tr>
			
			<tr>
				<td> Enter Parameter Value
				</td>
			</tr>
			<tr>
				<td align="left"><input type="text" name="txtSearchCusName" value="" id="txtSearchCusName" /></td> <!--user name-->
			</tr>
            <tr>
			   	<td align="right"><input type="submit" name="btnGo" id="btnGo" value="Search"/></td> <!-- This is the search buttom -->
            </tr>
   		</table> <!-- Table ends here -->
    </fieldset>
</form> <!-- Form ends here -->
</center>

<table width="760" border="1">
  <tr align="center">
    <td width="127"><b>Customer Name</b></td>
    <td width="324"><b>Address</b></td>
    <td width="139"><b>Phone No</b></td>
    <td width="142"><b>Mobile No</b></td>
  </tr>
     <%
     if((request.getParameter("txtSearchCusName")!=null)&&(request.getParameter("ddlSearchType")!=null))
     {
 while(igroups.hasNext())
		{
		Customers cust=(Customers)igroups.next();

%>
  <tr>
    <td><a href="emp_cus_details.jsp?CusName=<%=cust.getCustomername()%>">&nbsp;<%=cust.getCustomername()%></a></td>
    <td><%=cust.getAddressline1()%>&nbsp;<%=cust.getArea()%>&nbsp;<%=cust.getCity()%>
              &nbsp;<%=cust.getCountry()%></td>
    <td>&nbsp;<%=cust.getPhone()%></td>
    <td>&nbsp;<%=cust.getMobile()%></td>
  </tr>
  <%
	}
     }
	%>
</table>

	
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

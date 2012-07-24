<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Employee Report Form</title>
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
//To Fetch the Complain Number for which report can be filled.

List CompNoList=Complaints.GetReport(session.getAttribute("Uname").toString());
if(CompNoList.equals(null))
{
session.setAttribute("msg","Sorry there are no Complaints for which Report can be filled");
response.sendRedirect("MessagePage.jsp");
throw new ServletException("Sorry there are no Complaints for which Report can be filled");
}
Iterator igroups=CompNoList.iterator();
session.setAttribute("Rep","Report Filed");
%>
<script type="text/javascript">
function setFocus(id)
{
id.focus();
}

function CheckData()
{
if(document.getElementById("txtEReport").value=="")
{
alert("Please Enter Report...");
document.getElementById("txtEReport").focus();
return false;
}

if(document.getElementById("txtRCompNo").value=="Select")
{
alert("Please Select a Complain....");

return false;
}
if(document.getElementById("ddlCStatus").value=="Select")
{
alert("Please Select a Status...");

return false;
}

chk=confirm("Do u want to Submit these Records..?");
if(chk==false)
return false;
}

</script>


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
	<strong>Report Form</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->
<form method="post" action="ComplaintSuccess?flag=R"  onsubmit="return CheckData()">
<table width="760" border="0">
		<tr>
    		<td width="150"><label for="compnoselect">Select the Complain Number for which you have to fill Report<h5></label></td>
            <td>
            <select name="txtRCompNo" id="txtRCompNo" size="1">
  				<option value="Select" selected="selected">Select</option>
  				<%
				while(igroups.hasNext())
				{
				 Complaints compno=(Complaints)igroups.next();
				 if(compno.equals(null))
	    			{
	    		session.setAttribute("msg","Sorry there are no Complaints for which Reports can be filled");
	    		response.sendRedirect("MessagePage.jsp");
	    			}
				%>
				<option value="<%=compno.getComplainNo()%>"><%=compno.getComplainNo()%></option>
                <%
 		    	 		    		
				}
			  %>
				
        	</select>           
        	 </td>
  		</tr>


  		<tr>
    		<td width="150"><label for="Report">Report</label></td>
    		<td><textarea cols="70" rows="8" name="txtEReport" id="txtEReport" ></textarea> <!--address--></td>
  		</tr>
  		<tr>
    		<td width="150"><label for="Status">Status</label></td>
            <td>
    		<select name="ddlCStatus" id="ddlCStatus" size="1">
    		<option value="Select" selected="selected">Select</option>
  				<option value="Pending" >Pending</option>
				<option value="Resolved">Resolved</option>
            </select>
            </td>
  		</tr>
    </table>
    <center><input name="btnRegister" type="submit" id="btnRegister" value="Submit" />
                <input name="btnReset" type="reset" id="btnReset" value="Reset" onclick="setFocus(document.getElementById('txtEReport'))" /></center>
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

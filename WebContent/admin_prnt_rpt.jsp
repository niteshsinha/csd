    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="Calendar/spiffyCal.css">
<script language="JavaScript" src="Calendar/spiffyCal.js"></script>
<script language="javascript">
   var cal1=new ctlSpiffyCalendarBox("cal1", "frmTest", "txtComp_GivenDate","btnGenerate","");
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
%>       
<script type="text/javascript">
function CheckData1()
{
	if(document.getElementById("ddlComp_GivenStatus_Date").value=="Select")
	{
		alert("Please Select the Complain Type..Date!");
		return false;
	}
}

function CheckData2()
{
	if(document.getElementById("ddlComp_GivenStatus_Week").value=="Select")
	{
		alert("Please Select the Complain Type..week!");
		return false;
	}
}
function CheckData3()
{
	if(document.getElementById("ddlComp_GivenStatus_Year").value=="Select")
	{
		alert("Please Select the Complain Type...Year");
		return false;
	}
}
function CheckData4()
{
	if(document.getElementById("ddlComp_GivenStatus_Month").value=="Select")
	{
		alert("Please Select the Complain Type...");
		return false;
	}
	else if(document.getElementById("ddlComp_GivenMonth").value=="Select")
	{
		alert("Please Select the Month...");
		return false;
	}
	else if(document.getElementById("ddlComp_GivenYear").value=="Select")
	{
		alert("Please Select the Year...");
		return false;
	}
}
	function CheckData5()
{
	if((!document.UserComp.UserWise[0].checked)&&(!document.UserComp.UserWise[1].checked))
	{
		alert("Please Select one of the radio botton....");
		return false;
	}

	
}
</script>
</head>
<body class="tundra">
<div id="spiffycalendar" class="text"></div>
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
	<strong>Print</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->

<table width="760" border="0">
  <tr>
    <td width="250"><center>
    	<div id="rpthead">
    		<strong>Datewise Complains</strong>
    	</div>
    	
    	<div id="rptcontent" align="left" style="padding-left: 12px;">
    	
    		<form name="frmTest" method="post" action="ReportingSuccess?flag=CGDate" onSubmit="return CheckData1()">
    			
    			&nbsp;&nbsp;Select Type&nbsp;&nbsp;&nbsp;<select name="ddlComp_GivenStatus_Date" id="ddlComp_GivenStatus_Date">
  					<option value="Select" selected>Select</option>
  					<option value="All" >All</option>
  					<option value="Pending">Pending</option>
  					<option value="Process">In Process</option>
  					<option value="Resolved">Resolved</option></select>
  						<br>
             	Select Date &nbsp;&nbsp;&nbsp;
       			<SCRIPT language="JavaScript">cal1.writeControl();</SCRIPT>
             	<br>
             	<center>
             	<input name="btnGenerate" type="submit" id="btnGenerate" value="Generate"/>
             	</center>   
                	
    		
    		</form>
    		
    	</div>
    	
    	<div id="rptcloser"></div>
    </center></td>
    <td width="250" >
    	<div id="rpthead">
    		<strong>Weekwise Complains</strong>
    	</div>
    	
    	<div id="rptcontent" align="left" style="padding-left: 12px;">
    	
    		<form name="WeekComp" method="post" action="ReportingSuccess?flag=CGWeek" onSubmit="return CheckData2()">
    			
    			&nbsp;&nbsp;Select Type&nbsp;&nbsp;&nbsp;<select name="ddlComp_GivenStatus_Week" id="ddlComp_GivenStatus_Week">
  					<option value="Select" selected>Select</option>
  					<option value="All" >All</option>
  					<option value="Pending">Pending</option>
  					<option value="Process">In Process</option>
  					<option value="Resolved">Resolved</option></select>
  					<br>					
    			&nbsp;&nbsp;<label>No. of Weeks</label>&nbsp;&nbsp;&nbsp;
    			<input type="text" name="txtComp_GivenWeek" value="" 
    				dojoType="dijit.form.ValidationTextBox" 
    				size="15"
    				required="true"
    				regExp="[\0-9]+"
    			 	id="txtComp_GivenWeek"/>
    				<br>
             	<center>
             	<input name="btnGenerate" type="submit" id="btnGenerate" value="Generate"/>
             	</center>
    		</form>
    	</div>
    	
    	<div id="rptcloser"></div>
    </td>
    <td width="250"><center>
    	<div id="rpthead">
    		<strong>Monthwise Complains</strong>
    	</div>
    	
    	<div id="rptcontent" align="left" style="padding-left: 12px;">
    	
    		<form name="MonthComp" method="post" action="ReportingSuccess?flag=CGMonth" onSubmit="return CheckData4()">
    			
    			&nbsp;&nbsp;Select Type&nbsp;&nbsp;&nbsp;<select name="ddlComp_GivenStatus_Month" id="ddlComp_GivenStatus_Month">
  					<option value="Select" selected>Select</option>
  					<option value="All" >All</option>
  					<option value="Pending">Pending</option>
  					<option value="Process">In Process</option>
  					<option value="Resolved">Resolved</option></select>
  					<br>					
    				&nbsp;&nbsp;Select Year&nbsp;&nbsp;&nbsp;<select name="ddlComp_GivenYear" id="ddlComp_GivenYear">
  					<option value="Select" selected>Select</option>
  					<option value="2009" >2009</option>
  					<option value="2008">2008</option>
  					<option value="2007">2007</option></select>
  					<br>
  					&nbsp;&nbsp;Select Month&nbsp;&nbsp;&nbsp;<select name="ddlComp_GivenMonth" id="ddlComp_GivenMonth">
  					<option value="Select" selected>Select</option>
  					<option value="1" >1. January</option>
  					<option value="2">2. February</option>
  					<option value="3">3. March</option>
  					<option value="4">4. April</option>
  					<option value="5">5. May</option>
  					<option value="6">6. June</option>
  					<option value="7">7. July</option>
  					<option value="8">8. August</option>
  					<option value="9">9. September</option>
  					<option value="10">10. October</option>
  					<option value="11">11. November</option>
  					<option value="12">12. December</option></select>
  					<br>		
  							
             	<center>
             	<input name="btnGenerate" type="submit" id="btnGenerate" value="Generate"/>
             	</center>
    		</form>
    	</div>
    	
    	<div id="rptcloser"></div>
    </center></td>
  </tr>
  <tr>
    <td width="250">
    	<div id="rpthead">
    		<strong>Yearwise Complains</strong>
    	</div>
    	
    	<div id="rptcontent" align="left" style="padding-left: 12px;">
    	
    		<form name="YearComp" method="post" action="ReportingSuccess?flag=CGYear" onSubmit="return CheckData3()" >
    			
    			&nbsp;&nbsp;Select Type&nbsp;&nbsp;&nbsp;<select name="ddlComp_GivenStatus_Year" id="ddlComp_GivenStatus_Year">
  					<option value="Select" selected>Select</option>
  					<option value="All" >All</option>
  					<option value="Pending">Pending</option>
  					<option value="Process">In Process</option>
  					<option value="Resolved">Resolved</option></select>
  					<br>					
    			&nbsp;&nbsp;<label>Enter the Year</label>&nbsp;&nbsp;&nbsp;
    			<input type="text" name="txtComp_GivenYear" 
    				dojoType="dijit.form.ValidationTextBox" 
    				size="15"
    				required="true"
    				regExp="[\0-9]+"
    			 	id="txtComp_GivenYear"/>
    				<br>
             	<center>
             	<input name="btnGenerate" type="submit" id="btnGenerate" value="Generate"/>
             	</center>
    		</form>
    	</div>
    	
    	<div id="rptcloser"></div>
    	
    </td>
    <td width="250"><center>
    	<div id="rpthead">
    		<strong>Userwise Complains</strong>
    	</div>
    	
    	<div id="rptcontent" align="left" style="padding-left: 12px;">
    	
    		<form name="UserComp" method="post" action="ReportingSuccess?flag=Uwise" onSubmit="return CheckData5()" >
    		
    			<input type="radio" name="UserWise" value="Cus" id="UserWise" >	   			
    			Complains Registered by Each Customer<br>		
    			<input type="radio" name="UserWise" value="Emp" id="UserWise">			
    			Number of Complains assigned to each Employee<br>
    		   	<center>
             	<input name="btnGenerate" type="submit" id="btnGenerate" value="Generate"/>
             	</center>
    		</form>
    	</div>
    	
    	<div id="rptcloser"></div>
    </center></td>
    <td width="250"><center>
    	<div id="rpthead">
    		<strong>List of End Users</strong>
    	</div>
    	
    	<div id="rptcontent" align="left" style="padding-left: 12px;">
    	
    		<form name="UserComp" method="post" action="ReportingSuccess?flag=LU" " >
    		
    			<input type="radio" name="ListUsers" value="LCus" id="ListUsers" >	   			
    			List of All Customers<br>		
    			<input type="radio" name="ListUsers" value="LEmp" id="ListUsers">			
    			List of All Employee<br>
    		   	<center>
             	<input name="btnGenerate" type="submit" id="btnGenerate" value="Generate"/>
             	</center>
    		</form>
    	</div>
    	
    	<div id="rptcloser"></div>
    </center></td>
  </tr>
  
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
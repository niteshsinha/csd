<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,csd.*,java.util.Date, java.text.DateFormat,java.text.SimpleDateFormat" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Comaplain Registration</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>

<% 
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy ");
            Date currentdate = new Date();
            System.out.println(dateFormat.format(currentdate));
            %>
            
 <script type="text/javascript">
dojo.require("dojo.parser");
dojo.require("dijit.layout.ContentPane");
dojo.require("dijit.form.ValidationTextBox");
dojo.require("dijit.form.CheckBox");
dojo.require("dijit.form.DateTextBox");
dojo.require("dijit.form.Textarea");
var init = function(){
    dijit.byId('txtPhoneNo').focus();
};
dojo.addOnLoad(init);
</script>           
<script type="text/javascript">
function setFocus(id)
{
id.focus();
}

function CheckData()
{
if(document.getElementById("ddlProblemType").value=="Select")
{
alert("Please Select Problem Type..!");
return false;
}
else if(document.getElementById("txtPhoneNo").value=="")
{
alert("Please Enter Contact No..!");
document.getElementById("txtPhoneNo").focus();
return false;
}
else if(document.getElementById("txtProblem").value=="")
{
alert("Please Enter Problem Description..!");
document.getElementById("txtProblem").focus();
return false;
}
else if (isNaN(document.getElementById("txtPhoneNo").value))
{
alert("Please Enter A Valid Phone Number..!");
document.getElementById("txtPhoneNo").focus();
return false;
}
chk=confirm("Do u want to Submit these Records..?");
if(chk==false)
return false;
}
</script>

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
//To Fetch the Service/Problemtype

List SerList=Services.GetServices();
if(SerList==null)
throw new ServletException("Sorry No Service Available");
Iterator igroups=SerList.iterator();

session.setAttribute("AssignEmp","Unassigned");
session.setAttribute("Rep","Not Filed");
session.setAttribute("Sta","Pending");
session.setAttribute("Feed","Not Filled");
int intComplainNo=Complaints.GetMaxCompNo();

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
    	<td height="120"><center><img src="images/feed.png"></center></td>
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
	<strong>Complain Registration</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->
<form action="ComplaintSuccess?flag=RC" method="post" onsubmit="return CheckData()"> <!-- This is a form -->
	<table width="760" border="0">
  		<tr>
    		<td width="150"><label for="problemtype">Problem Type</label></td>
    		<td>
            	<select name="ddlProblemType" id="ddlProblemType">
  					<option value="Select" selected="selected">Select</option>
                <%
				while(igroups.hasNext())
				{
				 Services serv=(Services)igroups.next();
				%>
                <option value="<%=serv.getServ()%>"><%=serv.getServ()%></option>
                <%
 		    	}
			  %>
                </select>
            </td>
  		</tr>
         <tr>
    		<td width="150"><label for="username">User Name</label></td>
    		<td><input type="text" readonly="readonly" name="txtUserName" value="<%=Uname%>"
            	dojoType="dijit.form.ValidationTextBox" 
                size="30"
                id="txtUserName"/> <!--user name-->
            </td>
  		</tr>
        <tr>
    		<td width="150"><label for="phone">Phone No</label></td>
    		<td><input type="text" name="txtPhoneNo" value="" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                size="30" 
                id="txtPhoneNo"
              
                invalidMessage="This is not a valid Phone No." 
                promptMessage= "Enter your Phone number. (Maximum length 10 digits)" 
                maxLength="10"
                regExp="[\0-9]+"/> <!--phone number--></td>
  		</tr>
        <tr>
    		<td width="150"><label>Complain No</label></td>
    		<td><input type="text" name="txtComplainNo" value="<%=intComplainNo%>" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				
                size="30" 
                readonly="readonly"

                id="txtComplainNo"/> </td>
  		</tr>
         <tr>
    		<td width="150"><label for="username">Complain Date</label></td>
    		<td><input type="text" readonly="readonly" name="txtComplainDate" value="<%=dateFormat.format(currentdate) %>"
     
                size="30"
               
                id="txtComplainDate"/> 
            </td>
  		</tr>
        
        
        
  		<tr>
    		<td width="150"><label for="problumdesc">Problem Description</label></td>
    		<td><textarea cols="60" rows="6" name="txtProblem" id="txtProblem" ></textarea></td>
  		</tr>
  	</table>
    <center>
    <input name="btnRegister" type="submit" id="btnRegister" value="Register Complaint" onclick="return CheckData()"/>
                <input name="btnReset" type="reset" id="btnReset" value="Reset" onclick="setFocus(document.getElementById('txtCompPerson'))" />
</center>
</form>
&nbsp;
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

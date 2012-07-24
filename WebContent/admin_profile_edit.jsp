<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Administrator Profile Edit</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
	@import "dijit/themes/tundra/tundra.css";
	@import "dojo/resources/dojo.css";
	.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
	
</style>

<script type="text/javascript" src="dojo/dojo.js"
djConfig="parseOnLoad: true"></script>
<script>
dojo.require("dojo.parser");
dojo.require("dijit.layout.ContentPane");
dojo.require("dijit.form.ValidationTextBox");
dojo.require("dijit.form.CheckBox");
dojo.require("dijit.form.Button");
dojo.require("dijit.form.DateTextBox");
dojo.require("dijit.form.Textarea");
</script>

<script type="text/javascript">
function setFocus(id)
{
id.focus();
}
function CheckData()
{
chk=confirm("Do u want to Submit these Records..?");
if(chk==false)
return false;
}
</script>

<script type="text/javascript">
function enableCall() {
    dijit.byId("submitbtn").setDisabled(!dijit.byId("txtUserName").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtPassword").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtAdminName").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtAddressline1").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtArea").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtCity").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtCountry").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtPhoneNo").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtMobileNo").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtEmailId").isValid());
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
   if(!(UserType.GetRole(Uname)).equals("Administrator"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }

Admin cs=Admin.GetAdmin(Uname);
 String aUserName="",aAddressline1="",aPhoneNo="",aMobileNo="",aEmailId="",aRemarks="",aAdminName="",aArea="",aCity="",aCountry="";
 if(!cs.getUsername().equals("none"))
 {
	  aUserName=cs.getUsername();
      aAdminName=cs.getAdminname();
	  aAddressline1=cs.getAddressline1();
      aArea=cs.getArea();
      aCity=cs.getCity();
      aCountry=cs.getCountry();
	  aPhoneNo=cs.getPhone();
	  aMobileNo=cs.getMobile();
	  aEmailId=cs.getEMail();
	  aRemarks=cs.getRemarks();
 }
%>

</head>
<body class="tundra">
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
	<strong>Edit Your Profile</strong>
</div> <!-- End of 1st div -->
<div id="content"> <!-- This is the 2nd div -> Content. -->
<form form action="AdminSucces?flag=M" method="post" onsubmit="return CheckData()"> <!-- This is a form -->
	<table width="760" border="0">
  		<tr>
    		<td width="150"><label for="username">User Name</label></td>
    		<td><input type="text" readonly="readonly" name="txtUserName" value="<%=aUserName%>"
            	dojoType="dijit.form.ValidationTextBox" 
                size="30"
                id="txtUserName"/> <!--user name-->
            </td>
  		</tr>
  		<tr>
    		<td width="150"><label for="password">Password</label></td>
    		<td><label for="password">
            							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            							[NOT SHOWN]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </label>
               <b> <a href="pass_change.jsp"> Change Password </a></b>
                
                </td>
  		</tr>
        
  		<tr>
    		<td width="150"><label for="Adminname">Name</label></td>
    		<td><input type="text" name="txtAdminName" value="<%=aAdminName%>"
            	dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                size="30" 
                invalidMessage="This is not a valid Name." 
                promptMessage= "Enter your full name." 
                maxLength="20"
                regExp="[\a-z A-Z]+"
                id="txtAdminName"/>
          <!--customer name--></td>
  		</tr>
        <tr>
    		<td width="150"><label for="addressln1">Address</label></td>
    		<td><input type="text" name="txtAddressline1" value="<%=aAddressline1%>" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                size="30" 
                invalidMessage="The value is invalid." 
                promptMessage= "Enter your house number and street name." 
                maxLength="30"
                regExp="[\a-z A-Z0-9,/-]+"
                id="txtAddressline1"/>
			</td>
  		</tr><!--address-->
        <tr>
    		<td width="150"><label for="locality">Locality</label></td>
    		<td><input type="text" name="txtArea" value="<%=aArea%>" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                size="30" 
                invalidMessage="This is not a valid Locality Name." 
                promptMessage= "Enter the name of your locality." 
                maxLength="20"
                regExp="[\a-z A-Z]+"
                id="txtArea"/>
			</td>
  		</tr><!--address-->
        <tr>
    		<td width="150"><label for="city">City</label></td>
    		<td><input type="text" name="txtCity" value="<%=aCity%>" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                size="30" 
                invalidMessage="This is not a valid City Name." 
                promptMessage= "Enter the name of your city." 
                maxLength="20"
                regExp="[\a-z A-Z]+"
                id="txtCity"/>
			</td>
  		</tr><!--address-->
        <tr>
    		<td width="150"><label for="country">Country</label></td>
    		<td><input type="text" name="txtCountry" value="<%=aCountry%>" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                size="30" 
                invalidMessage="This is not a valid Country Name." 
                promptMessage= "Enter the name of your country." 
                maxLength="20"
                regExp="[\a-z A-Z]+"
                id="txtCountry"/>
			</td>
        <tr>
   		  <td width="150"><label for="gender"></label></td>
    		<td><!--gender-->            </td>
  		</tr>
  		<tr>
    		<td width="150"><label for="phone">Phone No</label></td>
    		<td><input type="text" name="txtPhoneNo" value="<%=aPhoneNo%>" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                size="30" 
                invalidMessage="This is not a valid Phone No." 
                promptMessage= "Enter your Phone number. (Maximum length 10 digits)" 
                maxLength="10"
                regExp="[\0-9]+"
                id="txtPhoneNo"/> <!--phone number--></td>
  		</tr>
  		<tr>
    		<td width="150"><label for="mobile">Mobile No</label></td>
    		<td><input type="text" name="txtMobileNo" value="<%=aMobileNo%>" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                size="30" 
                invalidMessage="This is not a valid Mobile No." 
                promptMessage= "Enter your Mobile number." 
                maxLength="10"
                regExp="[\0-9]+"
                id="txtMobileNo"/> <!--mobile number--></td>
  		</tr>
  		<tr>
    		<td width="150"><label for="email">Email ID</label></td>
    		<td><input type="text" name="txtEmailId" value="<%=aEmailId%>" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                size="50" 
                invalidMessage="Enter a valid Email Id." 
                promptMessage= "Enter your Email Id." 
                regExp="\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b"
                id="txtEmailId"/> <!--email id--></td>
  		</tr>
  		<tr>
    		<td width="150"><label for="remark">Any Thing Else About Yourself<br></label></td>
    		<td><textarea name="txtRemarks" id="txtRemarks style="width:300px"><%=aRemarks%>
             	</textarea> <!--anything else that the usre wants to add about himself-->
            </td>
  		</tr>
    </table>
    <center><button 
        dojoType="dijit.form.Button" 
        label="Submit" 
        id="submitbtn"
        type="submit" 
        widgetId="submitbtn" 
        disabled='false'>
        </button>
        &nbsp;&nbsp;&nbsp;<button 
        dojoType="dijit.form.Button" 
        label="Reset" 
        id="btnReset"
        type="reset" 
        widgetId="btnReset" 
        disabled='false'
        onclick="setFocus(document.getElementById('txtAdminName'))">
        </button></center>
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

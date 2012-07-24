<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*" errorPage="" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Customer Profile</title>
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
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtCustomerName").isValid());
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
   if(!(UserType.GetRole(Uname)).equals("Customer"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }

session.setAttribute("CPtxtUserName",session.getAttribute("Uname"));

 Customers cs=Customers.GetCustomerN(Uname);
 String cUserName="",cAddressline1="",cPhoneNo="",cMobileNo="",cEmailId="",cRemarks="",cCustomerName="",cArea="",cCity="",cCountry="";
 if(!cs.getUsername().equals("none"))
 {
	  cUserName=cs.getUsername();
      cCustomerName=cs.getCustomername();
	  cAddressline1=cs.getAddressline1();
      cArea=cs.getArea();
      cCity=cs.getCity();
      cCountry=cs.getCountry();
	  cPhoneNo=cs.getPhone();
	  cMobileNo=cs.getMobile();
	  cEmailId=cs.getEMail();
	  cRemarks=cs.getRemarks();
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
	<strong>Edit Your Profile</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->
<form form action="RegSucces?flag=M" method="post" onsubmit="return CheckData()"> <!-- This is a form -->
	<table width="760" border="0">
  		<tr>
    		<td width="150"><label for="username">User Name</label></td>
    		<td><input type="text" readonly="readonly" name="txtUserName" value="<%=cUserName%>"
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
    		<td width="150"><label for="empname">Name</label></td>
    		<td><input type="text" name="txtCustomerName" value="<%=cCustomerName%>"
            	dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                size="30" 
                invalidMessage="This is not a valid Name." 
                promptMessage= "Enter your full name." 
                maxLength="20"
                regExp="[\a-z A-Z]+"
                id="txtCustomerName"/>
          <!--customer name--></td>
  		</tr>
        <tr>
    		<td width="150"><label for="addressln1">Address</label></td>
    		<td><input type="text" name="txtAddressline1" value="<%=cAddressline1%>" 
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
    		<td><input type="text" name="txtArea" value="<%=cArea%>" 
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
    		<td><input type="text" name="txtCity" value="<%=cCity%>" 
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
    		<td><input type="text" name="txtCountry" value="<%=cCountry%>" 
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
    		<td><input type="text" name="txtPhoneNo" value="<%=cPhoneNo%>" 
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
    		<td><input type="text" name="txtMobileNo" value="<%=cMobileNo%>" 
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
    		<td><input type="text" name="txtEmailId" value="<%=cEmailId%>" 
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
    		<td width="150"><label for="remark">Further Description<br></label></td>
    		<td><textarea name="txtRemark" id="txtRemark" style="width:300px"><%=cRemarks%>
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
        &nbsp;&nbsp;&nbsp;
        
        <button 
        dojoType="dijit.form.Button" 
        label="Reset" 
        id="btnReset"
        type="reset" 
        widgetId="resetbtn" 
        disabled='false'
        onclick="setFocus(document.getElementById('txtCustomerName'))">
        </button>
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

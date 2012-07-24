<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.w3c.dom.Document"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>




<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Registration</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="passStr.js">
	</script>
<style type="text/css">
	@import "dijit/themes/tundra/tundra.css";
	@import "dojo/resources/dojo.css";
	.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
	
</style>

<%
if(!session.getAttribute("link").equals("home.jsp"))
{
session.setAttribute("msg","You have already logged in Please logout to login again !!");
response.sendRedirect("MessagePage.jsp");
}

%>

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
var init = function(){
    dijit.byId('txtUserName').focus();
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
if(document.getElementById("txtPassword").value!=document.getElementById("txtRePassword").value)
{
alert("Please Enter Same Password..!");
document.getElementById("txtPassword").value="";
document.getElementById("txtRePassword").value="";
document.getElementById("txtPassword").focus();
return false;
}
chk=confirm("Do u want to Submit these Records..?");
if(chk==false)
return false;
}
</script>


<script type="text/javascript">
function enableCall() {
    dijit.byId("submitbtn").setDisabled(!dijit.byId("txtUserName").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtPassword").isValid());
    dijit.byId("submitbtn").setDisabled(!dijit.byId("txtRePassword").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtCustomerName").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtAddressline1").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtArea").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtCity").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtCountry").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtPhoneNo").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtMobileNo").isValid());
	dijit.byId("submitbtn").setDisabled(!dijit.byId("txtEmailId").isValid());
	}
function CheckForUserName()
	{
		    dijit.byId("submitbtnCheck").setDisabled(!dijit.byId("txtUserName").isValid());
		
	}
</script>



</head>
<body class="tundra" >
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

<div id="head"> <!-- This is the 1st div -> title -->
	<strong>Registration</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->
<div dojoType="dijit.layout.ContentPane" title="Personal Data">
<form  method="post" action="RegSucces?flag=A"  onsubmit="return CheckData()" name=commandForm> <!-- This is a form -->
	

	
	<table width="760" border="0">
  		<tr>
   		  <td width="172"><label for="username">User Name</label></td>
    		<td width="578"><input type="text" name="txtUserName" value=""
            	dojoType="dijit.form.ValidationTextBox"
            	trim="true"
				required="true" 
                size="30" 
                onBlur="CheckForUserName()"
                id="txtUserName"
                onBlur="enableCall()"
                invalidMessage="The User Name is invalid" 
                promptMessage="Enter your User Name. (Maximum size 20)" 
                maxLength="20"
                regExp="[a-zA-Z0-9._]+"/>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
               
    		<!--user name-->
          </td>
   
  		<tr>
   		  <td width="172"><label for="password">New Password</label></td>
   		  <td><input type="password" name="txtPassword" value=""
            	dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                size="30" 
                id="txtPassword"
                onBlur="enableCall()"
                invalidMessage="The Password is invalid" 
                promptMessage="Enter your new password. (Maximum size 20)" 
                maxLength="20"
                regExp="[\a-zA-Z0-9!@#$%^&*]+"
                onkeyup="testPassword(document.forms.commandForm.txtPassword.value);"/> 
   		  <!--password-->
   		 		 <a id=Words>
					<table border=0 cellpadding=0 cellspacing=0>
    					<tr>
        					<td class=bold>Strength:</td>
            				<td><table cellpadding=0 cellspacing=2>
                					<tr>
                    					<td height=15 width=142 bgcolor=#dddddd></td>
                    				</tr>
               					</table></td>
           					<td class=bold>Begin Typing</td>
						</tr>
					</table>
				</a>
			</td>
  		</tr>
        <tr>
   		  <td width="172"><label for="repassword">Retype New Password</label></td>
   		  <td><input type="password" name="repassword" value=""
            	dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                id="txtRePassword"
                onBlur="enableCall()"
                size="30" 
                invalidMessage="The Password is invalid" 
                promptMessage= "Retype your new password. (Maximum size 20)" 
                maxLength="20"
                regExp="[\a-zA-Z0-9!@#$%^&*]+"/> <!--password--></td>
  		</tr>
        <tr>
   			<td width="172">&nbsp;</td>
    		<td width="578">&nbsp;</td>
  		</tr>
  		<tr>
   		  <td width="172"><label for="empname">Name</label></td>
   		  <td><input type="text" name="txtCustomerName" value=""
            	dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                size="30"
                id="txtCustomerName"
                onBlur="enableCall()" 
                invalidMessage="This is not a valid Name." 
                promptMessage= "Enter your full name." 
                maxLength="20"
                regExp="[\a-z A-Z]+"/> <!--customer name--></td>
  		</tr>
        <tr>
   			<td width="172">&nbsp;</td>
    		<td width="578">&nbsp;</td>
  		</tr>
        <tr>
   		  <td width="172"><label for="addressln1">Address line 1</label></td>
   		  <td><input type="text" name="txtAddressline1" value="" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                size="30" 
                id="txtAddressline1"
                onBlur="enableCall()"
                invalidMessage="The value is invalid." 
                promptMessage= "Enter your house number and street name." 
                maxLength="30"
                regExp="[\a-z A-Z0-9,/-]+"/>
			</td>
  		</tr><!--address-->
        <tr>
   		  <td width="172"><label for="locality">Locality</label></td>
   		  <td><input type="text" name="txtArea" value="" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                id="txtArea"
                onBlur="enableCall()"
                propercase="true"
				required="true" 
                size="30" 
                invalidMessage="This is not a valid Locality Name." 
                promptMessage= "Enter the name of your locality." 
                maxLength="20"
                regExp="[\a-z A-Z]+"/>
			</td>
  		</tr><!--address-->
        <tr>
   		  <td width="172"><label for="city">City</label></td>
   		  <td><input type="text" name="txtCity" value="" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                id="txtCity"
                onBlur="enableCall()"
                size="30" 
                invalidMessage="This is not a valid City Name." 
                promptMessage= "Enter the name of your city." 
                maxLength="20"
                regExp="[\a-z A-Z]+"/>
			</td>
  		</tr><!--address-->
        <tr>
   			<td width="172"><label for="country">Country</label></td>
   			<td><input type="text" name="txtCountry" value="" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
                propercase="true"
				required="true" 
                id="txtCountry"
                onBlur="enableCall()"
                size="30" 
                invalidMessage="This is not a valid Country Name." 
                promptMessage= "Enter the name of your country." 
                maxLength="20"
                regExp="[\a-z A-Z]+"/>
			</td>
        </tr>
        <tr>
   			<td width="172">&nbsp;</td>
    		<td width="578">&nbsp;</td>
  		</tr>
  		<tr>
   		  <td width="172"><label for="phone">Phone No</label></td>
   		  <td><input type="text" name="txtPhoneNo" value="" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                size="30" 
                id="txtPhoneNo"
                onBlur="enableCall()"
                invalidMessage="This is not a valid Phone No." 
                promptMessage= "Enter your Phone number. (Maximum length 10 digits)" 
                maxLength="10"
                regExp="[\0-9]+"/> <!--phone number--></td>
  		</tr>
  		<tr>
   		  <td width="172"><label for="mobile">Mobile No</label></td>
   		  <td><input type="text" name="txtMobileNo" value="" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                id="txtMobileNo"
                onBlur="enableCall()"
                size="30" 
                invalidMessage="This is not a valid Mobile No." 
                promptMessage= "Enter your Mobile number." 
                maxLength="10"
                regExp="[\0-9]+"/> <!--mobile number--></td>
  		</tr>
        <tr>
   			<td width="172">&nbsp;</td>
    		<td width="578">&nbsp;</td>
  		</tr>
  		<tr>
   		  <td width="172"><label for="email">Email ID</label></td>
   		  <td><input type="text" name="txtEmailId" value="" 
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                size="30" 
                id="txtEmailId"
                onBlur="enableCall()"
                invalidMessage="Enter a valid Email Id." 
                promptMessage= "Enter your Email Id." 
                regExp="\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b"/> <!--email id--></td>
  		</tr>
        <tr>
   			<td width="172">&nbsp;</td>
    		<td width="578">&nbsp;</td>
  		</tr>
  		<tr>
   		  <td width="172"><label for="remark">Further Description<br></label></td>
   		  <td><textarea name="txtRemark"
             	dojoType="dijit.form.Textarea"
             	   promptMessage= "Press Enter to expand the text box" 
                style="width:300px">
             	</textarea> <!--anything else that the usre wants to add about himself-->
            </td>
  		</tr>
        <tr>
    		<td width="150"><label for="tac">Terms and Conditions</label></td>
    		<td><textarea readonly="readonly" cols="60" rows="10">Welcome to our Web site. By using our site, you are agreeing to comply with and be bound by the following terms of use. Please review the following terms carefully. If you do not agree to these terms, you should not use this site. The term "Solutions.com" or "us" or "we" or "our" refers to solutions.com, the owner of the Web site. The term "you" refers to the user or viewer of our Web Site. ou agree to the terms and conditions outlined in this Terms of Use Agreement ("Agreement") with respect to our site . This Agreement constitutes the entire and only agreement between us and you, and supersedes all prior or contemporaneous agreements, representations, warranties and understandings with respect to the Site, the content, products or services provided by or through the Site, and the subject matter of this Agreement. This Agreement may be amended at any time by us from time to time without specific notice to you. The latest Agreement will be posted on the Site, and you should review this Agreement prior to using the Site. </textarea> <!--this area is for the terms and conditions-->
			</td>
  		</tr>
        <tr>
    		<td width="150"></td>
    		<td>
    		<b>By Clicking Submit you agree to the terms and conditions.
    		
            </td>
  		</tr>
	</table>
    <center>
    	<button 
        dojoType="dijit.form.Button" 
        label="Submit" 
        id="submitbtn"
        type="submit" 
        widgetId="submitbtn" 
        disabled='true'>
        </button>
        &nbsp;&nbsp;&nbsp;
        
        <button 
        dojoType="dijit.form.Button" 
        label="Reset" 
        id="btnReset"
        type="reset" 
        widgetId="resetbtn" 
        onclick="setFocus(document.getElementById('txtCustomerName'))"
        disabled='false'>
        </button>
        </center>
</form>
</div>
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
    
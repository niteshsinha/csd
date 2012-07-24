<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.w3c.dom.Document"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>




<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Registration: Page 1</title>
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
String msgA="",msgNA="";
//if(session.getAttribute("CheckUser").toString().equals("A"))
//{
//	msgA="User Name is Available";
//	session.setAttribute("CheckUser","UN");
//}
//else if(session.getAttribute("CheckUser").toString().equals("NA"))
//{
//	msgNA="User Name is Not Available";
//	session.setAttribute("CheckUser","UN");
//}
//else
//{//
//	msgA="";
//	msgNA="";
//}

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
<table>
<tr>
<td>

<div dojoType="dijit.layout.ContentPane" title="Personal Data">
<form  method="post" action="RegSucces?flag=A"  onsubmit="return CheckData()" name=commandForm> <!-- This is a form -->
	

<center>	
	<table border="0">
  		<tr>
   		  <td width="172"><label for="username">User Name</label></td>
    		<td width="300"><input type="text" name="txtUserName" value=""
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
               <br> 
               
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
                <br>
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
	</table>
	</center>
    <center>
    	<button 
        dojoType="dijit.form.Button" 
        label="Continue...." 
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
</td>

<td width="280" style="padding-bottom: 118px;">
<form method="post" action="RegSucces?flag=CU">
		<input type="submit" name="btnCheck" value="Check Availability" id="btnCheck"/>
		
				<%out.print(  msgNA );%>
				<%out.print(  msgA );%>
		
</form>
</td>

</tr>
</table>
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
    
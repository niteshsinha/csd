<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Login</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
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
dojo.require("dijit.form.DateTextBox");
dojo.require("dijit.form.Textarea");
var init = function(){
    dijit.byId('txtUser').focus();
};
dojo.addOnLoad(init);
</script>

<script type="text/javascript">
function CheckData()
{
if(document.getElementById("txtUser").value=="")
{
alert("Please enter Username..!");
document.getElementById("txtUser").focus();
return false;
}
if(document.getElementById("txtPass").value=="")
{
alert("Please enter Password..!");
document.getElementById("txtPass").focus();
return false;
}

}
</script>

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
<div id="main" align="center" > <!-- This is the main div. This is 1 level below the body. -->
&nbsp;

<form  id="login"   method="post" action="UserCheck" onsubmit="return CheckData();"> <!-- This is a form -->
	<fieldset>
    <legend><strong>Login</strong></legend>
    	<table width="180"> <!-- This is a 4x1 table to get the value of user name and dpassword-->
			<tr>
				<td align="left"><label for="username">User ID:</label></td>
			</tr>
			<tr>
				<td align="left"><input type="text" name="txtUser" id="txtUser"	
                dojoType="dijit.form.ValidationTextBox" 
                size="30"/></td> <!--user name-->
			</tr>
			<tr>
				<td align="left"><label for="password">Password:</label></td>
			</tr>
			<tr>
				<td align="left"><input type="password" name="txtPass"  id="txtPass"
                dojoType="dijit.form.ValidationTextBox" 
                trim="true"
				required="true" 
                size="30" 
                invalidMessage="The Password is invalid" 
                promptMessage="Enter your new password. (Maximum size 20)" 
                maxLength="20"
                regExp="[\w]+"
                /></td> <!-- password -->
			</tr>
            <tr>
            	<td align="right"><input type="submit" name="signinsubmit" value="Sign In" id="btnsignin"/>&nbsp;&nbsp;</td> <!-- This is the submit buttom -->
            </tr>
		</table> <!-- Table ends here -->
    </fieldset>
</form> <!-- Form ends here -->
    
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
</div> <!-- Main dev ends here -->
<center><img src="images/bottom.png"/></center>
    </td>
  </tr>
</table>
</body>
</html>

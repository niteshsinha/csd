<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>
<%
String CPtxtUserName="";
CPtxtUserName=session.getAttribute("Uname").toString();
String msg="",tempmsg="";
if(session.getAttribute("msg")=="Invalid Old Password!!...Enter Again...!")
 {
	tempmsg=session.getAttribute("msg").toString();
 	session.setAttribute("msg","");
 }
%>
<script type="text/javascript">

function CheckData()
{
if(document.getElementById("txtOldPass").value=="")
{
alert("Please enter Old Password..!");
document.getElementById("txtOldPass").focus();
return false;
}
if(document.getElementById("txtNewPass").value=="")
{
alert("Please enter New Password..!");
document.getElementById("txtNewPass").focus();
return false;
}
if(document.getElementById("txtReNewPass").value=="")
{
alert("Please Confirm Password..!");
document.getElementById("txtReNewPass").focus();
return false;
}
if(document.getElementById("txtNewPass").value!=document.getElementById("txtReNewPass").value)
	{
     alert("Passwords do not match!! Please Re-Enter...!")
    txtNewPass="";
	txtReNewPass="";
     document.getElementById("txtNewPass").focus();
     return false;
	}	
}
</script>
<script type="text/javascript">

function Clear()
{
	txtOldPass="";
	txtNewPass="";
	txtReNewPass="";
	document.getElementById("txtOldPass").focus();
	}
	dojo.require("dijit.form.Button");
	
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

<form action="ChangePass" id="changepass" method="post" onsubmit="return CheckData();">


<div id="head"> <!-- This is the 1st div -> title -->
	<strong>Change Your Password</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. It is dynemically generated -->
	
	<center><%out.println("<h3>" + tempmsg + "</h3>");%></center>
	<table align="center" border="0" cellpadding="9" cellspacing="2">
		<tr>
			<td>
				<b><label style="font-size-adjust: inherit">Old Password</label></b>			
			</td>
			<td align="left">
			
			<input type="password" name="txtOldPass" id="txtOldPass"	
                dojoType="dijit.form.ValidationTextBox" 
                size="30" 
                promptMessage="Enter your Old Password.." />
                
               </td>
		</tr>
		
		<tr>
			<td>
				<b><label style="font-size-adjust: inherit" >New Password</label></b>
			</td>
			<td align="left"><input type="password" name="txtNewPass" id="txtNewPass"	
                dojoType="dijit.form.ValidationTextBox" 
                size="30" 
                promptMessage="Enter your New Password.." 
                /></td>
		</tr>
		     
		<tr>
			<td>
				<b><label style="font-size-adjust: inherit" >Confirm Password</label></b>
			</td>
			<td align="left"><input type="password" name="txtReNewPass" id="txtReNewPass"	
                dojoType="dijit.form.ValidationTextBox" 
                size="30" 
                promptMessage="Reenter your New Password.."/></td>
     		</tr>
     	</table>

    <table align="center">
			<tr>
            	<td>
  
         <input type="submit" name="btnSubmit" value="Submit" id="btnSubmit"/> &nbsp;&nbsp;&nbsp;&nbsp;
            	</td> <!-- This is the submit buttom -->
            	<td><input type="reset" name="btnReset" value="Reset" id="btnReset" onclick="Clear();"/>&nbsp;&nbsp;</td> <!-- This is the Reset buttom -->
            </tr>
	</table>
		
</div> <!-- End of 2nd div -->

<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->
</form>
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

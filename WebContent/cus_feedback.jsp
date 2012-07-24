<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Feedback</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>
<%
String Feedbackval="";
String Uname="";String abc = "";
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
//To Fetch the Complain Number

List CompNoList=Complaints.GetFeedback(session.getAttribute("Uname").toString());
if(CompNoList.equals(null))
{
session.setAttribute("msg","Sorry there are no Complaints fro which Feedback can be filled");
response.sendRedirect("MessagePage.jsp");
throw new ServletException("Sorry there are no Complaints fro which Feedback can be filled");
}
Iterator igroups=CompNoList.iterator();
session.setAttribute("Feed","Feedback Filled");

if( igroups.hasNext() )
	abc = "has";
else
	abc = "none";
%>
<script type="text/javascript">
function setFocus(id)
{
id.focus();
}

function CheckData()
{
if(document.getElementById("txtFeedback").value=="")
{
alert("Please Enter Feedback....");
document.getElementById("txtFeedback").focus();
return false;
}

if(document.getElementById("txtFCompNo").value=="Select")
{
alert("Please Select a Complain....");
return false;
}
if(document.getElementById("txtSatisfied").value=="No")
{
alert("You have Selected No, your Complain will be reassigned to some other employee by the administrator");
}
if(document.getElementById("ddlRating").value=="0")
{
alert("You have assigned a rating of 0 to the employee. Do u want to proceed with this.");
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
	<strong>Feedback </strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->
<% if( abc.equals("has") ) { %>
<form method="post" action="ComplaintSuccess?flag=F"  onsubmit="return CheckData()"> <!-- This is a form -->
	<table width="760" border="0">
		<tr>
    		<td width="150"><label for="compnoselect">Select the Complain Number for which you have to provide Feedback<h5></label></td>
            <td>
            <select name="txtFCompNo" id="txtFCompNo" size="1">
  				<option value="Select" selected="selected">Select</option>
  				
  				<% 
				while(igroups.hasNext())
				{
				 Complaints compno=(Complaints)igroups.next();
				 if(compno.equals(null))
	    			{
									
					 session.setAttribute("msg","Sorry there are no Complaints for which Feedback can be filled");
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
    		<td width="150"><label for="compnoselect">Are you Satisfied with the Service provided</label></td>
            <td>
            	<select name="txtSatisfied" id="txtSatisfied" size="1">
  				<option value="Yes" selected="selected">Yes</option>
  				<option value="No">No</option>
  				</select>    
            </td>
        </tr>
	
  		<tr>
    		<td width="150"><label for="Feedback">Feedback</label></td>
    		<td><textarea cols="70" rows="8" name="txtFeedback" id="txtFeedback" ></textarea> <!--address--></td>
  		</tr>
  		<tr>
    		<td width="150"><label for="empPerf">Please rate our employee on a scale of 1 to 10<h5>(This will help us improve our services)</h5></label></td>
            <td>
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="ddlRating" id="ddlRating" size="1">
            	<option value="0"selected="selected">0</option>
  				<option value="1">1</option>
				<option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
        	</select>
            </td>
  		</tr>
    </table>
    <center>
    <input name="btnRegister" type="submit" id="btnRegister" value="Submit" />
                <input name="btnReset" type="reset" id="btnReset" value="Reset" onclick="setFocus(document.getElementById('txtFeedback'))" />
    </center>
</form>
<% } else { %>
Sorry there are no Complaints for which Feedback can be filled
<% } %>
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,csd.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer Service Desk : Edit FAQ</title>
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
   if(!(UserType.GetRole(Uname)).equals("Administrator"))
   {
    session.setAttribute("msg","Sorry you are not authorized to view this Page...try..Re-Login...");
    response.sendRedirect("MessagePage.jsp");
   }
  }
 }
List serList= ComplainTypes.GetComplainType();
if(serList==null)
throw new ServletException("Sorry No Services to Display...");
Iterator igroups=serList.iterator();
%>
<script type="text/javascript">
function setFocus(id)
{
id.focus();
}
function CheckData()
{
if(document.getElementById("txtPtype").value=="")
{
alert("Please Enter Service..!");
document.getElementById("txtPtype").focus();
return false;
}

if(document.getElementById("txtPdesc").value=="")
{
alert("Please Enter its description....!");
document.getElementById("txtPdesc").focus();
return false;
}
chk=confirm("Do u want to Submit these Records..?");
if(chk==false)
return false;
}
function showMsg(msg) {
	if(msg == "") {
		document.getElementById('msg_div').innerHTML = msg;
		document.getElementById('msg_div').style.display = 'none';
	} else {
		document.getElementById('msg_div').innerHTML = msg;
		document.getElementById('msg_div').style.display = 'block';
	}
}
</script>
<script type="text/javascript" src='ajax.js'></script>
</head>
<body>
<table width="770" align="center">
  <tr>
    <td>
    
    <%@ include file="header.jsp"%>
    
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
	<strong>Insert Services</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->
<form  action="MiscSuccess?flag=InSER" method="post" onsubmit="return CheckData()"> <!-- This is a form -->
	<table width="760" border="0">
  		<tr>
    		<td width="150"><label for="ques">Service</label></td>
    		<td><input type="text" name="txtPtype" id="txtPtype" value=""/><!--user name--></td>
  		</tr>
  		<tr>
    		<td width="150"><label for="ans">Basic Discription</label></td>
    		<td><textarea cols="60" rows="5" name="txtPdesc" id="txtPdesc"></textarea> <!--address--></td>
  		</tr>
    </table>
    <center><input name="btnSubmit" type="submit" id="btnSubmit" value="Submit" />
                <input name="btnReset" type="reset" id="btnReset" value="Reset" onclick="setFocus(document.getElementById('txtPtype'))" />
                </center>
</form>
&nbsp;
</div> <!-- End of 2nd div -->

<div id="closer"> <!-- This is the 3rd div -> closer -->
</div> <!-- End of 3rd div -->

&nbsp;

<div id="head"> <!-- This is the 1st div -> title -->
	<strong>Edit Services</strong>
</div> <!-- End of 1st div -->

<div id="content"> <!-- This is the 2nd div -> Content. -->


<table width="760" border="1"> <!-- Table -->
  		<tr>
    		<td id="contentbold">&nbsp;Complain Types</td> 
    	</tr>
  		<%
		while(igroups.hasNext())
		{	
			ComplainTypes lpb=(ComplainTypes)igroups.next();
			%>
  		<tr>
 			<td>
    		  		<form action="" name="frm_<%=lpb.getComplainDesc()%>">
    		
    		
    		&nbsp;<b>Service Type</b> <input type="text" value="<%=lpb.getComplainType()%>" name="type" class="compdesc"/>
    		<input type="hidden" value="<%=lpb.getComplainType()%>" name="txttype" class="compdesc"/>
    			
    		<br>
    		
    		&nbsp;<b>Service Description : </b><%=lpb.getComplainDesc()%> 
    				<br><b>Enter new value : </b><textarea cols="60" rows="1" name="desc" class="compdesc"></textarea>
    			<div style="float: right;">
    				<input type="button" name="Update" value="Update" onclick="if(this.form.type.value != '' && this.form.desc.value != '') { showMsg(''); update_type_desc(this.form); } else showMsg('Invalid entries');" />
    				
    			</div>
    		    		</form>
    		
    		</td>
  		</tr>
  		<%
	}
	%>
	</table> <!-- End of table -->
	


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
<div id="msg_div" style="display: none; position: fixed; z-index: 1000; top: 0px; right: 0px; padding: 4px; background-color: #CC0000; color: white; font-weight: bold;"></div>
</body>
</html>

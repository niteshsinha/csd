<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	String Check1="",Check2="";
	
	Check1=session.getAttribute("CheckUname").toString();
 Check2=Users.GetUsers(request.getParameter("Check1"));
	if(Check2=="none")
	{
		
	}
	
	
	%>
<p>This is a popup.</p>


<input type="text" name="txtUserName" value="<%=Check1%>"
            	dojoType="dijit.form.ValidationTextBox"
            	trim="true"
				required="true" 
                size="30" 
                id="txtUserName"
                invalidMessage="The User Name is invalid" 
                promptMessage="Enter your User Name. (Maximum size 20)" 
                maxLength="20"
                regExp="[a-zA-Z0-9._]+"/>














</body>
<%
}catch(Exception e){out.println(e);}


%>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,csd.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
Iterator igroups=null;
List cusListName;
System.out.println(request.getParameter("txtSearchCusName").toString());
System.out.println(request.getParameter("ddlSearchType").toString());
	if((request.getParameter("txtSearchCusName")!=null)&&(request.getParameter("ddlSearchType")!=null))
	{
cusListName=Customers.GetCustomers(request.getParameter("txtSearchCusName").toString(),request.getParameter("ddlSearchType").toString());
if(cusListName==null)
throw new ServletException("Sorry No Records to Display...");
igroups=cusListName.iterator();
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table width="760" border="1">
  <tr align="center">
    <td width="127"><b>Customer Name</b></td>
    <td width="324"><b>Address</b></td>
    <td width="139"><b>Phone No</b></td>
    <td width="142"><b>Mobile No</b></td>
  </tr>
     <%
 	if((request.getParameter("txtSearchCusName")!=null)&&(request.getParameter("ddlSearchType")!=null))
 	{
 while(igroups.hasNext())
		{
		Customers cust=(Customers)igroups.next();

%>
  <tr>
    <td><a href="emp_cus_details.jsp">&nbsp;<%=cust.getCustomername()%></a></td>
    <td><%=cust.getAddressline1()%>&nbsp;<%=cust.getArea()%>&nbsp;<%=cust.getCity()%>
              &nbsp;<%=cust.getCountry()%></td>
    <td>&nbsp;<%=cust.getPhone()%></td>
    <td>&nbsp;<%=cust.getMobile()%></td>
  </tr>
  <%
	}
 	}
	%>
</table>

	
</body>
</html>
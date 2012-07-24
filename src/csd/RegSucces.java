package csd;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegSucces extends HttpServlet
{  
	
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");    	
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		try
		{
			if(request.getParameter("flag").equals("CU"))
			{
				
				if(Users.GetUsers(request.getParameter("txtUserName")).equals("none"))
				{
					session.setAttribute("CheckUser", "A");
				}
				else
					{
					session.setAttribute("CheckUser", "NA");
					}
				
	    		response.sendRedirect("temp.jsp");  

			}
			else
			{
			
			Customers cs=new Customers();          
    		cs.setUsername(request.getParameter("txtUserName"));
    		cs.setCustomername(request.getParameter("txtCustomerName"));
    		cs.setAddressline1(request.getParameter("txtAddressline1"));
    		cs.setArea(request.getParameter("txtArea"));
    		cs.setCity(request.getParameter("txtCity"));
    		cs.setCountry(request.getParameter("txtCountry"));
    		cs.setPhone(request.getParameter("txtPhoneNo"));
    		cs.setMobile(request.getParameter("txtMobileNo"));
    		cs.setEMail(request.getParameter("txtEmailId"));
    		cs.setRemarks(request.getParameter("txtRemark"));    		
    		out.println("Control was here");    		
    		if(request.getParameter("flag").equals("A"))
    		{	
    			if(Users.GetUsers(request.getParameter("txtUserName")).equals("none"))
    	    	{
    				Users us=new Users();
    				UserType uir=new UserType(); 
    				out.println("Users updated 1");
    				us.setUsername(request.getParameter("txtUserName")); 	  
    				out.println("User Name: " + request.getParameter("txtUserName"));
    				us.setpassword(request.getParameter("txtPassword"));
    				out.println("Password: "+ request.getParameter("txtPassword"));
    				uir.setUsername(request.getParameter("txtUserName"));
    				out.println("Users updated 4");
    				uir.setTypeName("Customer");
    				//out.println("Users updated 5");
    		
    				Users.Insert(us);
    				out.println("Users updated");
    			
    				UserType.Insert(uir);     
    			
    				//out.println("Userinrole updated");
    			
    				Customers.Insert(cs);
    			
    				out.println("Customers updated");
    			
    				session.setAttribute("msg","Thank you for registration,...Welcome " + request.getParameter("txtCustomerName"));
    				session.setAttribute("LogStatus","t");
    				session.setAttribute("Uname",request.getParameter("txtUserName"));	  
    	    	}
    			else
    	    	{
    				session.setAttribute("msg","Username already exist...");
    	    		response.sendRedirect("MessagePage.jsp");  
    	    	}
    		
    		}
			
    		else if(request.getParameter("flag").equals("M"))
    		{	 
    			cs.setUsername(session.getAttribute("Uname").toString());
    			Customers.Update(cs);        
    			session.setAttribute("msg","Record Successfully Updated...");
    		}          
    		response.sendRedirect("MessagePage.jsp");
		}
		}
		catch(Exception ex)
		{
			out.println(ex.toString());
		}	
	}
} 
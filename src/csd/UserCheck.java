package csd;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UserCheck extends HttpServlet
{  

	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");    	
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();          
		try
		{ 
			Users usr=Users.GetUsers(request.getParameter("txtUser"),request.getParameter("txtPass"));
			if(usr.getUsername().equals("none"))
			{
				session.setAttribute("msg","Invalid Username or Password...!!");
				response.sendRedirect("MessagePage.jsp");
			}
			else
			{
				//to make the search parameters null for the first loading
				session.setAttribute("searchpara",null );
				session.setAttribute("searchtype",null);
				
				session.setAttribute("LogStatus","t");
				session.setAttribute("Uname",request.getParameter("txtUser"));
				String rname=UserType.GetRole(request.getParameter("txtUser"));
				if(rname.equals("Customer"))
					response.sendRedirect("cus_home.jsp");
				if(rname.equals("Employee"))
					response.sendRedirect("emp_home.jsp");
				if(rname.equals("Administrator"))
					response.sendRedirect("admin_home.jsp");		
				else
				{
					session.setAttribute("msg","Invalid Username or Password...!!");
					response.sendRedirect("MessagePage.jsp");
				}
			}   
		}
       catch(Exception ex)
       {
    	   out.println(ex.toString());
       }
	}
}
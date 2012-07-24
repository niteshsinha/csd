package csd;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LogStatus extends HttpServlet
{  
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");    	
		PrintWriter out = response.getWriter();
		try
		{ 
			if(request.getParameter("ls").equals("f"))
			{
				response.sendRedirect("login.jsp");
			}
			else if(request.getParameter("ls").equals("t"))
			{
				HttpSession session=request.getSession(); 
				session.setAttribute("LogStatus","f");
				session.setAttribute("Uname","blank");
				response.sendRedirect("home.jsp");  
			}  
		}
		catch(Exception ex)
		{
			out.println(ex.toString());
		}
	}
}
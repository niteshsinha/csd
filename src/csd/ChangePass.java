package csd;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


 
public class ChangePass extends HttpServlet
{  

	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");    	
	    PrintWriter out = response.getWriter();
	    HttpSession session=request.getSession();      
	    
	    try
	    {
	     	Users usr=Users.GetUsers(session.getAttribute("Uname").toString(),request.getParameter("txtOldPass"));
	     	if(usr.getUsername().equals("none"))
	     	{
	     		session.setAttribute("msg","Invalid Old Password!!...Enter Again...!");
	     		response.sendRedirect("pass_change.jsp");  
	     	}
	     	else
	     	{
	     		Users ur=new Users();
	     		ur.setUsername(session.getAttribute("Uname").toString());
	     		ur.setpassword(request.getParameter("txtReNewPass"));
	     		Users.UpdatePass(ur);
	     		session.setAttribute("msg","Password successfully Updated...");
	     		response.sendRedirect("MessagePage.jsp");  
	     	}
	    }
	    catch(Exception ex)
	    {
	    	out.println(ex.toString());
	    }
	}
}

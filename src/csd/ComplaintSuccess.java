package csd;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.DateFormat;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class ComplaintSuccess extends HttpServlet
{  

	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");    	
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		try
		{          
			if(request.getParameter("flag").equals("F"))
			{	
				Feedback fee=new Feedback(); 
				fee.setFeedCompNo(Integer.parseInt(request.getParameter("txtFCompNo")));
				fee.setFeedContent(request.getParameter("txtFeedback"));
				fee.setRating(Integer.parseInt(request.getParameter("ddlRating")));
				Feedback.Insert(fee);
				Complaints cmp=new Complaints();
				if(request.getParameter("txtSatisfied").toString().equals("No"))
				cmp.setStatus("Pending");
				else
				cmp.setStatus("Resolved");
			
				cmp.setComplainNo(Integer.parseInt(request.getParameter("txtFCompNo")));
				cmp.setFeedback(session.getAttribute("Feed").toString());
				Complaints.UpdateFeed(cmp);
				session.setAttribute("msg","Record Successfully Inserted...");
				response.sendRedirect("MessagePage.jsp");
			}
			else if(request.getParameter("flag").equals("RC"))
			{
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy ");
				Date currentdate = new Date();
				System.out.println(dateFormat.format(currentdate));
				
				Complaints cmp=new Complaints();          
				cmp.setComplainNo(Complaints.GetMaxCompNo());

				cmp.setUsername(session.getAttribute("Uname").toString());          

				cmp.setComplainType(request.getParameter("ddlProblemType"));

				cmp.setComplainDesc(request.getParameter("txtProblem"));

				cmp.setAssignedEmployee(session.getAttribute("AssignEmp").toString());

				cmp.setPhone(request.getParameter("txtPhoneNo"));	


				cmp.setFeedback(session.getAttribute("Feed").toString());

				cmp.setReport(session.getAttribute("Rep").toString());

				cmp.setStatus(session.getAttribute("Sta").toString());	

				Complaints.Insert(cmp);
				session.setAttribute("msg","Record Successfully Inserted...");
				response.sendRedirect("MessagePage.jsp");
			}
			else if(request.getParameter("flag").equals("R"))
			{	
	
				Report ree=new Report(); 
				ree.setReportCompNo(Integer.parseInt(request.getParameter("txtRCompNo")));
				ree.setReportContent(request.getParameter("txtEReport"));
				Report.Insert(ree);
				if(request.getParameter("ddlCStatus").equals("Pending"))
				{
					FailedComplains fc=new FailedComplains();
					fc.setFailCompNo(Integer.parseInt(request.getParameter("txtRCompNo")));
					System.out.println(Integer.parseInt(request.getParameter("txtRCompNo")));
					FailedComplains.Insert(fc);
				}
				Complaints cmp=new Complaints();
				cmp.setComplainNo(Integer.parseInt(request.getParameter("txtRCompNo")));
				cmp.setReport(session.getAttribute("Rep").toString());
				cmp.setStatus(request.getParameter("ddlCStatus"));
				Complaints.UpdateRep(cmp);
				session.setAttribute("msg","Record Successfully Inserted...");
				response.sendRedirect("MessagePage.jsp");
			}
			else if(request.getParameter("flag").equals("AE"))
			{
				Complaints cmp=new Complaints();
				cmp.setComplainNo(Integer.parseInt(session.getAttribute("AECompNo").toString()));
				cmp.setAssignedEmployee(request.getParameter("ddlAssignEmp"));
				Complaints.UpEmpAssign(cmp);
				System.out.println("emp assigned");
				response.sendRedirect("admin_view_comp_pen.jsp");
			}
			else if(request.getParameter("flag").equals("FAE"))
			{
				Complaints cmp=new Complaints();
				cmp.setComplainNo(Integer.parseInt(session.getAttribute("FAECompNo").toString()));
				cmp.setAssignedEmployee(request.getParameter("ddlAssignFEmp"));
				Complaints.UpFailedEmpAssign(cmp);
				System.out.println("emp reassigned");
				response.sendRedirect("admin_view_comp_pen.jsp");
			}
		}
		catch(Exception ex)
		{
			out.println(ex.toString());
		}
	}
} 

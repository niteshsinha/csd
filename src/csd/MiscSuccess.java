package csd;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.catalina.tribes.transport.SenderState;

import java.sql.*;

public class MiscSuccess extends HttpServlet
{  

	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");    	
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		try
		{          
			if(request.getParameter("flag").equals("InFAQ"))
			{	
				FAQ fa=new FAQ(); 
				fa.setFaqQues(request.getParameter("txtQues"));
				fa.setFaqAns(request.getParameter("txtAns"));
				FAQ.Insert(fa);
				session.setAttribute("msg","Record Successfully Inserted...");
				response.sendRedirect("MessagePage.jsp");
			}
			else if(request.getParameter("flag").equals("UpFAQ"))
			{	
				FAQ fa=new FAQ(); 
				//fa.setFaqOldQues(session.getAttribute("txtOldQues").toString());
				//System.out.println(session.getAttribute("txtOldQues").toString());
				fa.setFaqOldQues(request.getParameter("oldques").toString());				
				fa.setFaqQues(request.getParameter("txtQuesUp"));
				fa.setFaqAns(request.getParameter("txtAnsUp"));
				FAQ.Update(fa);
				session.setAttribute("msg","Record Successfully Updated...");
				response.sendRedirect("MessagePage.jsp");
			}
			else if(request.getParameter("flag").equals("InSER"))
			{
				Services se=new Services();          
				se.setServ(request.getParameter("txtPtype"));
				Services.Insert(se);
				ComplainTypes pb=new ComplainTypes();
				pb.setComplainType(request.getParameter("txtPtype"));
				pb.setComplainDesc(request.getParameter("txtPdesc"));
				ComplainTypes.Insert(pb);
				session.setAttribute("msg","Record Successfully Inserted...");
				response.sendRedirect("MessagePage.jsp");
			}
			else if(request.getParameter("flag").equals("UpSER"))
			{	Services se=new Services();
				se.setOldServ(request.getParameter("txtOldCType"));
				se.setServ(request.getParameter("txtPtype"));
				Services.Update(se);
				ComplainTypes pb=new ComplainTypes();
				pb.setOldComplainType(request.getParameter("txtOldCType"));
				pb.setComplainType(request.getParameter("txtPtype"));
				pb.setComplainDesc(request.getParameter("txtPdesc"));
				ComplainTypes.Update(pb);
				session.setAttribute("msg","Record Successfully Updated...");
				response.sendRedirect("MessagePage.jsp");
			}
			else if(request.getParameter("flag").equals("R"))
			{	
				Report ree=new Report(); 
				ree.setReportCompNo(Integer.parseInt(request.getParameter("txtRCompNo")));
				ree.setReportContent(request.getParameter("txtEReport"));
				Report.Insert(ree);
				Complaints cmp=new Complaints();
				cmp.setComplainNo(Integer.parseInt(request.getParameter("txtRCompNo")));
				cmp.setReport(session.getAttribute("Rep").toString());
				cmp.setStatus(request.getParameter("ddlCStatus"));
				Complaints.UpdateRep(cmp);	
			}
			else if(request.getParameter("flag").equals("SE"))
			{	
				session.setAttribute("searchpara",request.getParameter("txtSearchCusName") );
				session.setAttribute("searchtype",request.getParameter("ddlSearchType"));
				System.out.println(session.getAttribute("searchpara"));
				System.out.println(session.getAttribute("searchtype"));

					response.sendRedirect("emp_view_cus_profile.jsp"); 
			}
		}
		catch(Exception ex)
		{
			out.println(ex.toString());
		}
	}
}
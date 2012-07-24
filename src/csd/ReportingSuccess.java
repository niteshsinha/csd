package csd;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.InputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.OutputStream;
import java.io.ByteArrayOutputStream;
 
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Date;
import java.util.Calendar;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.swing.JFrame;
 
import java.sql.*;
 
import net.sf.jasperreports.view.JRViewer;
import net.sf.jasperreports.view.JasperViewer;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import java.util.HashMap;
 
import org.apache.catalina.connector.Response;
import org.apache.catalina.startup.Embedded;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.jasper.EmbeddedServletOptions;

import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;
 
 
public class ReportingSuccess extends HttpServlet {
 
public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
        
}
public HttpSession session;

public void processRequest(HttpServletRequest req,HttpServletResponse res)
{
	String sendpath="";
	 session=req.getSession();
	HashMap<Object,Object> mp=new HashMap<Object,Object>();

	JasperPrint jasperPrint=new JasperPrint();
try{
 // This is the code for Date-wise Complains for All , Pending , InProcess and resolved ones.
	if(req.getParameter("flag").equals("CGDate"))
	{	
		Date Comp_GivenDate =new Date();
		DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		if(req.getParameter("txtComp_GivenDate").toString().equals(""))
		{
			session.setAttribute("msg","Please Enter a Valid Date...");
	    	res.sendRedirect("MessagePage.jsp");
		}
		Comp_GivenDate=dateFormat.parse(req.getParameter("txtComp_GivenDate").toString());
		mp.put("Comp_GivenDate",Comp_GivenDate);
		if(req.getParameter("ddlComp_GivenStatus_Date").equals("All"))
		{
	        sendpath="c:\\Reports\\Comp_GivenDate.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Date").equals("Pending"))
		{
	        sendpath="c:\\Reports\\Pending_Comp_GivenDate.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Date").equals("Process"))
		{
	        sendpath="c:\\Reports\\Process_Comp_GivenDate.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Date").equals("Resolved"))
		{
	        sendpath="c:\\Reports\\Resolved_Comp_GivenDate.jrxml";
		}
        jasperPrint = returnReportPrint(mp,sendpath);
	    if(jasperPrint.getPages().isEmpty())
        {
	  	session.setAttribute("msg","No report available for this input...");
    	res.sendRedirect("MessagePage.jsp");  
        }
		
	}
	else if(req.getParameter("flag").equals("CGYear"))
	{
		int Comp_GivenYear=Integer.parseInt(req.getParameter("txtComp_GivenYear").toString());
		System.out.println(Comp_GivenYear);
        mp.put("Comp_GivenYear",Comp_GivenYear);
        if(req.getParameter("ddlComp_GivenStatus_Year").equals("All"))
		{
	        sendpath="c:\\Reports\\Comp_GivenYear.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Year").equals("Pending"))
		{
	        sendpath="c:\\Reports\\Pending_Comp_GivenYear.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Year").equals("Process"))
		{
	        sendpath="c:\\Reports\\Process_Comp_GivenYear.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Year").equals("Resolved"))
		{
	        sendpath="c:\\Reports\\Resolved_Comp_GivenYear.jrxml";
		}
        jasperPrint = returnReportPrint(mp,sendpath);
	    if(jasperPrint.getPages().isEmpty())
        {
	  	session.setAttribute("msg","No report available for this input...");
    	res.sendRedirect("MessagePage.jsp");  
        }   
	}
	else if(req.getParameter("flag").equals("CGWeek"))
	{
		int Comp_GivenWeek=0;
		mp.put("Comp_GivenWeek",Integer.parseInt(req.getParameter("txtComp_GivenWeek")));
		if(req.getParameter("ddlComp_GivenStatus_Week").equals("All"))
		{
	        sendpath="c:\\Reports\\Comp_LastWeek.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Week").equals("Pending"))
		{
	        sendpath="c:\\Reports\\Pending_LastWeek.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Week").equals("Process"))
		{
	        sendpath="c:\\Reports\\Process_LastWeek.jrxml";
		}
		else if(req.getParameter("ddlComp_GivenStatus_Week").equals("Resolved"))
		{
	        sendpath="c:\\Reports\\Resolved_LastWeek.jrxml";
		}
        jasperPrint = returnReportPrint(mp,sendpath);
	    if(jasperPrint.getPages().isEmpty())
        {
	  	session.setAttribute("msg","No report available for this input...");
    	res.sendRedirect("MessagePage.jsp");  
        }
	}    
	    else if(req.getParameter("flag").equals("CGMonth"))
		{
			int Comp_GivenMonth=0;
			int Comp_GivenYear=0;
			mp.put("Comp_GivenYear",Integer.parseInt(req.getParameter("ddlComp_GivenYear")));
			mp.put("Comp_GivenMonth",Integer.parseInt(req.getParameter("ddlComp_GivenMonth")));
			if(req.getParameter("ddlComp_GivenStatus_Month").equals("All"))
			{
		        sendpath="c:\\Reports\\Comp_GivenYearMonth.jrxml";
			}
			else if(req.getParameter("ddlComp_GivenStatus_Month").equals("Pending"))
			{
		        sendpath="c:\\Reports\\Pending_Comp_GivenYearMonth.jrxml";
			}
			else if(req.getParameter("ddlComp_GivenStatus_Month").equals("Process"))
			{
		        sendpath="c:\\Reports\\Process_Comp_GivenYearMonth.jrxml";
			}
			else if(req.getParameter("ddlComp_GivenStatus_Month").equals("Resolved"))
			{
		        sendpath="c:\\Reports\\Resolved_Comp_GivenYearMonth.jrxml";
			}
	        jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	    else if(req.getParameter("flag").equals("Uwise"))
		{	
			mp.put("",null);
			if(req.getParameter("UserWise").equals("Cus"))
			{
		        sendpath="c:\\Reports\\Cus_RegisteredComp.jrxml";
			}
			else if(req.getParameter("UserWise").equals("Emp"))
			{
		        sendpath="c:\\Reports\\Emp_AssignedComp.jrxml";
			}
	        jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	    else if(req.getParameter("flag").equals("LU"))
		{	
			mp.put("",null);
			if(req.getParameter("ListUsers").equals("LCus"))
			{
		        sendpath="c:\\Reports\\List_Customers.jrxml";
			}
			else if(req.getParameter("ListUsers").equals("LEmp"))
			{
		        sendpath="c:\\Reports\\List_Employees.jrxml";
			}
	        jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
		
	    else if(req.getParameter("flag").equals("ECD"))
		{
	    	mp.put("Cus_Customername",session.getAttribute("CusNameSR").toString());
			sendpath="c:\\Reports\\CusDetails_GivenCustomername.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	    else if(req.getParameter("flag").equals("CUS"))
		{
	    	mp.put("Cus_GivenUsername",session.getAttribute("Uname").toString());
			sendpath="c:\\Reports\\CompDetails_GivenUsername.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
		
	    else if(req.getParameter("flag").equals("EMP"))
		{
	    	mp.put("Emp_GivenUsername",session.getAttribute("Uname").toString());
			sendpath="c:\\Reports\\Emp_CompDetails_GivenUsername.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	
	    else if(req.getParameter("flag").equals("EVCD"))
		{
	    	mp.put("Emp_GivenCompNo",Integer.parseInt(session.getAttribute("EVCompNo").toString()));
			sendpath="c:\\Reports\\Emp_CompDetails_GivenCompNo.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	
	    else if(req.getParameter("flag").equals("AECD"))
		{
	    	if(session.getAttribute("TypeSR").toString().equals("Customer"))
	    	{
	    		mp.put("Cus_Customername",session.getAttribute("NameSR").toString());
	    		sendpath="c:\\Reports\\CusDetails_GivenCustomername.jrxml";
	    		System.out.println(session.getAttribute("TypeSR").toString());
	    	}
	    	else
	    	{
	    		mp.put("Emp_Employeename",session.getAttribute("NameSR").toString());
	    		sendpath="c:\\Reports\\EmpDetails_GivenEmployeename.jrxml";
	    		System.out.println(session.getAttribute("TypeSR").toString());
	    		System.out.println(session.getAttribute("NameSR").toString());
	    	}
	    		jasperPrint = returnReportPrint(mp,sendpath);
	    		if(jasperPrint.getPages().isEmpty())
	    		{
	    			session.setAttribute("msg","No report available for this input...");
	    			res.sendRedirect("MessagePage.jsp");  
	    		}
		}
	
	
	    else if(req.getParameter("flag").equals("ADR"))
		{
	    	mp.put("Comp_GivenCompNo",Integer.parseInt(session.getAttribute("ADReport").toString()));
			sendpath="c:\\Reports\\DetailReport_GivenCompNo.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	    else if(req.getParameter("flag").equals("ADF"))
		{
	    	mp.put("Comp_GivenCompNo",Integer.parseInt(session.getAttribute("ADFeedback").toString()));
			sendpath="c:\\Reports\\DetailFeedback_GivenCompNo.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	
	
	    else if(req.getParameter("flag").equals("ACD"))
		{
	    	mp.put("Ad_CompDetails_GivenCompNo",Integer.parseInt(session.getAttribute("ADECompNo").toString()));
			sendpath="c:\\Reports\\Ad_CompDetails_GivenCompNo.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	    else if(req.getParameter("flag").equals("C1"))
		{
	    	mp.put("",null);
			sendpath="c:\\Reports\\Chart_No_vs_ComplainType.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	    else if(req.getParameter("flag").equals("C2"))
		{
	    	mp.put("Emp_GivenEmployeename","Emp");
			sendpath="c:\\Reports\\Chart_Comp_Res_Pen_GivenEmployeename.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
	    else if(req.getParameter("flag").equals("C3"))
		{
	    	mp.put("",null);
			sendpath="c:\\Reports\\Chart_Comp_DiffSector_GivenEmpUsername.jrxml";
			jasperPrint = returnReportPrint(mp,sendpath);
		    if(jasperPrint.getPages().isEmpty())
	        {
		  	session.setAttribute("msg","No report available for this input...");
	    	res.sendRedirect("MessagePage.jsp");  
	        }
		}
		   // DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		    					//Date Comp_GivenDate =new Date();

		    					//Comp_GivenDate=dateFormat.parse("27/01/2009");
		// int Comp_GivenDate=2009;
		// String Comp_Status="Pending";
		 					//System.out.println(dateFormat.format( Comp_GivenDate));
		    				//Comp_GivenDate=(Date)(27/01/2009);
		  // String UNAME="";
		 //   HashMap<Object,Object> mp=new HashMap<Object,Object>();
         //   mp.put("Comp_GivenYear",Comp_GivenDate);
         //   mp.put("Comp_Status",Comp_Status);

		   // JasperPrint jasperPrint = returnReportPrint(mp);
 
		    	// res.setContentType("text/html");
		   // PrintWriter out = res.getWriter();
		    	
		    		
		    		ServletOutputStream out1 = res.getOutputStream();
		    		try
		    {
		    					// create a bytearrayoutputstream object
		    		ByteArrayOutputStream baos =new ByteArrayOutputStream();

		    					//set the content type for the response as pdf
		    		res.setContentType("application/pdf");
		    					//fill the outputstream object baos with jPrint object
		    		JasperExportManager.exportReportToPdfStream(jasperPrint,baos);
		    					//set the content size for the output file (pdf)
		    		res.setContentLength(baos.size());
		    					//write the exported outputstream to the servlet outputstream
		    		baos.writeTo(out1);
		    		out1.close();

		    		}catch(Exception e){System.out.println("Error " + e.getMessage());}
		    							//JRHtmlExporter exporter = new JRHtmlExporter();
		    							// exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		    							// exporter.setParameter(JRExporterParameter.OUTPUT_WRITER,out);
	                 
		    							//exporter.exportReport();
 
		    							//  out.close();
	 
		    		

		    		}catch(Exception e){
		    	    	System.out.println("Error " + e.getMessage());
			    		
		    		}
}

 

 
    /**
     * Takes 4 parameters: databaseName, userName, password, inputstream
     * and connects to the database and prepares the report.
     * @param databaseName holds database name,
     * @param userName holds user name
     * @param password holds password to connect the database,
     * @param inputstream holds the stream of the Jasper Report file (.jrxml)
     * @return jasperReport holds the jasperReport variable that will be used to export an HTML report
     */
		dbClass obj =new dbClass();
    public JasperPrint returnReportPrint(HashMap<Object,Object> map,String path) {
	JasperPrint jasperPrint = null;
        try{
            JasperDesign jasperDesign = JRXmlLoader.load(path);
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
            Connection jdbcConnection = obj.dbConnection();
            //Connection jdbcConnection = connectDB("CSDDB", "Workspace", "nitesh");
            jasperPrint = JasperFillManager.fillReport(jasperReport, map, jdbcConnection);
            System.out.println("NItesh");
        }catch(Exception ex) {
            String connectMsg = "Could not create the report stream " + ex.getMessage() + " " + ex.getLocalizedMessage();
            System.out.println(connectMsg);
        }	
        return jasperPrint;
    }
 
 
    
 
}
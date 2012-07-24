package csd;

import java.sql.*;
import java.util.*;
import java.util.Date;

public class Report
{
	private String ReportCo="";
	private int rcompno;
	private Date RDate;

	public void setReportContent(String input)
	{
		ReportCo=input;
	}

	public String getReportContent()
	{
		return ReportCo;
	}
	
	public void setReportCompNo(int input)
	{
		rcompno=input;
	}

	public int getReportCompNo()
	{
		return rcompno;
	}
	
	public Date getReportingDate()
	{
		return RDate;
	}
	
	public void setReportingDate(Date input)
	{
		RDate=input;
	}
	
	public static List GetReportVal() throws Exception
    {
		dbClass db=new dbClass();
        List listService=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.Report",false);        
        while(rs.next())
        {
        	Report ur=new Report();
        	ur.setReportContent(rs.getString(1));
        	ur.setReportCompNo(rs.getInt(2));
        	listService.add(ur); 	
        }
        rs.close();
        return listService;        
    }
	
	public static void Insert(Report ur) throws Exception
	{  
		dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[1]=ur.getReportContent();
		parameter[0]=ur.getReportCompNo();
		db.ExecuteParamQuery("insert into WORKSPACE.Report values(?,?,CURRENT DATE,DEFAULT)",parameter);
	}
	
	public static Report GetRep(int rcompno) throws Exception
	{
		dbClass db=new dbClass();
		ResultSet rs=db.getData("Select * from WORKSPACE.Report where COMPLAINNO="+ rcompno ,false);
		Report ur=new Report();
		if(rs.next())
		{      
			ur.setReportContent(rs.getString(2));
			ur.setReportingDate(rs.getDate(3));
		}
		else
		{
			ur.setReportContent("none");
		}
		rs.close();
		return ur;     
	} 
}
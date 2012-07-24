package csd;

import java.sql.*;
import java.util.*;
import java.text.DateFormat;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class Complaints
{
	private String Uname = "" ;
	private String Cname = "" ;
	private String Ptype = "" ;
	private String Pdesc = "" ;
	private String Compper = "" ;
	private Date CompDT  ;
	private String Feed = "" ;
	private String Sta = "" ;
	private String Rep = "" ;
	private int intcompno = 0 ;
	private String intpho =  "";
	
	public void setUsername(String input)
	{
		Uname=input;
	}

	public String getUsername()
	{
		return Uname;
	}
	public void setCustomername(String input)
	{
		Cname=input;
	}

	public String getCustomername()
	{
		return Cname;
	}

	public void setComplainType(String input)
	{
		Ptype=input;
	}

	public String getComplainType()
	{
		return Ptype;
	}

	public void setComplainDesc(String input)
    {
        Pdesc=input;
    }

    public String getComplainDesc()
    {
        return Pdesc;
    }
	
	public void setAssignedEmployee(String input)
    {
        Compper=input;
    }

    public String getAssignedEmployee()
    {
        return Compper;
    }
	
	public void setCompDateTime(Date input)
    {
        CompDT=input;
    }

    public Date getCompDateTime()
    {
        return CompDT;
    }
	
	public void setPhone(String input)
    {
        intpho=input;
    }

    public String getPhone()
    {
        return intpho;
    }
	
	public void setComplainNo(int input)
    {
        intcompno=input;
    }

    public int getComplainNo()
    {
        return intcompno;
    }
	
	public void setFeedback(String input)
	{
		Feed=input;
	}

	public String getFeedback()
	{
		return Feed;
	}
	
	public void setStatus(String input)
	{
		Sta=input;
	}

	public String getStatus()
	{
		return Sta;
	}
	
	public void setReport(String input)
	{
		Rep=input;
	}

	public String getReport()
	{
		return Rep;
	}
	
	public static int GetMaxCompNo() throws Exception
    {      
      dbClass db=new dbClass();
      return db.GetMaxId("COMPLAINNO","WORKSPACE.Complains", 1, 1);
    }

    public static void UpdateStatus(String status,int compno) throws Exception
    {
      dbClass db=new dbClass();
      db.ExecuteNonQuery("update WORKSPACE.Complains set Status='" + status + "' where ComplainNo=" + compno + "");
    }
	
    public static List GetComplaints(int start_limit, int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
        List listComplaints=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains WHERE ROW_NEXT BETWEEN "+start_limit+" and "+stop_limit,false);        
        while(rs.next())
        {
        	Complaints ur=new Complaints();
        	ur.setComplainNo(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
        	ur.setComplainType(rs.getString(3));
        	ur.setComplainDesc(rs.getString(4));
        	ur.setAssignedEmployee(rs.getString(5));
        	ur.setPhone(rs.getString(6));
        	ur.setCompDateTime(rs.getDate(7));
        	ur.setStatus(rs.getString(8));
        	ur.setFeedback(rs.getString(9));
        	ur.setReport(rs.getString(10));
		
        	listComplaints.add(ur); 
        }
        rs.close();
        return listComplaints;        
    }

    // for a number of complains of a Customer
    public static List GetComplaints(String Uname, int start_limit, int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
        List listComplaints=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("SELECT * FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where Username='"+ Uname +"') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);        
        while(rs.next())
        {
        	Complaints ur=new Complaints();
        	ur.setComplainNo(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
    	    ur.setComplainType(rs.getString(3));
    	    ur.setComplainDesc(rs.getString(4));
    	    ur.setAssignedEmployee(rs.getString(5));
    	    ur.setPhone(rs.getString(6));
    	    ur.setCompDateTime(rs.getDate(7));
    	    ur.setStatus(rs.getString(8));
    	    ur.setFeedback(rs.getString(9));
    	    ur.setReport(rs.getString(10));
    	
    	    listComplaints.add(ur); 
        }
        rs.close();
        return listComplaints;        
    }
    
    // Number of complaints
    public static int GetNumberOfComplaints(String Uname, int start_limit, int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
	    int num_complaints = 0;
	    ResultSet rs=db.getData("SELECT MAX(ROW_NEXT) FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where Username='"+ Uname +"') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);        
        while(rs.next())
        {
        	num_complaints = rs.getInt(1);
        }
        rs.close();
        return num_complaints;        
    }

    public static Complaints GetComplaint(String Uname) throws Exception
    {
    	dbClass db=new dbClass();
    	ResultSet rs=db.getData("Select * from WORKSPACE.Complains where Username='"+ Uname +"'",false);
    	Complaints ur=new Complaints();
    	if(rs.next())
    	{      
    		ur.setComplainNo(rs.getInt(1));
    		ur.setUsername(rs.getString(2));
    		ur.setComplainType(rs.getString(3));
    		ur.setComplainDesc(rs.getString(4));
    		ur.setAssignedEmployee(rs.getString(5));
    		ur.setPhone(rs.getString(6));
    		ur.setCompDateTime(rs.getDate(7));
    		ur.setStatus(rs.getString(8));
    		ur.setFeedback(rs.getString(9));
    		ur.setReport(rs.getString(10));
    	}
    	else
    	{
    		ur.setUsername("none");
    	}
    	rs.close();
    	return ur;     
    } 


    public static void Insert(Complaints ur) throws Exception
    {  
    	dbClass db = new dbClass();
        Object parameter[]=new Object[9];
        parameter[0]=ur.getComplainNo();
        parameter[1]=ur.getUsername();
		parameter[2]=ur.getComplainType();
		parameter[3]=ur.getComplainDesc();
		parameter[4]=ur.getAssignedEmployee();
		parameter[5]=ur.getPhone();
		//Parameter[6]=ur.getCompDateTime();
		parameter[6]=ur.getStatus();
		parameter[7]=ur.getFeedback();
		parameter[8]=ur.getReport();
		
		db.ExecuteParamQuery("insert into WORKSPACE.Complains values(?,?,?,?,?,?,CURRENT DATE,?,?,?)",parameter);
    }

    public static void Update(Complaints ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[10];
        parameter[0]=ur.getUsername();
        parameter[1]=ur.getComplainNo();
        parameter[2]=ur.getComplainType();
        parameter[3]=ur.getComplainDesc();
        parameter[4]=ur.getAssignedEmployee();
        parameter[5]=ur.getPhone();
        parameter[6]=ur.getCompDateTime();
        parameter[7]=ur.getFeedback();
        parameter[8]=ur.getStatus();
        parameter[9]=ur.getReport();
        
        db.ExecuteParamQuery("update WORKSPACE.Complains set Username=?,ComplainNo=?,ComplainType=?,ComplainDesc=?,CompPerson=?,Phone=?,CompDateTime=?,Feedback=?,Status=?,Report=? where Username=?",parameter);
    }
    
    // To get the no of complains for which feedback has to be filled
    public static List GetFeedback(String Uname) throws Exception
    {
    	dbClass db=new dbClass();
    	List listCompNo=Collections.synchronizedList(new ArrayList());
    	ResultSet rs=db.getData("Select ComplainNo from WORKSPACE.Complains where Username='"+ Uname +"' AND Status='Resolved' AND Feedback='Not Filled'"  ,false);        
        while(rs.next())
        {
              Complaints ur=new Complaints();
              ur.setComplainNo(rs.getInt(1));
              //ur.setUsername(rs.getString(2));
              //ur.setComplainType(rs.getString(3));
              //ur.setComplainDesc(rs.getString(4));
              //ur.setAssignedEmployee(rs.getString(5));
              //ur.setPhone(rs.getInt(6));
              //ur.setCompDateTime(rs.getDate(7));
              //ur.setStatus(rs.getString(8));
              //ur.setFeedback(rs.getString(9));
              //ur.setReport(rs.getString(10));
              listCompNo.add(ur); 
        }
        rs.close();
        return listCompNo;        
    }

    public static void UpdateFeed(Complaints ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[3];
        parameter[2]=ur.getComplainNo();
        parameter[0]=ur.getFeedback();
        parameter[1]=ur.getStatus();
        db.ExecuteParamQuery("update WORKSPACE.Complains set Feedback=?,Status=? where ComplainNo=?",parameter);

    }

    public static List GetReport(String EmpUname) throws Exception
    {
    	dbClass db=new dbClass();
    	List listCompNo=Collections.synchronizedList(new ArrayList());
    	ResultSet rs=db.getData("Select ComplainNo from WORKSPACE.Complains where ASSIGNEDEMPLOYEE='"+ EmpUname +"' AND Report='Not Filed'"  ,false);        
        while(rs.next())
        {
        	Complaints ur=new Complaints();
        	ur.setComplainNo(rs.getInt(1));
        	listCompNo.add(ur); 
        }
        rs.close();
        return listCompNo;        
    }    
    
    //to update report
    public static void UpdateRep(Complaints ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[3];
        parameter[2]=ur.getComplainNo();
        parameter[0]=ur.getReport();
        parameter[1]=ur.getStatus();
        db.ExecuteParamQuery("update WORKSPACE.Complains set Report=?,Status=? where ComplainNo=?",parameter);
    }

    //to update employee assigned by the administrator
    public static void UpEmpAssign(Complaints ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[1]=ur.getComplainNo();
        parameter[0]=ur.getAssignedEmployee();
        db.ExecuteParamQuery("update WORKSPACE.Complains set AssignedEmployee=? where ComplainNo=?",parameter);
    }
    //to reassign a complain to NEW employee by the administrator
    public static void UpFailedEmpAssign(Complaints ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[1]=ur.getComplainNo();
        parameter[0]=ur.getAssignedEmployee();
        db.ExecuteParamQuery("update WORKSPACE.Complains set AssignedEmployee=?,report='Not Filed',feedback='Not Filled' where ComplainNo=?",parameter);
    }
    
    
    // for admin to view report
    public static List ViewReports(int start_limit,int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
    	List listComplaints=Collections.synchronizedList(new ArrayList());
    	ResultSet rs=rs=db.getData("SELECT * FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where Report='Report Filed') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);
        while(rs.next())
        {
              Complaints ur=new Complaints();
              ur.setComplainNo(rs.getInt(1));
              ur.setUsername(rs.getString(2));
              ur.setComplainType(rs.getString(3));
              ur.setComplainDesc(rs.getString(4));
              ur.setAssignedEmployee(rs.getString(5));
              ur.setPhone(rs.getString(6));
              ur.setCompDateTime(rs.getDate(7));
              ur.setStatus(rs.getString(8));
              ur.setFeedback(rs.getString(9));
              ur.setReport(rs.getString(10));
              listComplaints.add(ur); 
        }
        rs.close();
        return listComplaints;        
    }
    
    // to get details of a particular report
    public static Complaints GetRepDetail(int repno) throws Exception
    {
    	dbClass db=new dbClass();
    	ResultSet rs=db.getData("Select * from WORKSPACE.Complains where ComplainNo=" + repno  ,false);
    	Complaints ur=new Complaints();
    	if(rs.next())
    	{      
    		ur.setComplainNo(rs.getInt(1));
    		ur.setUsername(rs.getString(2));
    		ur.setComplainType(rs.getString(3));
    		ur.setComplainDesc(rs.getString(4));
    		ur.setAssignedEmployee(rs.getString(5));
    		ur.setPhone(rs.getString(6));
    		ur.setCompDateTime(rs.getDate(7));
    		ur.setStatus(rs.getString(8));
    		ur.setFeedback(rs.getString(9));
    		ur.setReport(rs.getString(10));
    	}
    	else
    	{
    		ur.setUsername("none");
    	}
    	rs.close();
    	return ur;     
    } 
 
    // for admin to view feedback
    public static List ViewFeeds(int start_limit,int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
        List listComplaints=Collections.synchronizedList(new ArrayList());
        ResultSet rs=rs=db.getData("SELECT * FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where Feedback='Feedback Filled') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);
        while(rs.next())
        {
        	Complaints ur=new Complaints();
        	ur.setComplainNo(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
        	ur.setComplainType(rs.getString(3));
        	ur.setComplainDesc(rs.getString(4));
        	ur.setAssignedEmployee(rs.getString(5));
        	ur.setPhone(rs.getString(6));
        	ur.setCompDateTime(rs.getDate(7));
        	ur.setStatus(rs.getString(8));
        	ur.setFeedback(rs.getString(9));
        	ur.setReport(rs.getString(10));
        	listComplaints.add(ur); 
        }
        rs.close();
        return listComplaints;        
    }
    
    public static List GetComplaints(int para,int start_limit, int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
    	List listComplaints=Collections.synchronizedList(new ArrayList());
    	ResultSet rs;
    	if(para==1)	
    	{
    		rs=db.getData("SELECT * FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where Status='Pending' AND AssignedEmployee='Unassigned') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);    	
    	}
    	else if(para==2)
    	{
    		rs=db.getData("SELECT * FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where Status='Resolved') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);	
    	}
    	else
    	{
    		rs=db.getData("SELECT * FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where Status='Pending' AND Not AssignedEmployee='Unassigned') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);
    		
    	}	
    	if(rs!=null)
    	{
    		while(rs.next())
    		{
    			Complaints ur=new Complaints();
    			ur.setComplainNo(rs.getInt(1));
    			ur.setUsername(rs.getString(2));
    			ur.setComplainType(rs.getString(3));
    			ur.setComplainDesc(rs.getString(4));
    			ur.setAssignedEmployee(rs.getString(5));
    			ur.setPhone(rs.getString(6));
    			ur.setCompDateTime(rs.getDate(7));
    			ur.setStatus(rs.getString(8));
    			ur.setFeedback(rs.getString(9));
    			ur.setReport(rs.getString(10));
    			listComplaints.add(ur); 
    		}
    		rs.close();
    		return listComplaints;        
    	}
     	else
     	{
     		return null;
     	}
	
    }
 // for processing of failed complains
    public static List GetFailedComplaints(int start_limit, int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
    	List listComplaints=Collections.synchronizedList(new ArrayList());
    	ResultSet rs;
    	
    		rs=db.getData("SELECT * FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where Status='Pending' AND report='Report Filed') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);    	
    	
    	if(rs!=null)
    	{
    		while(rs.next())
    		{
    			Complaints ur=new Complaints();
    			ur.setComplainNo(rs.getInt(1));
    			ur.setUsername(rs.getString(2));
    			ur.setComplainType(rs.getString(3));
    			ur.setComplainDesc(rs.getString(4));
    			ur.setAssignedEmployee(rs.getString(5));
    			ur.setPhone(rs.getString(6));
    			ur.setCompDateTime(rs.getDate(7));
    			ur.setStatus(rs.getString(8));
    			ur.setFeedback(rs.getString(9));
    			ur.setReport(rs.getString(10));
    			listComplaints.add(ur); 
    		}
    		rs.close();
    		return listComplaints;        
    	}
     	else
     	{
     		return null;
     	}
	
    }
    
    
    
    
    // for employee to view his complains
    public static List GetComplaintsemp(String Uname,int start_limit, int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
    	List listComplaints=Collections.synchronizedList(new ArrayList());
    	ResultSet rs=db.getData("SELECT * FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where AssignedEmployee='"+ Uname +"') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);  
    	
        while(rs.next())
        {
        	Complaints ur=new Complaints();
        	ur.setComplainNo(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
        	ur.setComplainType(rs.getString(3));
        	ur.setComplainDesc(rs.getString(4));
        	ur.setAssignedEmployee(rs.getString(5));
        	ur.setPhone(rs.getString(6));
        	ur.setCompDateTime(rs.getDate(7));
        	ur.setStatus(rs.getString(8));
        	ur.setFeedback(rs.getString(9));
        	ur.setReport(rs.getString(10));
    	    listComplaints.add(ur); 
        }
        rs.close();
        return listComplaints;        
    }
 // Number of complaints For Employee
    public static int GetNumberOfComplaintsForEmp(String Uname, int start_limit, int stop_limit) throws Exception
    {
    	dbClass db=new dbClass();
	    int num_complaints = 0;
	    ResultSet rs=db.getData("SELECT MAX(ROW_NEXT) FROM (Select WORKSPACE.Complains.*, rownumber() OVER (ORDER BY WORKSPACE.Complains.ComplainNo) AS ROW_NEXT from WORKSPACE.Complains where AssignedEmployee='"+ Uname +"') AS COMPLAINS WHERE ROW_NEXT BETWEEN "+start_limit+" AND "+stop_limit+"",false);        
        while(rs.next())
        {
        	num_complaints = rs.getInt(1);
        }
        rs.close();
        return num_complaints;        
    }
    //for emp to view the details of a  particular complain
    public static Complaints GetCompDetail(int compno) throws Exception
    {
    	dbClass db=new dbClass();
    	ResultSet rs=db.getData("Select c.complainno,u.customername,c.complaintype,c.complaindesc,c.assignedemployee,c.phone,c.complaindate from WORKSPACE.Complains c,WORKSPACE.customers u where c.username=u.username and ComplainNo=" + compno  ,false);
    	Complaints ur=new Complaints();
    	if(rs.next())
    	{      
    		ur.setComplainNo(rs.getInt(1));
    		ur.setCustomername(rs.getString(2));
    		ur.setComplainType(rs.getString(3));
    		ur.setComplainDesc(rs.getString(4));
    		ur.setAssignedEmployee(rs.getString(5));
    		ur.setPhone(rs.getString(6));
    		ur.setCompDateTime(rs.getDate(7));
    
    	
    	}
    	else
    	{
    		ur.setUsername("none");
    	}
    	rs.close();
    	return ur;     
    } 
    
}
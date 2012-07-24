package csd;

import java.sql.*;
import java.util.*;

public class AssignedComplains
{
	private String Uname = "" ;
	private String AssignDT = "" ;
	private String Sta = "" ;
	private int intcompno=0;
	
	public void setUsername(String input)
	{
		Uname=input;
	}

	public String getUsername()
	{
		return Uname;
	}
	
	public void setAssignDateTime(String input)
    {
        AssignDT=input;
    }

    public String getAssignDateTime()
    {
        return AssignDT;
    }
	
	public void setComplainNo(int input)
    {
        intcompno=input;
    }

    public int getComplainNo()
    {
        return intcompno;
    }
	
	public void setStatus(String input)
	{
		Sta=input;
	}

	public String getStatus()
	{
		return Sta;
	}
	
	public static List GetComplainAssign() throws Exception
    {
		dbClass db=new dbClass();
        List listComplainAssign=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from ComplainAssign",false);        
        while(rs.next())
        {
              AssignedComplains ur=new AssignedComplains();
              ur.setUsername(rs.getString(1));
              ur.setComplainNo(rs.getInt(2));
              ur.setAssignDateTime(rs.getString(3));
              ur.setStatus(rs.getString(4));
              listComplainAssign.add(ur); 
        }
        rs.close();
        return listComplainAssign;        
    }
	
	public static void Insert(AssignedComplains ur) throws Exception
    {  
		dbClass db = new dbClass();
        Object parameter[]=new Object[4];
        parameter[0]=ur.getUsername();
        parameter[1]=ur.getComplainNo();
        parameter[2]=ur.getAssignDateTime();
        parameter[3]=ur.getStatus();
	
        db.ExecuteParamQuery("insert into ComplainAssign values(?,?,?,?)",parameter);
    }

    public static void Update(AssignedComplains ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[4];
        parameter[0]=ur.getUsername();
        parameter[1]=ur.getComplainNo();
        parameter[2]=ur.getAssignDateTime();
        parameter[3]=ur.getStatus();
        db.ExecuteParamQuery("update ComplainAssign set Username=?,ComplainNo=?,AssignDateTime=?,Status=? where Username=?",parameter);
    }
}
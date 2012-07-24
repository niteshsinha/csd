package csd;

import java.sql.*;
import java.util.*;

public class Users
{
	private String Uname = "" ;
	private String pword = "" ;

	public void setUsername(String input)
	{
		Uname=input;
	}

	public String getUsername()
	{
		return Uname;
	}

	public void setpassword(String input)
	{
		pword=input;
	}

	public String getpassword()
	{
		return pword;
	}

	public static List GetUsers() throws Exception
    {
		dbClass db=new dbClass();
        List listusers=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.Users",false);        
        while(rs.next())
        {
        	Users ur=new Users();
        	ur.setUsername(rs.getString(1));
        	ur.setpassword(rs.getString(2));
        	listusers.add(ur); 	
        }
        rs.close();
        return listusers;        
    }
		
	// TO GET A NEW USER.....
	public static String GetUsers(String nUname) throws Exception
    {
		dbClass db=new dbClass();
		ResultSet rs=db.getData("Select Username from WORKSPACE.Users where Username='"+ nUname +"'",false);
		String rUname="";
		if(rs.next())
		{      
			rUname=rs.getString(1);
		}
		else
		{
			rUname="none";
		}
		rs.close();
		return rUname;     
    }

	// TO GET A USER WHICH HAS ALREADY LOGGED IN......
    public static Users GetUsers(String eUname, String Pass) throws Exception
    {
    	dbClass db=new dbClass();
    	ResultSet rs=db.getData("Select * from WORKSPACE.Users where Username='"+ eUname +"' and password='"+ Pass +"'",false);
    	Users us=new Users();
    	if(rs.next())
    	{      
    		us.setUsername(rs.getString(1));
    		us.setpassword(rs.getString(2));
    	}
    	else
    	{
    		us.setUsername("none");
    	}
    	rs.close();
    	return us;     
    }

    public static void Insert(Users ur) throws Exception
    {  
    	dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[0]=ur.getUsername();
        parameter[1]=ur.getpassword();
        db.ExecuteParamQuery("insert into WORKSPACE.Users values(?,?)",parameter);
    }

    public static void Update(Users ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[0]=ur.getUsername();
        parameter[1]=ur.getpassword();
        db.ExecuteParamQuery("update WORKSPACE.Users set Username=?,password=? where Username=?",parameter);
    }
    
    public static void UpdatePass(Users ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[1]=ur.getUsername();
        parameter[0]=ur.getpassword();
        db.ExecuteParamQuery("update WORKSPACE.Users set password=? where Username=?",parameter);
    }
}
package csd;

import java.sql.*;
import java.util.*;

public class UserType
{
	private String Uname = "" ;
	private String Rname = "" ;

	public void setUsername(String input)
	{
		Uname=input;
	}

	public String getUsername()
	{
		return Uname;
	}

	public void setTypeName(String input)
	{
		Rname=input;
	}

	public String getTypeName()
	{
		return Rname;
	}

	public static List GetUserType() throws Exception
    {
		dbClass db=new dbClass();
        List listUserType=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.UserType",false);        
        while(rs.next())
        {
        	UserType ur=new UserType();
        	ur.setUsername(rs.getString(1));
        	ur.setTypeName(rs.getString(2));
        	listUserType.add(ur); 	
        }
        rs.close();
        return listUserType;        
    }
	
	public static String GetRole(String Uname) throws Exception
    {
		dbClass db=new dbClass();
		ResultSet rs=db.getData("Select TypeName from WORKSPACE.UserType where Username='"+ Uname +"'",false);
		String rName="";
		if(rs.next())
		{      
			rName=rs.getString(1);
		}
		else
		{
			rName="none";
		}
		rs.close();
		return rName;     
    }

    public static void Insert(UserType ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[1]=ur.getUsername();
        parameter[0]=ur.getTypeName();
        db.ExecuteParamQuery("insert into WORKSPACE.UserType values(?,?)",parameter);
    }

    public static void Update(UserType ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[1]=ur.getUsername();
        parameter[0]=ur.getTypeName();
        db.ExecuteParamQuery("update WORKSPACE.UserType set TypeName=?,Username=?, where Username=?",parameter);
    }
}
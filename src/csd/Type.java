package csd;

import java.sql.*;
import java.util.*;

public class Type
{
	private String urame="";

	public void setTypeName(String input)
	{
		urame=input;
	}

	public String getTypeName()
	{
		return urame;
	}

	public static List GetRoles() throws Exception
    {
		dbClass db=new dbClass();
        List listRoles=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.Roles",false);        
        while(rs.next())
        {
        	Type ur=new Type();
        	ur.setTypeName(rs.getString(1));
            listRoles.add(ur); 	
        }
        rs.close();
        return listRoles;        
    }
	
	public static void Insert(Type ur) throws Exception
    {  
		dbClass db = new dbClass();
        Object parameter[]=new Object[1];
        parameter[0]=ur.getTypeName();
        db.ExecuteParamQuery("insert into WORKSPACE.Roles values(?)",parameter);
    }

    public static void Update(Type ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[1];
        parameter[0]=ur.getTypeName();
        db.ExecuteParamQuery("update WORKSPACE.Roles set TypeName=?,where TypeName=?",parameter);
    }
}
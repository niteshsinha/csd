package csd;

import java.sql.*;
import java.util.*;

public class ComplainTypes
{
	private String strPtype = "" ;
	private String strPdesc = "" ;
	private String strOldPtype = "" ;

	public void setComplainType(String input)
	{
		strPtype=input;
	}

	public String getComplainType()
	{
		return strPtype;
	}
	public void setOldComplainType(String input)
	{
		strOldPtype=input;
	}

	public String getOldComplainType()
	{
		return strOldPtype;
	}
	public void setComplainDesc(String input)
	{
		strPdesc=input;
	}

	public String getComplainDesc()
	{
		return strPdesc;
	}

	public static List GetComplainType() throws Exception
    {
		dbClass db=new dbClass();
        List listpro=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.ComplainTypes",false);        
        while(rs.next())
        {
        	ComplainTypes ur=new ComplainTypes();
        	ur.setComplainType(rs.getString(1));
        	ur.setComplainDesc(rs.getString(2));
           	listpro.add(ur); 	
        }
        rs.close();
        return listpro;        
    }
	
	public static void Insert(ComplainTypes ur) throws Exception
    {  
		dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[0]=ur.getComplainType();
		parameter[1]=ur.getComplainDesc();
		db.ExecuteParamQuery("insert into WORKSPACE.ComplainTypes values(?,?)",parameter);
    }

	public static void Update(ComplainTypes ur) throws Exception
    {  
		dbClass db = new dbClass();
        Object parameter[]=new Object[3];
        parameter[0]=ur.getComplainType();
        parameter[1]=ur.getComplainDesc();
        parameter[2]=ur.getOldComplainType();
        db.ExecuteParamQuery("update WORKSPACE.ComplainTypes set ComplainTYPE=?,ComplainDESC=? where ComplainTYPE=?",parameter);
    }
}

package csd;

import java.sql.*;
import java.util.*;

public class Services
{
	private String sername="";
	private String oldsername="";

	public void setServ(String input)
	{
		sername=input;
	}

	public String getServ()
	{
		return sername;
	}
	
	public void setOldServ(String input)
	{
		oldsername=input;
	}

	public String getOldServ()
	{
		return oldsername;
	}

	
	public static List GetServices() throws Exception
    {
		dbClass db=new dbClass();
        List listService=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.Services",false);        
        while(rs.next())
        {
        	Services ur=new Services();
        	ur.setServ(rs.getString(1));
        	listService.add(ur); 	
        }
        rs.close();
        return listService;        
    }
	
	public static void Insert(Services ur) throws Exception
	{  
        dbClass db = new dbClass();
        Object parameter[]=new Object[1];
        parameter[0]=ur.getServ();
        db.ExecuteParamQuery("insert into WORKSPACE.Services values(?)",parameter);
	}

    public static void Update(Services ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[0]=ur.getServ();
        parameter[1]=ur.getOldServ();
        db.ExecuteParamQuery("update WORKSPACE.Services set Ser=? where Ser=?",parameter);
    }
}
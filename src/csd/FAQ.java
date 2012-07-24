package csd;

import java.sql.*;
import java.util.*;

public class FAQ
{
	private String strques = "" ;
	private String stroldques="";
	private String strans = "" ;

	public void setFaqQues(String input)
	{
		strques=input;
	}

	public String getFaqQues()
	{
		return strques;
	}
	public void setFaqOldQues(String input)
	{
		stroldques=input;
	}

	public String getFaqOldQues()
	{
		return stroldques;
	}
	public void setFaqAns(String input)
	{
		strans=input;
	}

	public String getFaqAns()
	{
		return strans;
	}

	public static List GetFaq() throws Exception
    {
		dbClass db=new dbClass();
        List listfaq=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.FAQ",false);        
        while(rs.next())
        {
        	FAQ ur=new FAQ();
        	ur.setFaqQues(rs.getString(1));
        	ur.setFaqAns(rs.getString(2));
        	listfaq.add(ur); 	
        }
        rs.close();
        return listfaq;        
    }
	
	public static void Insert(FAQ ur) throws Exception
    {  
		dbClass db = new dbClass();
        Object parameter[]=new Object[2];
        parameter[0]=ur.getFaqQues();
		parameter[1]=ur.getFaqAns();
		db.ExecuteParamQuery("insert into WORKSPACE.FAQ values(?,?)",parameter);
    }

    public static void Update(FAQ ur) throws Exception
    {  
    	dbClass db = new dbClass();
        Object parameter[]=new Object[3];
        parameter[0]=ur.getFaqQues();	
        parameter[1]=ur.getFaqAns();
        parameter[2]=ur.getFaqOldQues();
        db.ExecuteParamQuery("update WORKSPACE.FAQ set Q=?,A=? where Q=?",parameter);
    }
}

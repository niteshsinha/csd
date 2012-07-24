package csd;

import java.sql.*;
import java.util.*;
import java.util.Date;

public class Feedback
{
	private String FeedCo="";
	private int fcompno;
	private int Rate;
	private Date FBDate;

	public void setFeedContent(String input)
	{
		FeedCo=input;
	}

	public String getFeedContent()
	{
		return FeedCo;
	}
	
	public void setRating(int input)
	{
		Rate=input;
	}

	public int getRating()
	{
		return Rate;
	}
	
	public void setFeedCompNo(int input)
	{
		fcompno=input;
	}

	public int getFeedCompNo()
	{
		return fcompno;
	}
	
	public Date getFeedbackDate()
	{
		return FBDate;
	}
	
	public void setFeedbackDate(Date input)
	{
		FBDate=input;
	}
	
	public static List GetFeedbackVal() throws Exception
    {
		dbClass db=new dbClass();
        List listService=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.Feedback",false);        
        while(rs.next())
        {
        	Feedback ur=new Feedback();
        	ur.setFeedContent(rs.getString(1));
        	ur.setRating(rs.getInt(2));
        	ur.setFeedCompNo(rs.getInt(3));
        	listService.add(ur); 	
        }
        rs.close();
        return listService;        
    }
	
	public static void Insert(Feedback ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[3];
        parameter[1]=ur.getFeedContent();
        parameter[2]=ur.getRating();
		parameter[0]=ur.getFeedCompNo();
		db.ExecuteParamQuery("insert into WORKSPACE.Feedback values(?,?,?,CURRENT DATE,DEFAULT)",parameter);
    }
	
	public static Feedback GetFeed(int fcompno) throws Exception
	{
		dbClass db=new dbClass();
		ResultSet rs=db.getData("Select feedcontent,feedbackdate,rating from Workspace.feedback where feedbackid=(Select max(feedbackid) from Workspace.Feedback where complainno="+ fcompno+")",false);
		Feedback ur=new Feedback();
		if(rs.next())
		{      
			ur.setFeedContent(rs.getString(1));
			ur.setFeedbackDate(rs.getDate(2));
			ur.setRating(rs.getInt(3));
			
		}
		else
		{
			ur.setFeedContent("none");
		}
		rs.close();	
		return ur;     
	} 

}
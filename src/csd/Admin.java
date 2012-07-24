package csd;

import java.sql.*;
import java.util.*;

public class Admin
{
	private String Uname = "" ;
	private String Aname = "" ;
	private String Addr = "" ;
	private String rem = "" ;
	private String ema = "" ;
	private String ar = "" ;
	private String cit = "" ;
	private String countr = "" ;
	private String intpho = "" ;
	private String intmob = "" ;
	private int AdmId=0;
	
	public void setAdminId(int input)
	{
		AdmId=input;
	}
	
	public int getAdminId()
	{
		return AdmId;
	}
	
	public void setUsername(String input)
	{
		Uname=input;
	}

	public String getUsername()
	{
		return Uname;
	}

	public void setAdminname(String input)
	{
		Aname=input;
	}

	public String getAdminname()
	{
		return Aname;
	}
	
	public void setAddressline1(String input)
    {
        Addr=input;
    }

    public String getAddressline1()
    {
        return Addr;
    }
	
	public void setArea(String input)
    {
        ar=input;
    }

    public String getArea()
    {
        return ar;
    }
    
	public void setCity(String input)
    {
        cit=input;
    }

    public String getCity()
    {
        return cit;
    }
    
	public void setCountry(String input)
    {
        countr=input;
    }

    public String getCountry()
    {
        return countr;
    }
	
    public void setRemarks(String input)
    {
        rem=input;
    }

    public String getRemarks()
    {
        return rem;
    }
	
    public void setEMail(String input)
    {
        ema=input;
    }

    public String getEMail()
    {
        return ema;
    }
	
    public void setPhone(String input)
    {
        intpho=input;
    }

    public String getPhone()
    {
        return intpho;
    }
	
    public void setMobile(String input)
    {
        intmob=input;
    }

    public String getMobile()
    {
        return intmob;
    }
	
    public static List GetAdmin() throws Exception
    {
    	dbClass db=new dbClass();
        List listAdmin=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.Admin",false);        
        while(rs.next())
       	{
        	Admin ur=new Admin();
        	ur.setUsername(rs.getString(1));
        	ur.setAdminname(rs.getString(2));
        	ur.setAddressline1(rs.getString(3));
        	ur.setArea(rs.getString(4));
        	ur.setCity(rs.getString(5));
        	ur.setCountry(rs.getString(6));
        	ur.setPhone(rs.getString(7));
        	ur.setMobile(rs.getString(8));
        	ur.setEMail(rs.getString(9));
        	ur.setRemarks(rs.getString(10));
        	listAdmin.add(ur); 	
       	}
        rs.close();
        return listAdmin;        
    }
	
    public static Admin GetAdmin(String Uname) throws Exception
    {
    	dbClass db=new dbClass();
    	ResultSet rs=db.getData("Select * from WORKSPACE.Admin where Username='"+ Uname +"'",false);
    	Admin ur=new Admin();
    	if(rs.next())
    	{      
    		ur.setAdminId(rs.getInt(1));
    		ur.setUsername(rs.getString(2));
    		ur.setAdminname(rs.getString(3));
    		ur.setAddressline1(rs.getString(4));
    		ur.setArea(rs.getString(5));
    		ur.setCity(rs.getString(6));
    		ur.setCountry(rs.getString(7));
    		ur.setPhone(rs.getString(8));
    		ur.setMobile(rs.getString(9));
    		ur.setEMail(rs.getString(10));
    		ur.setRemarks(rs.getString(11));
    	}
    	else
    	{
    		ur.setUsername("none");
    	}
    	rs.close();
    	return ur;     
    } 
    
    // CODE TO GET THE PROFILE OF A CUSTOMER......	
    /*public static Customers GetProf(String UsName) throws Exception
    {
    	dbClass db=new dbClass();
    	ResultSet rs=db.getData("Select * from Customers where Username="+ UsName +"",false);
    	Customers ur=new Customers();
    	if(rs.next())
    	{      
    		ur.setUsername(rs.getString(1));
    		ur.setCustomername(rs.getString(2));
    		ur.setAddressline1(rs.getString(3));
    		ur.setArea(rs.getString(4));
    		ur.setCity(rs.getString(5));
    		ur.setCountry(rs.getString(6));
    		ur.setRemarks(rs.getString(7));
    		ur.setEMail(rs.getString(8));
    		ur.setPhone(rs.getInt(9));
    		ur.setMobile(rs.getInt(10));
    	}
    	else
    	{
    		//dpt.setDeptNo(-1);
    		ur.setUsername("NULL");
    	}
    	rs.close();
    	return ur;     
    }*/	
	
    public static void Insert(Admin ur) throws Exception
    {  
    	dbClass db = new dbClass();
        Object parameter[]=new Object[10];
        parameter[0]=ur.getUsername();
    	parameter[1]=ur.getAdminname();
    	parameter[2]=ur.getAddressline1();
    	parameter[3]=ur.getArea();
    	parameter[4]=ur.getCity();
    	parameter[5]=ur.getCountry();
    	parameter[6]=ur.getPhone();
    	parameter[7]=ur.getMobile();
    	parameter[8]=ur.getEMail();
    	parameter[9]=ur.getRemarks();
		db.ExecuteParamQuery("insert into WORKSPACE.Admin values(?,?,?,?,?,?,?,?,?,?)",parameter);
    }

    public static void Update(Admin ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[10];
        parameter[9]=ur.getUsername();
        parameter[0]=ur.getAdminname();
        parameter[1]=ur.getAddressline1();
        parameter[2]=ur.getArea();
        parameter[3]=ur.getCity();
        parameter[4]=ur.getCountry();
        parameter[5]=ur.getPhone();
        parameter[6]=ur.getMobile();
        parameter[7]=ur.getEMail();
        parameter[8]=ur.getRemarks();
        db.ExecuteParamQuery("update WORKSPACE.Admin set Adminname=?,Addressline1=?,Area=?,City=?,Country=?,Phone=?,Mobile=?,EMail=?,AboutMe=?where Username=?",parameter);
    }

}
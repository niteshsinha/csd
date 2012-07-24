
package csd;

import java.sql.*;
import java.util.*;

public class Customers
{
	//private static String AutoID="DEFAULT";
	private String Uname = "" ;
	private String Cname = "" ;
	private String Addr = "" ;
	private String rem = "" ;
	private String ema = "" ;
	private String ar = "" ;
	private String cit = "" ;
	private String countr = "" ;
	private String intpho = "" ;
	private String intmob = "" ;
	private int CusID=0;

	public void setCustomerId(int input)
	{
		CusID=input;
	}
	
	public int getCustomerId()
	{
		return CusID;
	}
	
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
	
    public static List GetCustomers() throws Exception
    {
    	dbClass db=new dbClass();
        List listCustomers=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.Customers",false);        
        while(rs.next())
        {
        	Customers ur=new Customers();
        	ur.setUsername(rs.getString(1));
        	ur.setCustomername(rs.getString(2));
        	ur.setAddressline1(rs.getString(3));
        	ur.setArea(rs.getString(4));
        	ur.setCity(rs.getString(5));
        	ur.setCountry(rs.getString(6));
        	ur.setPhone(rs.getString(7));
        	ur.setMobile(rs.getString(8));
        	ur.setEMail(rs.getString(9));
        	ur.setRemarks(rs.getString(10));
        	listCustomers.add(ur); 	
        }
        rs.close();
        return listCustomers;        
    }
	
    public static Customers GetCustomer(String Uname) throws Exception
    {
    	dbClass db=new dbClass();
    	ResultSet rs=db.getData("Select * from WORKSPACE.Customers where Customername='"+ Uname +"'",false);
    	Customers ur=new Customers();
    	if(rs.next())
    	{      
    		ur.setCustomerId(rs.getInt(1));
    		ur.setUsername(rs.getString(2));
    		ur.setCustomername(rs.getString(3));
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
    // to return the profile of customer who has logged in.
    public static Customers GetCustomerN(String Uname) throws Exception
    {
    	dbClass db=new dbClass();
    	ResultSet rs=db.getData("Select * from WORKSPACE.Customers where Username='"+ Uname +"'",false);
    	Customers ur=new Customers();
    	if(rs.next())
    	{      
    		ur.setCustomerId(rs.getInt(1));
    		ur.setUsername(rs.getString(2));
    		ur.setCustomername(rs.getString(3));
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
	
    public static void Insert(Customers ur) throws Exception
    {  
    	dbClass db = new dbClass();
        Object parameter[]=new Object[10];
        //parameter[0]=Customers.AutoID;
        parameter[0]=ur.getUsername();
    	parameter[1]=ur.getCustomername();
    	parameter[2]=ur.getAddressline1();
    	parameter[3]=ur.getArea();
    	parameter[4]=ur.getCity();
    	parameter[5]=ur.getCountry();
    	parameter[6]=ur.getPhone();
    	parameter[7]=ur.getMobile();
    	parameter[8]=ur.getEMail();
    	parameter[9]=ur.getRemarks();
		db.ExecuteParamQuery("insert into WORKSPACE.Customers values(DEFAULT,?,?,?,?,?,?,?,?,?,?)",parameter);
    }

    public static void Update(Customers ur) throws Exception
    {  
    	dbClass db = new dbClass();
        Object parameter[]=new Object[10];
        parameter[9]=ur.getUsername();
        parameter[0]=ur.getCustomername();
        parameter[1]=ur.getAddressline1();
        parameter[2]=ur.getArea();
        parameter[3]=ur.getCity();
        parameter[4]=ur.getCountry();
        parameter[5]=ur.getPhone();
        parameter[6]=ur.getMobile();
        parameter[7]=ur.getEMail();
        parameter[8]=ur.getRemarks();
        db.ExecuteParamQuery("update WORKSPACE.Customers set Customername=?,Addressline1=?,Area=?,City=?,Country=?,Phone=?,Mobile=?,EMail=?,AboutMe=?where Username=?",parameter);
    }

    public static List GetCustomers(String SearchPara,String SearchType) throws Exception
    {
    	dbClass db=new dbClass();
        List listCustomers=Collections.synchronizedList(new ArrayList());
        ResultSet rs=null;
        if(SearchPara!="" &&  SearchType!="") {
	    	if(SearchType.equals("Name"))
	        {
	         rs=db.getData("Select *  from WORKSPACE.Customers where Customername like '"+SearchPara+"%'",false);
	        }
	        else if(SearchType.equals("Area"))
	        {
	            rs=db.getData("Select * from WORKSPACE.Customers where area like '"+SearchPara +"%'",false);       
	        }
	        else
	        {
	        	 rs=db.getData("Select * from WORKSPACE.Customers where city like '"+SearchPara +"%'",false);        
	        }
	    	
	    	while(rs.next())
	       	{
	        	Customers ur=new Customers();
	        	ur.setCustomerId(rs.getInt(1));
	        	ur.setUsername(rs.getString(2));
	        	ur.setCustomername(rs.getString(3));
	        	ur.setAddressline1(rs.getString(4));
	        	ur.setArea(rs.getString(5));
	        	ur.setCity(rs.getString(6));
	        	ur.setCountry(rs.getString(7));
	        	ur.setPhone(rs.getString(8));
	        	ur.setMobile(rs.getString(9));
	        	ur.setEMail(rs.getString(10));
	        	ur.setRemarks(rs.getString(11));
	        	listCustomers.add(ur); 	
	       	}
	        rs.close();
    	}
        return listCustomers;        
    }
    
    
}
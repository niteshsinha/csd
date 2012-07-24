package csd;

import java.sql.*;
import java.util.*;

public class Employees
{
	private String Uname = "" ;
	private String Ename = "" ;
	private String Addr = "" ;
	private String rem = "" ;
	private String ema = "" ;
	private String countr = "" ;
	private String strpho = "" ;
	private String strmob = "" ;
	private String cit = "" ;
	private String are = "" ;
	private int EmpId=0;
	
	public void setEmployeeId(int input)
	{
		EmpId=input;
	}
	
	public int getEmployeeId()
	{
		return EmpId;
	}
	public void setUsername(String input)
	{
		Uname=input;
	}

	public String getUsername()
	{
		return Uname;
	}

	public void setEmployeename(String input)
	{
		Ename=input;
	}

	public String getEmployeename()
	{
		return Ename;
	}

	public void setAddressline1(String input)
    {
        Addr=input;
    }

    public String getAddressline1()
    {
        return Addr;
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
        strpho=input;
    }

    public String getPhone()
    {
        return strpho;
    }
	
    public void setMobile(String input)
    {
        strmob=input;
    }

    public String getMobile()
    {
        return strmob;
    }
	
	public void setCountry(String input)
	{
		countr=input;
	}

	public String getCountry()
	{
		return countr;
	}
	
	public void setCity(String input)
	{
		cit=input;
	}

	public String getCity()
	{
		return cit;
	}
	
	public void setArea(String input)
	{
		are=input;
	}

	public String getArea()
	{
		return are;
	}
	
	public static List GetEmployees() throws Exception
    {
		dbClass db=new dbClass();
        List listEmployees=Collections.synchronizedList(new ArrayList());	
        ResultSet rs=db.getData("Select * from WORKSPACE.Employees",false);        
        while(rs.next())
        {
        	Employees ur=new Employees();
        	ur.setEmployeeId(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
        	ur.setEmployeename(rs.getString(3));
        	ur.setAddressline1(rs.getString(4));
        	ur.setArea(rs.getString(5));
           	ur.setCity(rs.getString(6));
           	ur.setCountry(rs.getString(7));    	
           	ur.setEMail(rs.getString(8));
           	ur.setPhone(rs.getString(9));
           	ur.setMobile(rs.getString(10));
           	ur.setRemarks(rs.getString(11));
           	listEmployees.add(ur); 	
        }
        rs.close();
        return listEmployees;        
    }
// to return the details of employee who has logged in..on profile page
	public static Employees GetEmployeesN(String Uname) throws Exception
	{
		dbClass db=new dbClass();
		ResultSet rs=db.getData("Select * from WORKSPACE.Employees where Username='"+ Uname +"'",false);
		Employees ur=new Employees();
		if(rs.next())
		{      
			ur.setEmployeeId(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
        	ur.setEmployeename(rs.getString(3));
        	ur.setAddressline1(rs.getString(4));
        	ur.setArea(rs.getString(5));
           	ur.setCity(rs.getString(6));
           	ur.setCountry(rs.getString(7));    	
           	ur.setEMail(rs.getString(8));
           	ur.setPhone(rs.getString(9));
           	ur.setMobile(rs.getString(10));
           	ur.setRemarks(rs.getString(11));
		}
		else
		{
			ur.setUsername("none");
		}
		rs.close();
		return ur;     
	} 
	
	
	public static Employees GetEmployees(String Uname) throws Exception
	{
		dbClass db=new dbClass();
		ResultSet rs=db.getData("Select * from WORKSPACE.Employees where Employeename='"+ Uname +"'",false);
		Employees ur=new Employees();
		if(rs.next())
		{      
			ur.setEmployeeId(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
        	ur.setEmployeename(rs.getString(3));
        	ur.setAddressline1(rs.getString(4));
        	ur.setArea(rs.getString(5));
           	ur.setCity(rs.getString(6));
           	ur.setCountry(rs.getString(7));    	
           	ur.setEMail(rs.getString(8));
           	ur.setPhone(rs.getString(9));
           	ur.setMobile(rs.getString(10));
           	ur.setRemarks(rs.getString(11));
		}
		else
		{
			ur.setUsername("none");
		}
		rs.close();
		return ur;     
	} 

	public static void Insert(Employees ur) throws Exception
    {  
		dbClass db = new dbClass();
        Object parameter[]=new Object[10];
        parameter[0]=ur.getUsername();
        parameter[1]=ur.getEmployeename();
        parameter[2]=ur.getAddressline1();
        parameter[3]=ur.getArea();
        parameter[4]=ur.getCity();
        parameter[5]=ur.getCountry();
        parameter[6]=ur.getRemarks();
        parameter[7]=ur.getEMail();
        parameter[8]=ur.getPhone();
        parameter[9]=ur.getMobile();
        db.ExecuteParamQuery("insert into WORKSPACE.Employees values(?,?,?,?,?,?,?,?,?,?)",parameter);
    }

    public static void Update(Employees ur) throws Exception
    {  
        dbClass db = new dbClass();
        Object parameter[]=new Object[10];
        parameter[9]=ur.getUsername();
        parameter[0]=ur.getEmployeename();
        parameter[1]=ur.getAddressline1();
        parameter[2]=ur.getArea();
        parameter[3]=ur.getCity();
        parameter[4]=ur.getCountry();
        parameter[5]=ur.getRemarks();
        parameter[6]=ur.getEMail();
        parameter[7]=ur.getPhone();
        parameter[8]=ur.getMobile();
        db.ExecuteParamQuery("update WORKSPACE.Employees set Employeename=?,Addressline1=?,Area=?,City=?,Country=?,AboutMe=?,EMail=?,Phone=?,Mobile=?where Username=?",parameter);
    }

    public static List GetEmployee(String EName) throws Exception
    {
    	dbClass db=new dbClass();
        List listEmployees=Collections.synchronizedList(new ArrayList());
        ResultSet rs=db.getData("Select * from WORKSPACE.Employees where Username='%"+ EName +"'",false);        
        while(rs.next())
        {
        	Employees ur=new Employees();
        	ur.setEmployeeId(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
        	ur.setEmployeename(rs.getString(3));
        	ur.setAddressline1(rs.getString(4));
        	ur.setArea(rs.getString(5));
           	ur.setCity(rs.getString(6));
           	ur.setCountry(rs.getString(7));    	
           	ur.setEMail(rs.getString(8));
           	ur.setPhone(rs.getString(9));
           	ur.setMobile(rs.getString(10));
           	ur.setRemarks(rs.getString(11));
           	listEmployees.add(ur); 	
        }
        rs.close();
        return listEmployees;        
    }
    public static List GetEmployees(String SearchPara,String SearchType) throws Exception
    {
    	dbClass db=new dbClass();
        List listEmployees=Collections.synchronizedList(new ArrayList());
        ResultSet rs=null;
        if(SearchPara!="" &&  SearchType!="") {
        	
        	if(SearchType.equals("Name"))
	        {
        		rs=db.getData("Select *  from WORKSPACE.Employees where Employeename like '"+SearchPara+"%'",false); 
	        }
        	else if(SearchType.equals("Area"))
	        {
        		rs=db.getData("Select *  from WORKSPACE.Employees where area like '"+SearchPara+"%'",false); 
	        }
        	else
        	{
        		rs=db.getData("Select *  from WORKSPACE.Employees where city like '"+SearchPara+"%'",false);
        	}
        while(rs.next())
        {
        	Employees ur=new Employees();
        	ur.setEmployeeId(rs.getInt(1));
        	ur.setUsername(rs.getString(2));
        	ur.setEmployeename(rs.getString(3));
        	ur.setAddressline1(rs.getString(4));
        	ur.setArea(rs.getString(5));
           	ur.setCity(rs.getString(6));
           	ur.setCountry(rs.getString(7));    	
           	ur.setEMail(rs.getString(8));
           	ur.setPhone(rs.getString(9));
           	ur.setMobile(rs.getString(10));
           	ur.setRemarks(rs.getString(11));
           	listEmployees.add(ur); 	
        }
        rs.close();
        }
        return listEmployees;        
    }
       
}
package csd;

import java.sql.*;
import java.util.*;
import java.util.Date;

public class FailedComplains {


	private int rcompno;
	
	public void setFailCompNo(int input)
	{
		rcompno=input;
	}

	public int getFailCompNo()
	{
		return rcompno;
	}
	
	public static void Insert(FailedComplains ur) throws Exception
	{  
		dbClassChild db = new dbClassChild();
       // Object parameter[]=new Object[1];
		int[] parameter=new int[1];
		parameter[0]=ur.getFailCompNo();
		System.out.println(parameter[0]);
		db.ExecuteParamQuery("{call failed_complains(?)}",parameter);
	}
	
	
}

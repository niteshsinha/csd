package csd;

import java.sql.*;

public class dbClassChild extends dbClass {

	public void ExecuteParamQuery(String SQL,int arr[])throws Exception
	{
		CallableStatement cmd=dbConnection().prepareCall(SQL);
		cmd.clearParameters();
		for(int i=1;i<=arr.length;i++)
		{
			cmd.setInt(i,arr[i-1]);
		}
		int reccount=cmd.executeUpdate();
		System.out.println(reccount);
	}
}

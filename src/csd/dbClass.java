package csd;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.Vector;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.xml.*;
import net.sf.jasperreports.engine.design.*;
import net.sf.jasperreports.view.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import com.ibm.db2.jcc.b.db;
import java.util.HashMap;


public class dbClass extends JFrame
{

	public Connection dbConnection()throws Exception
	{
		String[] arr=(String[])Global.getConnectionInfo();
		Class.forName(arr[0]);
		Connection conn=DriverManager.getConnection(arr[1],arr[2],arr[3]);
		return conn;
	}

	public ResultSet getData(String SQL,boolean Updatable)throws Exception
	{
		Statement cmd;
		if(Updatable==true)
		{
			cmd=dbConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		}
		else
		{
			cmd=dbConnection().createStatement();
		}
		ResultSet rs=cmd.executeQuery(SQL);
		return rs;
	}

	public void ExecuteNonQuery(String SQL)throws Exception
	{
		Statement cmd=dbConnection().createStatement();
		cmd.executeUpdate(SQL);
	}

	public void ExecuteParamQuery(String SQL,Object arr[])throws Exception
	{
		PreparedStatement cmd=dbConnection().prepareStatement(SQL);
		cmd.clearParameters();
		for(int i=1;i<=arr.length;i++)
		{
			cmd.setObject(i,arr[i-1]);
		}
		cmd.executeUpdate(); 	
	}

	public int GetMaxId(String idField,String TableName,int InitVal,int Diff)throws Exception
	{
		int mId=0;
		String tid="";
		ResultSet rsMax=this.getData("select max("+ idField +") from "+ TableName +"",false);
		if(rsMax.next())
		{
			tid=rsMax.getString(1);
		}
		rsMax.close();
		if(tid==null)
		{
			mId=InitVal;
		}
		else
		{
			mId=Integer.parseInt(tid) + Diff;
		}
		return mId;
	}
	
}
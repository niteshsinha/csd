package csd;

import javax.servlet.*;
import javax.servlet.http.*;

public class Global implements ServletContextListener
{

	private static String[] strConInfo;

	public void contextInitialized(ServletContextEvent sce)
	{
		ServletContext context=sce.getServletContext();
		String DriverClass=context.getInitParameter("DRIVERCLASS"); 
		String JdbcURL=context.getInitParameter("JDBCURL"); 
		String UserName=context.getInitParameter("USERNAME"); 
		String Password=context.getInitParameter("PASSWORD");  
		String[] ConInfo={DriverClass,JdbcURL,UserName,Password};
		this.setConnectionInfo(ConInfo);
	}

	public void contextDestroyed(ServletContextEvent sce)
	{
		// Put Code that execute when application closed.. 
		strConInfo=null;
		this.setConnectionInfo(null);
	}
 
	private static void setConnectionInfo(String input[])
	{
		strConInfo=input;
	}

	public static String[] getConnectionInfo()
	{
		return strConInfo;
	}
}

	
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import CMST.*;

public class CheckUser extends GenericServlet
{
	public void service(ServletRequest request,ServletResponse response) throws ServletException, IOException
	{
			try
			{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String username = request.getParameter("user");
			System.out.println(username);
			Connection con=null;
			ConnectionBean CBean=new ConnectionBean();
			con=CBean.getConnection();

            ResultSet rs = CBean.executeQuery("Select * from login_master where user_id= '" + username + "' ");
			if (rs.next())
			{
						    	out.println("already exists");
		    }else
		    {
				out.println("You Can Use This User Id");
		    }

	}
		catch(Exception e){ System.out.println("error"+e.getMessage());}
	}

}

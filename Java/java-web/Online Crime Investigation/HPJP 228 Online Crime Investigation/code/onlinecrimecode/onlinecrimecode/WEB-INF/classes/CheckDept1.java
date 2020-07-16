import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import CMST.*;

public class CheckDept1 extends GenericServlet
{
	public void service(ServletRequest request,ServletResponse response) throws ServletException, IOException
	{
			PrintWriter out = response.getWriter();
         //   RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");


			try
			{


	        ConnectionBean CBean=new ConnectionBean();
            Connection con=CBean.getConnection();
			response.setContentType("text/html");
			String uid = request.getParameter("uid");
            String pwd = request.getParameter("pwd");
            System.out.println("user uid" +uid);
            System.out.println("pwd uid" +pwd);

            ResultSet custrs=CBean.executeQuery("select reg_id,login_type from login_master where user_id='" + uid + "' and user_pwd='" + pwd + "' ");

             if(custrs.next())
			 {
			  String login_type=custrs.getString(2);

			    if(login_type.equals("D"))
			    {



				}else
				{

				 out.println("Invalid Login Information");

				}
			 }else
			 {

				 	 out.println("Invalid Login Information");


			 }





	    }
		catch(Exception e)
		{
			out.println("Invalid Login Information"+e);
	    }

	}

}

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;

public class AdminLogin extends HttpServlet
{

 public void init(ServletConfig config) throws ServletException
 {
  super.init(config);
 }

 public void destroy() { }

 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
 {

  RequestDispatcher rd=null;
  response.setContentType("text/html");
  try
  {

    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    String loginName=request.getParameter("cLid");
    System.out.println("loginname" + loginName);

    String adminPwd=request.getParameter("cPwd");
    System.out.println("adminPwd" + adminPwd);
    System.out.println("In Admin Login");
    ResultSet adminrs_found=CBean.executeQuery("select * from admin_master where admin_id='" + loginName + "' and admin_pwd='" + adminPwd + "' ");
    if(adminrs_found.next())
    {

		System.out.println("Record found");

        rd=request.getRequestDispatcher("AdminHome.html");
    }else
    {
        rd=request.getRequestDispatcher("ALogin.jsp");
	}

    rd.forward(request, response);


  }catch(Exception ex)
  {


System.out.println("Error"+ ex);



  }

  }



}
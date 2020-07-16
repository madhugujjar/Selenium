import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;

public class LoginCheck extends HttpServlet
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
    System.out.println("in logincheck");
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    ResultSet adminrs_found=CBean.executeQuery("select * from admin_master");
    if(adminrs_found.next())
    {
        rd=request.getRequestDispatcher("ALogin.jsp");
    }else
    {
     rd=request.getRequestDispatcher("AdminRegistrationForm.jsp");

	}
    rd.forward(request, response);

  }catch(Exception ex)
  {


System.out.println("Error"+ ex);



  }

  }



}
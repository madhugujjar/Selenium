import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;
public class Login extends HttpServlet
{

 public void init(ServletConfig config) throws ServletException
 {
   super.init(config);
 }
 public void destroy()
 {
 }
 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
 {
  RequestDispatcher rd=null;
  response.setContentType("text/html");
  try
  {
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    String loginName=request.getParameter("cLid");
    String cPwd=request.getParameter("cPwd");
    ResultSet custrs=CBean.executeQuery("select reg_id,login_type from login_master where user_id='" + loginName + "' and user_pwd='" + cPwd + "' ");
    if(custrs.next())
    {
    	 String cid=custrs.getString(1);
    	 request.setAttribute("cid",cid);
    	 String login_type=custrs.getString(2);
    	 if(login_type.equals("C"))
    	 {
			System.out.println("Is  Valid");
    	 	rd=request.getRequestDispatcher("CustomerHome.jsp");
    	 }else
    	 {
    	   rd=request.getRequestDispatcher("Login.jsp");
		 }
	}else
	{
		  rd=request.getRequestDispatcher("Login.jsp");
    }
    rd.forward(request, response);
  }catch(Exception ex)
  {
     System.out.println(ex);
  }

  }
}
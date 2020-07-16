import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;
public class CustLogin extends HttpServlet
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
  RequestDispatcher rd=request.getRequestDispatcher("DetailsInserted.jsp");
  response.setContentType("text/html");
  String crno=request.getParameter("crno");
  String cLid=request.getParameter("cLid");
  String cPwd=request.getParameter("cPwd");
  System.out.println("In CustLogin");
  try
  {
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    int inserted=CBean.executeUpdate("insert into customer_login values('" + cLid + "','" + cPwd + "'," + crno + ",sysdate) ");
    if(inserted==1)
    {
     rd.forward(request, response);
	}
  }catch(Exception ex)
  {
  System.out.println(ex);

  }
  }
}
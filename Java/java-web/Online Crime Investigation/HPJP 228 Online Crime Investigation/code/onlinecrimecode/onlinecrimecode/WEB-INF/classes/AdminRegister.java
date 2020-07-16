import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;

public class AdminRegister extends HttpServlet
{

 public void init(ServletConfig config) throws ServletException
 {
  super.init(config);
 }

 public void destroy() { }

 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
 {

  RequestDispatcher rd=request.getRequestDispatcher("Inserted.jsp");

  response.setContentType("text/html");
  String aid=request.getParameter("aid");
  String apwd=request.getParameter("apwd");
  String AdminAdd=request.getParameter("AdminAdd");
  int cno=Integer.parseInt(request.getParameter("cno"));
  String EmailId=request.getParameter("EmailId");
  System.out.println(EmailId);
  try
  {

    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    int inserted=CBean.executeUpdate("insert into admin_master values('" + aid + "','" + apwd + "','" + AdminAdd + "'," + cno + ",'" + EmailId + "') ");
    if(inserted==1)
    {
       rd.forward(request, response);
	}


  }catch(Exception ex)
  {


System.out.println("Error"+ ex);



  }

  }



}
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;

public class SaveCaution extends HttpServlet
{

 public void init(ServletConfig config) throws ServletException
 {
  super.init(config);
 }

 public void destroy() { }

 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
 {

  RequestDispatcher rd=request.getRequestDispatcher("AdminInserted.jsp");
  response.setContentType("text/html");
  String txtca=request.getParameter("txtca");
  System.out.println(txtca);

  int inserted=0;

  try
  {
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    Statement stmt =con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from cautions");
    if(rs.next())
    {
      inserted=CBean.executeUpdate("update  cautions set caution='" + txtca + "' ");
      
      if(inserted==1)
      {
         rd.forward(request, response);
	  }
	  
    }else
    {
      inserted=CBean.executeUpdate("insert into cautions values('" + txtca + "') ");
      rd.forward(request, response);

    }
    
    
  }catch(Exception ex)
  {
   System.out.println("Error"+ ex);
  }

  }



}
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;

public class UpdateComp extends HttpServlet
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
  RequestDispatcher rd=request.getRequestDispatcher("CustInserted.jsp");
  response.setContentType("text/html");
  String cmpno=request.getParameter("cmpno");
  String pdes=request.getParameter("pdes");
  String area=request.getParameter("area");

  int cid=Integer.parseInt(session.getValue("regid") + "");


  try
  {
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select department_id where area='" + area  + "' ");
    rs.next();
    String deptid=rs.getString(1);
    System.out.println(deptid,"department");
    rs.close();
    int inserted=CBean.executeUpdate("insert into complaint_reg values('" + cmpno + "'," + pdes + ",Pending," + cid + ",'" + deptid + "') ");
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
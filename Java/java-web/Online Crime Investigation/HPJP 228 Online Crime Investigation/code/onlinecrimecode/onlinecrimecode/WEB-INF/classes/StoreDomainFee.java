import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;

public class StoreDomainFee extends HttpServlet
{

 public void init(ServletConfig config) throws ServletException
 {
  super.init(config);
 }

 public void destroy() { }

 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
 {

  RequestDispatcher rd=request.getRequestDispatcher("DetailsInserted.jsp");
  response.setContentType("text/html");
  String cid=request.getParameter("txtcid");
  String did=request.getParameter("did");
  String amt=request.getParameter("fee");
  try
  {
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    int inserted=CBean.executeUpdate("insert into domain_fee values('" + cid + "','" + did + "'," + amt + ",to_date(sysdate,'dd-mm-yyyy')) ");
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
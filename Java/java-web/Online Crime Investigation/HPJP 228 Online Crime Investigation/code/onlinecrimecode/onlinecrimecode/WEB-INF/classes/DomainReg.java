import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;

public class DomainReg extends HttpServlet
{

 public void init(ServletConfig config) throws ServletException
 {
  super.init(config);
 }

 public void destroy() { }

 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
 {

  RequestDispatcher rd=request.getRequestDispatcher("CustInserted.jsp");

  response.setContentType("text/html");
  String dno=request.getParameter("dno");
  String cid=request.getParameter("cid");
  String DomainName=request.getParameter("DomainName");
  String sName=request.getParameter("sName");
  String DName=request.getParameter("DName");
  String  date=request.getParameter("date");
  String  ddesc=request.getParameter("ddesc");
  try
  {

    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    int inserted=CBean.executeUpdate("insert into cust_domain_reg values('" + dno + "'," + cid + ",'" + DomainName + "','" + sName + "','" + DName + "',to_date('" + date + "','dd-mm-yyyy'),'" + ddesc + "') ");
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
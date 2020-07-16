import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;
import java.io.*;

public class CustRegister extends HttpServlet
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
  PrintWriter out=response.getWriter();
  String cregno=request.getParameter("regno");
  String CustName=request.getParameter("CustName");
  String CustAdd=request.getParameter("CustAdd");
  String Code=request.getParameter("Code");
  String CustCno=request.getParameter("CustCno");
  String lid=request.getParameter("txtlogin");
  String pwd=request.getParameter("txtpwd");

  try
  {
	ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    int cust_inserted=CBean.executeUpdate("insert into customer_master values('" + cregno + "','" + CustName + "','" + CustAdd + "','"+ Code + "','" + CustCno + "') ");
    int cust_login_inserted=CBean.executeUpdate("insert into login_master values('" + lid + "','" + pwd + "','C' ,'" + cregno + "') ");
    if(cust_inserted==1 && cust_login_inserted==1)
    {
		 rd.forward(request, response);
	}
  }catch(Exception ex)
  {
   out.println("Error"+ ex);
  }
 }



}
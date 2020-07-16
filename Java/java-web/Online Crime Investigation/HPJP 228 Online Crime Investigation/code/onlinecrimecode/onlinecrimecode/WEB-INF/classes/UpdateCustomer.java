import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;
import java.io.*;

public class UpdateCustomer extends HttpServlet
{
  public void init(ServletConfig config) throws ServletException
  {
   super.init(config);
  }
  public void destroy() { }
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
  {
  RequestDispatcher rd=request.getRequestDispatcher("CustomerInserted.jsp");
  response.setContentType("text/html");
  PrintWriter out=response.getWriter();

  String cregno=request.getParameter("regno");
  String CustName=request.getParameter("CustName");
  String CustAdd=request.getParameter("CustAdd");
  String Code=request.getParameter("Code");
  String CustCno=request.getParameter("CustCno");
  try
  {
	ConnectionBean CBean=new ConnectionBean();
    	Connection con=CBean.getConnection();
	int cust_inserted=CBean.executeUpdate("update customer_master set customer_name='" + CustName + "',address='" + CustAdd + "',code='"+ Code + "',cno='" + CustCno + "' where customer_id=" + cregno + " ");
	if(cust_inserted==1)
	{
		 rd.forward(request, response);
	}
  }catch(Exception ex)
  {
   		out.println("Error"+ ex);
  }
	}



}
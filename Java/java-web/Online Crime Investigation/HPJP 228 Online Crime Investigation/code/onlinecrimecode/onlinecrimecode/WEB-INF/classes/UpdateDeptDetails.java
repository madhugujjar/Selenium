import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import CMST.*;
public class UpdateDeptDetails extends HttpServlet
{

 public void init(ServletConfig config) throws ServletException
 {
  super.init(config);
 }

 public void destroy() { }

 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
 {

  PrintWriter out=response.getWriter();

  //RequestDispatcher rd=request.getRequestDispatcher("DetailsInserted.jsp");
  response.setContentType("text/html");
  String Dno=request.getParameter("Dno");
  String DeptName=request.getParameter("DeptName");
  String SiName=request.getParameter("SiName");
  String add=request.getParameter("add");
  String are=request.getParameter("are");

  String code=request.getParameter("code");
  String cno=request.getParameter("cno");

  try
  {

    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();

    int inserted=CBean.executeUpdate("update police_department set department_name='"+ DeptName + "',SiName='" + SiName + "',address='" + add + "',area='" + are + "',code='" + code + "',cno='" + cno + "'  where department_id='"+ Dno + "' ");

    if(inserted==1)
    {

	 out.println("<html><script>function check(){self.close();opener.location='AllDepartments.jsp'; }</script><center><h1><b>Details Updated Successfully</b></h1></center></html>");
     out.println("<center><input type=button value='Close' onclick='return check()'></center>");
//     rd.forward(request, response);

	}else
	{
System.out.println("Not Updated");
}


  }catch(Exception ex)
  {
System.out.println(ex);

   }

  }



}
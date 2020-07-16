import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;
import java.io.*;
public class DeptRegister extends HttpServlet
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
  RequestDispatcher rd=request.getRequestDispatcher("AdminInserted.jsp");
  response.setContentType("text/html");
  PrintWriter out=response.getWriter();
  String Deptid=request.getParameter("Deptid");
  String deptName=request.getParameter("DeptName");
  String SiName=request.getParameter("SiName");
  String DeptAdd=request.getParameter("DeptAdd");
  String PArea=request.getParameter("PArea");

  String Code=request.getParameter("Code");

  String DeptNo=request.getParameter("DeptNo");

  String lid=request.getParameter("txtlogin");
  String pwd=request.getParameter("txtpwd");
  try
  {

	ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();

    int dept_inserted=CBean.executeUpdate("insert into police_department values('" + Deptid + "','" + deptName + "','" + SiName + "','" + DeptAdd + "','" + PArea + "','" + Code + "','" +DeptNo + "') ");
    int dept_login_inserted=CBean.executeUpdate("insert into login_master values('" + lid + "','" + pwd + "','D' ,'" + Deptid + "') ");
    if(dept_inserted==1 && dept_login_inserted==1)
    {
		 rd.forward(request, response);
	}
    }catch(Exception ex)
    {
      out.println("Error"+ ex);
    }
}




}
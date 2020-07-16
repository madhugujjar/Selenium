import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import CMST.*;
import java.io.*;
public class ThieveRegistration extends HttpServlet
{

  String noy="0";
  String nom="0";
  String nod="0";
  String ws="";

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
  int  thid=Integer.parseInt(request.getParameter("thid"));
  String thName=request.getParameter("thName");
  String tloc=request.getParameter("tloc");
  noy=request.getParameter("noy");

  nom=request.getParameter("nom");
  nod=request.getParameter("nod");

System.out.println("values id "+nom);




  if(noy=="")
  {
	  noy="0";
  }

  if(nom=="")
  {
	  nom="0";
  }

  if(nod=="")
  {
	  nod="0";
  }


  ws=noy+","+nom + "," +nod;



  String tth=request.getParameter("tth");
  String image=request.getParameter("photo");


  try
  {

	ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();

    PreparedStatement pstmt=con.prepareStatement("insert into thieves values(?,?,?,?,?,?)");
    pstmt.setInt(1,thid);
    pstmt.setString(2,thName);
    pstmt.setString(3,tloc);
    pstmt.setString(4,ws);
    pstmt.setString(5,tth);
    File f=new File(image);

	FileInputStream fis=new FileInputStream(f);
	pstmt.setBinaryStream(6,fis,(int) f.length());
    int rows=pstmt.executeUpdate();


    // int th_inserted=CBean.executeUpdate("insert into thieves values(" + thid + ",'" + thName + "','" + tloc + "','" + noy + "','" + tth + "') ");
    if(rows==1)
    {
		 rd.forward(request, response);
	}
  }catch(Exception ex)
  {
   out.println("Error"+ ex);
  }

  }



}
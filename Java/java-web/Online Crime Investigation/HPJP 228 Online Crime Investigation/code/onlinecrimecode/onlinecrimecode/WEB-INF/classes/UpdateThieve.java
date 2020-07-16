import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import CMST.*;
public class UpdateThieve extends HttpServlet
{

 public void init(ServletConfig config) throws ServletException
 {
  super.init(config);
 }

 public void destroy() { }


 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException
 {

  PrintWriter out=response.getWriter();
  String noy="0";
  String nom="0";
  String nod="0";
  String ws="";


  //RequestDispatcher rd=request.getRequestDispatcher("DetailsInserted.jsp");
  response.setContentType("text/html");
  String tid=request.getParameter("tid");
  String ThName=request.getParameter("ThName");
  String loc=request.getParameter("loc");

  noy=request.getParameter("noy");
  nom=request.getParameter("nom");
  nod=request.getParameter("nod");

  String tht=request.getParameter("tht");
  String image=request.getParameter("photo");
  System.out.println("Image si"+image);
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



  try
  {

    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    PreparedStatement pstmt=null;

  if(image.equals(""))
  {
    System.out.println("Null");
    pstmt=con.prepareStatement("update thieves  set th_name=?,location=?,no_of_years=?,type_th=? where thieve_id='"+ tid + "'");
    pstmt.setString(1,ThName);
	    pstmt.setString(2,loc);
	    pstmt.setString(3,ws);
	    pstmt.setString(4,tht);


  }else
  {
   System.out.println("Not Null");
   pstmt=con.prepareStatement("update thieves  set th_name=?,location=?,no_of_years=?,type_th=?,photo=? where thieve_id='"+ tid + "'");
    pstmt.setString(1,ThName);
    pstmt.setString(2,loc);
    pstmt.setString(3,ws);
    pstmt.setString(4,tht);


    File f=new File(image);
	FileInputStream fis=new FileInputStream(f);
	pstmt.setBinaryStream(5,fis,(int) f.length());


  }



    int rows=pstmt.executeUpdate();


    //int inserted=CBean.executeUpdate("update thieves set th_name='"+ ThName + "',location='" + loc + "',no_of_years='" + noy + "',type_th='" + tht + "' where thieve_id='"+ tid + "' ");

    if(rows==1)
    {

	 out.println("<html><script>function check(){self.close();opener.location='DThievesInformation.jsp'; }</script><center><h1><b>Details Updated Successfully</b></h1></center></html>");
     out.println("<center><input type=button value='Close' onclick='return check()'></center>");
//     rd.forward(request, response);

	}else
	{
       System.out.println("Not Updated");
    }


  }catch(Exception ex)
  {


out.println(ex);

   }

  }



}
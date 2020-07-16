
<script>
function Close()
{

self.close();
opener.location='ComplaintStatus.jsp';

}

</script>




<html>
<body>
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<form >
<%@page import="java.sql.*,CMST.*" %>
<%

  String cmpno=request.getParameter("cno");
  String pdes=request.getParameter("pdes");
  String area=request.getParameter("area");
  
  String cid=session.getValue("regid") + "";
    
  String ctype=request.getParameter("ctype");
  
  System.out.println(cid + "");
  
  try
  {
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    Statement stmt=con.createStatement();
    
    ResultSet rs=stmt.executeQuery("select department_id from police_department where area='" + area  + "' ");
    rs.next();
    String deptid=rs.getString(1);
    System.out.println(deptid + "department");
    
    String stats="Pending";
    
    rs.close();
    int inserted=CBean.executeUpdate("update complaint_reg set PROB_DESC='" + pdes + "',DEPARTMENT_ID='" + deptid + "',CTYPE='" + ctype + "' where COMPLAINT_ID=" + cmpno +" ");
    if(inserted==1)
    {
%>
  <center><h1 class=tabhead2>Updated Successfully</h1></center>
  <center><h3><input type=button value="Close" onclick="Close()" ></h3></center>
  
<%
    }
  }catch(Exception ex)
  {
    System.out.println("Error"+ ex);
  }
%>

</form>

</body>
</html>

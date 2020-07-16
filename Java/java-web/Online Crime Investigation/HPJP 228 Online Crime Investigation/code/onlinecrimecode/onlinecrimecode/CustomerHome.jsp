<style>

a
{
           color:"Black";
           text-decoration:none;
}
a:hover
{
            color:Gray;
            text-decoration:underline;

}
</style>

<jsp:include page="CustHeader.jsp" />


<%@page import="java.sql.*,CMST.*" %>


<%
String CustName="";
  try
  {
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    
    String cid=session.getValue("regid")+"";
    
    ResultSet custrs=CBean.executeQuery("select customer_name from customer_master where customer_id=" + cid + " ");
    
    if(custrs.next())
    {
          CustName=custrs.getString(1);
    }
    }catch(Exception ex)
    {
    
    
    out.println("Error" +ex);
    
    
    }
    


%>

<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<BODY class=rightPage>
<DIV class=caption1></DIV>
<br>
<br>
<br>
<h3>Welcome to Customer <%=CustName%><h3>


<br>
<br>
<br>
<br>
<br>

<br>
<br>
<br>
<br>

<br>
<br>
<br>
<br>

<br>
<br>
<br>
<br>

<jsp:include page="Footer.htm" />


</BODY></HTML>

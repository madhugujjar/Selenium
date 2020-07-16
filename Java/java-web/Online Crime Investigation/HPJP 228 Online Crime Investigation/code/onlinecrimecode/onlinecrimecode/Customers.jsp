<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*,CMST.*" %>
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

<jsp:include page="CustHeaders.jsp" />

<HTML><HEAD><TITLE>Customer Information</TITLE>
<META>
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<form name=f>
<TR>
<td>

<%
try
{
 int i=1;	 
 Connection con=null;
 ResultSet rs=null;
 ConnectionBean CBean=new ConnectionBean();
 con=CBean.getConnection();
 rs=CBean.executeQuery("select * from customer_master order by customer_id");
%>

<center><h3>CUSTOMERS INFORMATION DETAILS</h3> </center>
<table align=center border=1 colspace=10>
<th class=tabhead3 >Customer Name
<th class=tabhead3 >Address
<th class=tabhead3 >Phone Number
<%
while(rs.next())
{
 
%>
<tr>
<td class=tabhead1><%=rs.getString(2)%></td>
<td class=tabhead1><%=rs.getString(3) %></td>
<td class=tabhead1><%=rs.getString(4) %>-<%=rs.getString(5) %></td>

</tr>
<%
}
}catch(Exception ex)
{
%>
 
<%
  out.println("Error While Connecting DataBase" + ex);
}
%>
</table>


</body>
</html>





</td>





  </TR>
</TBODY></TABLE>
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

</BODY>
</HTML>

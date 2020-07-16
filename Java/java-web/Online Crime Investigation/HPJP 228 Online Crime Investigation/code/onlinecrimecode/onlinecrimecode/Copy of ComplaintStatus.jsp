
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
<jsp:include page="CmpstHeader.jsp" />

<LINK href="css/styles.css" type=text/css rel=stylesheet>


<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<form name=f>
<A name=Entity_1></A>


<TR>
<td>

<%
try
{

 int regid=Integer.parseInt(session.getValue("regid") + "");
 
 Connection con=null;
 ResultSet rs=null;
 ConnectionBean CBean=new ConnectionBean();
 con=CBean.getConnection();
 rs=CBean.executeQuery("select c.complaint_id,c.prob_desc,c.status,p.area,c.ctype,to_char(c.cdate,'dd-mm-yyyy') from complaint_reg c ,police_department p  where c.customer_id=" + regid + " and p.department_id=c.department_id  order by complaint_id ");
%>

<center><h3 >COMPLAINT STATUS INFORMATION</h3> </center>
<table align=center border=1 colspace=10>
<th class=tabhead3 >Complaint Id
<th class=tabhead3 >Problem Description
<th class=tabhead3 >Area
<th class=tabhead3 >Complaint Type
<th class=tabhead3 >Complaint Date
<th class=tabhead3 >Status


<%
while(rs.next())
{
 
%>
<tr>
<td class=tabhead1><%=rs.getString(1) %></td>
<td class=tabhead1><%=rs.getString(2) %></td>
<td class=tabhead1><%=rs.getString(4) %></td>

<td class=tabhead1><%=rs.getString(5) %></td>
<td class=tabhead1><%=rs.getString(6) %></td>
<td class=tabhead1><%=rs.getString(3) %></td>

</tr>
<%
}
}catch(Exception ex)
{
%>
 <b>
<%
  out.println("Error While Connecting DataBase" + ex);
}
%>
</table>

</form>
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

<jsp:include page="Footer.htm" />

</BODY>
</HTML>

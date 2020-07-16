<%@page import="javax.servlet.*" %>

<script>
function Update(tid)
{
  alert(tid);
  window.open("UpdateThieve.jsp?tid="+ tid + " ","popup","width=500,height=400")
}
</script>
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
<HTML><HEAD><TITLE>Home Page</TITLE>
<META><LINK title=report  media=screen href="css/simple.css" type=text/css type=text/css rel=stylesheet>
<form name=f>
<BODY class=rightPage><A name=Entity_1></A>
<DIV class=caption1>ONLINE CRIME REPORTING</DIV>

<a href ="DepartmentHome.jsp"><b>BACK</b></a></b>
<DIV class=caption2>Departments Information</DIV>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0 >
<TBODY>
  <TR>
	<TD class=tabhead width="15%"><a href="Complaints.jsp">Requested Comaplaints</a></TD>
	<TD class=tabhead width="15%"><a href="DThievesInformation.jsp">Thieves Information</a></TD>
        <TD class=tabhead width="15%"><a href="CautionsDetails.jsp">Cautions</a></TD>
</TBODY></TABLE>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0 >
  <TBODY>
  <TR>
<td>

<%
try

{

 Connection con=null;
 ResultSet rs=null;
 String caution="No Cautions";
 ConnectionBean CBean=new ConnectionBean();
 con=CBean.getConnection();
 rs=CBean.executeQuery("select * from cautions");
 
 if(rs.next())
 {
    caution=rs.getString(1);
 }
 rs.close();
  
%>
<html>
<body bgcolor=lightblue>
<form>
<center><h1 class=tabhead>CAUTION INFORMATION </h1> </center>
<table align=left border=1 colspace=10 width="100%">
<th>Caution
<tr>
<td bgcolor=lightblue><%=caution%></td>
</tr>
<%
  
  
  
}catch(Exception ex)
{

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

<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TR>
    <TD class=tabhead width="10%"><H4><center>This is a Customer ON-LINE Complaint Registration Services </center></TD>
 </TR>
</TABLE>
</BODY>
</HTML>

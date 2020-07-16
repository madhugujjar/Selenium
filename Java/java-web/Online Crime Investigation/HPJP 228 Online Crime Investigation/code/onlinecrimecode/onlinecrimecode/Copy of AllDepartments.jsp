<%@page import="javax.servlet.*" %>

<script>
function Update(Did)
{
  alert(Did);
  window.open("UpdateDept.jsp?Did="+ Did + " ","popup","width=500,height=400")
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
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<jsp:include page="AdminHeader.jsp" />

<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<TR>
<td>

<%
try
{
Connection con=null;
ResultSet rs=null;
ConnectionBean CBean=new ConnectionBean();
con=CBean.getConnection();
rs=CBean.executeQuery("select * from police_department order by department_id");

%>


<center><h3 >POLICE DEPARTMENT DETAILS</h3> </center>
<table align=center border=1 colspace=10>
<th class=tabhead3 >Department Id
<th class=tabhead3 >Department Name
<th class=tabhead3 >SI Name
<th class=tabhead3>Address
<th class=tabhead3>Area
<th class=tabhead3>Contact No
<th class=tabhead3>Check
<%
while(rs.next())
{
 String Did=rs.getString(1);
%>
<tr>
<td class=tabhead1><%=Did%></td>
<td class=tabhead1><%=rs.getString(2) %></td>
<td class=tabhead1><%=rs.getString(3) %></td>
<td class=tabhead1><%=rs.getString(4) %></td>
<td class=tabhead1><%=rs.getString(5) %></td>
<td class=tabhead1><%=rs.getString(6) %></td>
<td class=tabhead1><a style={cursor:hand} onclick="Update(<%=Did%>)">Update</a></td>
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
<br><br>
<br>
<br>
<br>
<br>
<br>

<br>


<jsp:include page="Footer.htm" />

</BODY>
</HTML>

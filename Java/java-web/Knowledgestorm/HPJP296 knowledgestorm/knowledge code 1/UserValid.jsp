<%@page import="java.io.*" session="true"%>
<%@include file="connect.jsp"%>
<%String method=request.getMethod();
      if(method.equals("GET"))
      {
      try
     {
	String uname=request.getParameter("username");
	String pass=request.getParameter("password");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select  * from ereg where userid ="+"'"+uname+"'"+"and password = "+"'"+pass+"'");
	if(!rs.next())
	{
%>

<html><body><center><font color=blue><br><h3>Not a Valid UserName Or Password Try with Valid User Name & Password  </h3><input type=button value=Back onClick='history.back()'></center>
<%
}
else
{
session.putValue("uname",uname);
session.putValue("pass",pass);
%>

<html><body><center><font color=blue><br><h3>Welcome to Elearning Site <%=rs.getString(3)%></h3><hr>
<br><table align='center'><tr><td><a href ="Courses.jsp">Availale Courses </a></td></tr>
<tr><td></td></tr><tr><td><a href ="Examination.jsp">Examination</a></td></tr>
<tr><td></td></tr><tr><td><a href ="logout.html">Logout</a></td></tr>
</table>
</center></body><html>

<%
}
con.close();
}
catch(Exception e){     e.printStackTrace();           
}       
}
%>
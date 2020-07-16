<%@include file="connect.jsp"%>
<%@page import="java.net.*,java.io.*" %>

<%String method=request.getMethod();
       if(method.equals("GET"))
       {     
         try
           {
                String sid=null,cid=null;
	    cid=request.getParameter("id");
	    sid=request.getParameter("sid");
	
	Statement st=con.createStatement();
	String sql="select  * from session_details where course_id ='"+cid+"'  and session_no = '"+sid+"'";
	System.out.println(sql);
	ResultSet rs=st.executeQuery(sql);
%>
<html><body><center><font color=blue><h3>

<%
if(rs.next())
{
%>
Session Details </h3></font></center>
<%
BufferedReader in=new BufferedReader(new InputStreamReader(new FileInputStream(rs.getString(3))));
String line="";
while((line=in.readLine()) !=null)
{
out.println(line);
}
}
else
{
%>
<html><body><center><font color=blue><h3><br><br><br>
Course Content Yet to Register in to the DataBase<br><br><br><input type=button value=Back onclick='history.back()'></h3></center></body></html>
<%
}
rs.close();
st.close();
con.close();
}
catch(Exception e)
   {   
      e.printStackTrace();
   }
    out.close();
}
%>
	
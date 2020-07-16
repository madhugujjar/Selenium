<%@page import="java.io.*,java.net.*"%>
<%@include file="connect.jsp"%>
<%String method=request.getMethod();
      if(method.equals("GET"))
      {
	String id=request.getParameter("id");
	try
	{
	        Statement st = con.createStatement();
	        String sql = "select * from courses where course_name='"+id.trim()+"'";
	        ResultSet rs = st.executeQuery(sql);
	        ResultSetMetaData rsmd = rs.getMetaData();
	        int cols = rsmd.getColumnCount();
%>

<center> <font size=5 face='Geneva, Arial, Helvetica, ans-serif'><cite>Courses Information </cite></font></center>
       <table width=75% border=1 align=center bordercolor='#0000FF'>
       <tr> <font color=red>
<%
	for(int i=1;i<=cols;i++)
	{
                     String name=rsmd.getColumnLabel(i);
 %>
         <th> <%=name%></th>
       
<%
                 }
       rs.next();
%>
 </font> </tr>
           <tr>
<%
	String cid = "";
	String s;

           for(int i=1;i<=cols;i++)
	{
                	if(i==1)
                 {
	  cid = rs.getString(1);
                    s = cid;
                  }
                 else
	s = rs.getString(i);
        if(s==null || s.equals(""))
        {
%>
             <td> </td>
<%
        }
         else
         {
%>
        <td><%=s%></td>
<%
         }  
       }
%>
       </tr></table>
       <hr><center>Details<hr>
<%
       rs.close();
       st.close();
      st = con.createStatement( );
      rs = st.executeQuery("select * from course_details where course_id ='" +cid+ "' order  by session_no "  );        
%>
      <table border=1 width=50%>
      <tr><th>Session No</th><th>Topic</th></tr>
<%
      while( rs.next())
{
           cid=rs.getString(1);
           String sessid=rs.getString(2);
           String topic=rs.getString(3);
%>
<tr><td><%=sessid%></td><td><a href="./TopicRead.jsp?id=<%=cid%>&sid=<%=sessid%>"><%=topic%></a></td></tr>
<%
}
%>
     </table></center>
  <%
      rs.close();
      st.close();
      con.close();
     }catch(Exception e){
    %>
     <pre>
<%
       e.printStackTrace();
%>
     </pre>
<%
    }
    out.close();
   }
%>
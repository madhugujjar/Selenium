<%@page import="java.io.*,java.net.*" session="true"%>
<%@include file="./connect.jsp"%> 
<%String method=request.getMethod();
      if(method.equals("GET"))
      {

	String uname=(String)session.getValue("uname");
	String pass=(String)session.getValue("pass");
	//if((uname == null) || (pass == null))
	//{
%>
	<!--<html><body><center><font color=blue><br><h3>First Login using your Userid and Password then Access Course Infomation </h3></font><br><a href='./login.html'>Sign In </a></center></body></html>-->

<%
//return;
//}
    try{
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select course_cat,course_name from courses");
%>


<center> <font size=5 face='Geneva, Arial, Helvetica, ans-serif'><cite>Courses Information </cite></font></center>
<table width=75% border=1 align=center bordercolor='#0000FF'>
<tr> <font color=red>
<th> Course Category </th>
<th> Course Name</th>
</font> </tr>

<%
       while(rs.next()){
%>
           <tr>
<%
           for(int i=1;i<=2;i++){
         String s = rs.getString(i);
        if(s==null || s.equals(""))
       {
%>
          <td> </td>
<%
       }
         else{
%>
            <td>

<%
	if(i==2)
                 {
%>
<a href="./CourseDetails.jsp?id=<%=URLEncoder.encode(s)%>"><%=s%></td>

<%   
         }
	else
         {
%>
	<%=s%></td>
<%
         }
            }

          }
%>
          </tr>
<%
       }  
       rs.close();
       st.close(); 
       con.close();
%>
     </table>

<%
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
   
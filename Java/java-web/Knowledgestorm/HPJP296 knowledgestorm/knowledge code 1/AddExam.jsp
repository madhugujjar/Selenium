<%@page import="java.io.*"%>
<%@include file="connect.jsp"%>
<%String method=request.getMethod();
      if(method.equals("GET"))
     {
      
%>
             <html><body><font color=blue><h2><center>Add Exam For an Existing  Course</center> </h2><form method=POST action="AddExam.jsp"><br><br><table align='center'><tr><td><b>Choose Course ID:<select name='CID'> 

<%
try{
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select course_id from courses order by 1");
	while( rs.next())
                 {
                   String ci=rs.getString(1);
%>
	<option><%=ci%><br>
<%
                 }
	rs.close();
	st.close();
%>
	</select></b></td></tr><tr><td><input type=submit  value='--Add--'></td><tr></table></form></font></body></html>
<%
	}catch(Exception e){
		e.printStackTrace();
	}	        
        }
       else if(method.equals("POST"))
       {
	 String cid=request.getParameter("CID");
%>
          <html><body><font color=blue><h2><center>Examination Paper For the Course Id : <%=cid%></center></h2><br><br>
          <form action="InsertExam.jsp"  method=POST><table border=1 align='center'>
<%
        try{
%>
  <tr><td>Course Id </td><td><input type=text name=cid value=<%=cid%>></td></tr>
  <tr><td>Question  Id </td><td><input type=text name=qid></td></tr>
  <tr><td>Question Description </td><td><input type=text name=qd size=50></td></tr>
  <tr><td>Option 1 </td><td><input type=text name=op1></td></tr>
  <tr><td>Option 2 </td><td><input type=text name=op2></td></tr>
  <tr><td>Option 3 </td><td><input type=text name=op3></td></tr>
  <tr><td>Option 4 </td><td><input type=text name=op4></td></tr>
  <tr><td>Answer </td><td><input type=text name=ans></td></tr>
  <tr><td><input type=submit value='Insert'></td><td><input type=reset value='Clear'></td> </tr></table></form>
  <br><br>
  <h4><font color=red><a href="AdminLogin.jsp" method=POST >Back to Admin</a></font></h4></font></body></html>
<%
           con.close();
           }catch(Exception e){
	e.printStackTrace();
          }
   }
%>
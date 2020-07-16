<%@page import="java.io.*"%>
<%@include file="connect.jsp"%>
<%String method=request.getMethod();
      if(method.equals("GET"))
      {
%>
	<html><body><font color=blue><h2><center>Delete an Existing  Course</center> 	</h2><form method=POST action="DelCourse.jsp"><br><br><table align='center'><tr><td><b>Choose Course ID:<select name='CID'> ");
<%
try{
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select course_id from courses order by 1");
	while( rs.next())
                  {
                     String ci=rs.getString(1);
%>
	<option> <%=ci%><br>
<%
                 }
	rs.close();
	st.close();
                 con.close();
%>
	</select></b></td></tr><tr><td><input type=submit  value='Delete'></td><tr></table></form></font></body></html>
<%
	}catch(Exception e){
		e.printStackTrace();
	}	        
        }
       else if(method.equals("POST"))
       {	
%>
          <html><body><font color=blue><h2><center>Deleting The Course 	Details</center></h2><br><br>
<%
	        String cid=request.getParameter("CID");
	        try{
	        PreparedStatement ps = con.prepareStatement("delete from courses where course_id =?");
	ps.setString(1 ,cid);
	ps.execute();
	ps.close();
%>
             You Have Successfully Remove the Course Details<br> <input type=button value='Go Back' onClick='history.back()'></form>
<%
           }catch(Exception e){
	e.printStackTrace();
          }
      }
 %>
</font></body></html>

<%@include file="connect.jsp"%>
<%String method=request.getMethod();
       if(method.equals("GET"))
      {      
  %>       
             <html><body><center><font color=blue><h2>Add a New Course </h2></center><form method=POST action="AddCourse.jsp"><table align='center'><tr><td>Enter Course Name </td><td><input type=text  name='course_name'></td></tr><tr><td>Category</td><td><input type=text  name='category'></td></tr><tr><td>Number of Sessions</td><td><input type=text name=sessions></td></tr><tr><td><input type=submit value=Store></td><td><input type=reset value=Clear></td></tr></table></form></body></html>
<%
        }
        else if(method.equals("POST"))
     {
          String coursename = request.getParameter("course_name");
          String sessions = request.getParameter("sessions");
          String category = request.getParameter("category");
	 try
  	{
  		 Statement  st=con.createStatement();   
		 ResultSet rs=st.executeQuery("select  nvl(max(substr(course_id,2)),0) + 1 from courses "); 
		 rs.next();
                                       String cd=rs.getString(1);
		 String cid = "c" +cd;
		 PreparedStatement ps = con.prepareStatement("insert into courses values(?,?,?,?) ");
		 ps.setString( 1, cid);
	                    ps.setString( 2, coursename);
	  	 ps.setString( 3, category);
 		 ps.setString( 4, sessions);
	 	 ps.executeUpdate();
	 	 ps.close();	
		 rs.close();
	                    st.close();
%>                 
    	<html><body bgcolor=#FFFFFF><center><font color=blue><h2>Course Added Succesfully</h2><br>
                   <font color=red>The Course Id Generated was :</font><%=cid%>
	<br><br><b>Make Sure You Provide Session Beak Up's and Data so that students can make use of Your valuable course</b></font><br><br><a href="Admin.html">Admin Home </a></body></html>
<%
                 }catch(Exception e){     e.printStackTrace();           }       
           }	
%>

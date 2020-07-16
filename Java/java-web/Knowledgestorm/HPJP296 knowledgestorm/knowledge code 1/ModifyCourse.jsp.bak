<%@page session="true"%>
<%@include file="connect.jsp"%>
<%String method=request.getMethod();
       if(method.equals("GET"))
       {

	session.invalidate();
%>
            <html><body><font color=blue><h2><center>Modify an Existing  Course</center> </h2><form method=POST action="ModifyCourse.jsp"><br><br><table align='center'><tr><td><b>Choose Course ID:<select name='CID'> 
<%
try{
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select course_id from courses order by 1");
	while( rs.next())
                   {
                      String cid=rs.getString(1);
 %>
	<option><%=cid%> </option><br> 
<%
                    }
	rs.close();
	st.close();
%>
	</select></b></td></tr><tr><td><input type=submit  value='--GO--'></td><tr></table></form></font></body></html>
<%
	}catch(Exception e){
		e.printStackTrace();
	}	        
        }
        
         else if(method.equals("POST"))
          {

             if (session.getValue("CID") == null)
	session.putValue("CID" , request.getParameter("CID"));
             String cid = (String)session.getValue("CID"); 	
%>          
          <html><body><font color=blue><h2><center>Modify The Course Id :<%=cid%> Details</center></h2><br><br><form action="ModifyCourse.jsp"  method=POST><table border=1 align='center'><tr color='cyan'><th>Delete</th><th>Session Number</th><th>Topic</th></tr>
<%
        Statement st = null;
        try{
              String add=request.getParameter("ADD");
              if(  add!= null && ! add.equals("")){
               PreparedStatement ps = con.prepareStatement("insert into course_details values( ?,?,?) ");
	ps.setString(1 ,cid);
	ps.setString(2 ,request.getParameter("session_NO"));
	ps.setString(3 ,request.getParameter("topic") );
	ps.executeUpdate();
	ps.close();
           }
	 
          if( request.getParameter("DEL") != null && ! request.getParameter("DEL").equals("")){
          	  String[] values = request.getParameterValues( "C");
             PreparedStatement  ps =con.prepareStatement("delete from course_details where course_id=? and session_no=?");        
                for(int i=0;i<values.length;i++){
		System.out.println("deleting " + values[i]);
                    ps.setString( 1 , cid);
	   ps.setString(2 , values[i]);
	 ps.executeUpdate();
	}
	ps.close();
         }
                      
	 st =con.createStatement();
	ResultSet rs = st.executeQuery("select * from course_details where course_id='" + cid + "' order by session_no" );
            while( rs.next()){
cid=rs.getString(1);
String sess=rs.getString(2);
String topic=rs.getString(3);
%>
	<tr><td><input type=checkbox name=C value=<%=sess%>></td><td><%=sess%></td><td><a href='#' onClick=	window.open('http://localhost:8080/knowledge code/CourseContent.jsp?cid=<%=cid%>&cc=<%=sess%>','CourseContent','toolbar=0,scrollbars=1,width=500,height=500'); return false;><%=topic%></a></td></tr>	
<%
              }

	rs.close();
	st.close();
%>
             <tr><td><input type=submit value=Add name=ADD></td><td><input type=text name=session_NO></td><td><input type=text name=topic></td></tr><tr><td cellspan=3>
              <input type=submit value='Delete All' name='DEL'></td></tr></table></form></font></body></html>
<%
          con.close();
           }catch(Exception e){
	e.printStackTrace();
          }
   }
%>
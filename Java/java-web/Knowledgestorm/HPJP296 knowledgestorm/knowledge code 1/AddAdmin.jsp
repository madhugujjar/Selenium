<%@include file="connect.jsp"%>
<% String method=request.getMethod();
      if(method.equals("GET"))
       {
  %>
          <html><body><center><font color=blue><br><h2>Add a New Adminstrator </h2></center><form method=POST action="AddAdmin.jsp"><br><br><br><table align='center'><tr><td>Admin Name </td><td><input type=text  name='aname'></td></tr><tr><td>Password</td><td><input type=password  name='pass'></td></tr><tr><td><input type=submit value=Add></td></tr></table></form></body></html>
<%        }
          else if(method.equals("POST"))
          {   
          String aname = request.getParameter("aname");
          String pass = request.getParameter("pass");
	 try{
            PreparedStatement ps = con.prepareStatement("insert into admin values(?,?) ");
	ps.setString( 1, aname);
	ps.setString( 2, pass);
	ps.executeUpdate();
 	ps.close();	
%>          
    	<html><body bgcolor=#FFFFFF><center><font color=blue><h2>Admin Name Created  Succesfully</h2><br><br><br><a href=Admin.html>Admin Home </a></body></html>
<%		
         con.close();
                 }catch(Exception e){     e.printStackTrace();           }    
          }   
%>

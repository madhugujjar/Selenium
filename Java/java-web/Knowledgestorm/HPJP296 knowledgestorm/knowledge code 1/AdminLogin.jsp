<%@include file="connect.jsp"%>
<%String method=request.getMethod();%>

<% 
     if(method.equals("POST"))
       {
             String uname=request.getParameter("username");
             String pwd=request.getParameter("password");
              session.setAttribute("username",uname);
		 session.setAttribute("password",pwd);
            

		 String uname1 = (String)session.getAttribute("username");
		 String pwd1 = (String)session.getAttribute("password");
		
            
	 try{
                    	Statement st=con.createStatement();   
                      	ResultSet rs=st.executeQuery("select  * from admin where uname =" +"'"+uname1+"'"+" and pwd = "+"'"+pwd1+"'"); 
                   if(rs.next())
	            { 
%>
                   <html><body bgcolor=#FFFFFF><center><h2> Welcome To Admin Page  <font color=blue > <%=uname %></font></h2>
<br><table align='center'><tr><td><a href ='./AddAdmin.jsp'>Add An Adiministrator</a></td></tr>
<tr><td></td></tr><tr><td><a href ="AddCourse.jsp">Add New Course</a></td></tr>
<tr><td></td></tr><tr><td><a href ="DelCourse.jsp">Delete Course</a></td></tr>
<tr><td></td></tr><tr><td><a href ="ModifyCourse.jsp" >Modify </td></tr>
<tr><td></td></tr><tr><td><a href ="AddExam.jsp" >Add New Exam<a></td></tr>
<tr><td><a href ="admin logout.html" >Logout<a></td></tr>
</center></body><html>
<%
                  }
                 else{  
%>
<html><body bgcolor=#FFFFFF><center><h2><font 
color=red><h2> You are not an Authorised Person to View this Page </h2><br>
<input type=button value='Go Back' onClick=history.back()>
		</center></body><html>
   <%                 }
                 
                    rs.close();
                    st.close();
                   con.close();
                 }catch(Exception e){     e.printStackTrace();           }       
}
%>
     
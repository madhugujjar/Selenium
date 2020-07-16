<%@page import="java.io.*"%>
<%@include file="connect.jsp"%>
<%!String fname,mname,lname,suffix,workaddr,state,city,zip,country,workph,email,webaddr,job,uname,pass;%>
<%String method=request.getMethod();

PreparedStatement ps;



  if(method.equals("POST"))
   {
    try
     {
	boolean b=readValues(request);
	if(!b)
	{
%>
<h3><font color=blue>Required Inputs are Insufficient </font></h3><br><form><input type=button value='Back' onClick='history.back()'></form>
<%
}
Statement st=con.createStatement();
		ps=con.prepareStatement("insert into ereg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,uname);
		ps.setString(2,pass);
	         	ps.setString(3,fname);
                                    ps.setString(4,mname);
       	        	ps.setString(5,lname);
                                    ps.setString(6,suffix);
                                    ps.setString(7,workaddr);
	         	ps.setString(8,city);
                                    ps.setString(9,state);
	         	ps.setString(10,country);	
	         	ps.setString(11,zip);
	        	ps.setString(12,workph);
   	         	ps.setString(13,email);
	         	ps.setString(14,job);
	         	ps.setString(15,webaddr);
	         	int i=ps.executeUpdate();
		if(i==1)
		   {
%>
<html><head><title>Registration Successful</title></head>
<body bgcolor=#FFFFFF>
<strong><h1><center><font color=blue>E-LEARNING</font></center></h1></strong>
<br><h2>Registration Successful </h2>
<font color=blue><h2> Welcome to the New Experience of E-learning
</h2>Your User id For Further Correspondense is <font color=red><b><%=uname%></b><br>
<br><h3>The Following Courses Offered In this Site <a href='./Courses.jsp'>Courses</a></font>
</body></html>
<%
}
}
catch(Exception e)
{
e.printStackTrace();
}  
}
%>  
<%!public boolean readValues(HttpServletRequest req)throws Exception
{
fname=req.getParameter("first_name");
mname=req.getParameter("mid_name");
lname=req.getParameter("last_name");
suffix=req.getParameter("suffix");
workaddr=req.getParameter("addr");
state=req.getParameter("state");
city=req.getParameter("city");
zip=req.getParameter("zip");
country=req.getParameter("country");
workph=req.getParameter("phone");
email=req.getParameter("email");
webaddr=req.getParameter("webaddr");
job=req.getParameter("job");
pass=req.getParameter("password");
uname=req.getParameter("user");

if((fname==null) || fname.equals("") || (workaddr == null) || workaddr.equals("") || (zip == null) || zip.equals("") || (workph == null) || workph.equals("") || (pass == null) || pass.equals("")||(uname == null) || uname.equals("") )
{
return false;
}
else
{
return true;
}
} 
%>

<%@page session="true" import="java.io.*" %>
<%@page import="Q1.*"%>
<%@include file="connect.jsp"%>
<% String method=request.getMethod();
	Random r=new Random();
Vector v;
       if(method.equals("GET"))
       {
	String uname=(String)session.getValue("uname");
	String pass=(String)session.getValue("pass");
	//if((uname == null) || (pass == null))
	//{
%>
	<!--<html><body><center><font color=blue><br><h3>First Login using your Userid and Password then Access Course Infomation </h3></font><br><a href="login.html">Sign In </a></center></body></html>-->
<%
//return;
//}
session.putValue("uname",uname);
%>
          <html><body><font color=blue><h2><center>Select  Exam For an Existing  Course</center> </h2><form method=POST action="Examination.jsp"><br><br><table align='center'><tr><td><b>Choose Course ID:<select name='CID'> 
<%
	try
	{
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
	</select></b></td></tr><tr><td><input type=submit  value='--Select--'></td><tr></table></form></font></body></html>

<%
	}catch(Exception e){
		e.printStackTrace();
	}	        
        }
        else if(method.equals("POST"))
        {
 	try
	{
	String cid=request.getParameter("CID");
	System.out.println("cid is :"+cid);
	String uname=(String)session.getValue("uname");
	session.putValue("uname",uname);
%>
     <html><body><font color=blue><h2><center>Examination Paper For the Course Id : <%=cid%></center></h2><br><br><form action="./Result.jsp" method=GET>

<%
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from question_answer where course_id='"+cid+"'");
v=new java.util.Vector();
Questions q=new Questions();

while(rs.next())
{
q.cid=rs.getString(1);
q.qid=rs.getString(2);
q.qd=rs.getString(3);
q.op1=rs.getString(4);
q.op2=rs.getString(5);
q.op3=rs.getString(6);
q.op4=rs.getString(7);
q.ans=rs.getString(8);
v.addElement(q);
}
st.close();
con.close();
System.out.println("Vector :"+v);
Integer i=new Integer(0);
System.out.println(System.getProperty("user.dir"));
//int r1=r.nextInt(1000);
long r1=Math.round((Math.random()*1000));
System.out.println(System.getProperty("user.dir"));
ObjectOutputStream obj=new ObjectOutputStream(new FileOutputStream("obj"+r1));
v.addElement(i);
obj.writeObject(v);
obj.close();
response.sendRedirect("./Result.jsp?fn=obj"+r1);
          }catch(Exception e){
	e.printStackTrace();
          }
}
  %>

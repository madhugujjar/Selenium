<html>

<head>
<title>Jsp Bean Example</title>
</head>
<body bgcolor=lightpink>
<%@ page language="java"%>
<%@ page import="bean.EmployBeanAccess,java.util.*,java.lang.*"%>
<% String name=request.getParameter("mailid").substring(0,request.getParameter("mailid").indexOf('@'));%>
<jsp:useBean id="emp"scope="page" class="bean.EmployBeanAccess" />
<jsp:setProperty name="emp" property="tname" value='<%=name%>' />
<center><font size=4 color=BLUE>You have (<jsp:getProperty name="emp" property="count"/>) messages</font></center>
<form action="./deletemail" method=post>
<input type="hidden" name="mailid" value='<%=request.getParameter("mailid")%>'>
<% //System.out.println("from employe bean-->"+request.getParameter("mailid")); %> 
<table border=0 align=center>
<tr bgcolor=orange>
<td width=28% align=center><font size=4 color=black>Check</font></td>
<td width=28% align=center><font size=4 color=black>Subject</font></td>
<td width=28% align=center><font size=4 color=black>Send Date</font></td>
</tr>
<%
  try{
  int c=emp.getCount();
  Vector v1=emp.getSubject();
  Stack v2=emp.getDate();
  for(int i=0;i<c;i++)
	 {
         if(i%2>0)
          {
         out.println("<tr bgcolor=#ccccc><td width=10% align=center>");
         out.println("<input type=checkbox name='"+v2.elementAt(i)+"' value='"+v2.elementAt(i)+"'></td>"); 	  
         out.println("<td width=10% align=center><a href='./HrefMail.jsp?tablename="+name+"&subject="+v1.elementAt(i)+"'><font size=4>");
	 out.println(v1.elementAt(i));
         out.println("</a></td><td width=10% align=center>");
        //out.println("<input type=hidden name='"+v2.elementAt(i)+"'>"+v2.elementAt(i));
         out.println(v2.elementAt(i));
         out.println("</td></tr>");
          }
       else
          {
         out.println("<tr bgcolor=#eeeeee><td width=10% align=center>");
         out.println("<input type=checkbox name='"+v2.elementAt(i)+"' value='"+v2.elementAt(i)+"'></td>"); 	  
         out.println("<td width=10% align=center><a href='./HrefMail.jsp?tablename="+name+"&subject="+v1.elementAt(i)+"'><font size=4>");
	 out.println(v1.elementAt(i));
         out.println("</a></td><td width=10% align=center>");
         //out.println("<input type=hidden name='"+v2.elementAt(i)+"'>"+v2.elementAt(i));
         out.println(v2.elementAt(i));
         out.println("</td></tr>");
         
          }
	 }
}
catch(Exception e)
 {
  System.out.println("employe bean"+e.getMessage());
 }

%>
<tr>
<td colspan=3 align=center width=20%><br><input type=submit name=maildel value="Delete" >
<input type=submit name="mailrep" value="Reply">
</td>
</tr>
</table>
</form>
</body>
</html>
<%@page  import="java.io.*,Q1.Questions" session="true"%>
<%@include file="connect.jsp"%>

<%! String method;
String uname="";
Connection con;
Vector v;
int marks=0,a=0;
int sl=0,vsize;%>
------------------------------------

<%!private void showResult(JspWriter out,HttpSession hs)throws Exception
{
Vector v=(Vector)hs.getValue("data");
System.out.println("the v Object"+v);
System.out.println("Uname :"+uname);
vsize=v.size()-1;
System.out.println("Vsize :"+vsize);

for(sl=0;sl<vsize;sl++)
{
Questions q=(Questions)v.elementAt(sl);
if(q.ar.equals(q.ans))
{
marks+=5;
++a;
}
}
}
%>

<% 
method=request.getMethod();
    if(method.equals("GET"))
    {
     try
     {
         uname=(String)session.getValue("uname");
          System.out.println("Uname :"+uname);
         Vector v=null;
       try
       {
              v=(Vector)session.getValue("data");
       }
       catch(Exception e)
       {
       }

      if(v==null)
      {
        ObjectInputStream in=new ObjectInputStream(new FileInputStream(request.getParameter("fn")));
         v=(Vector)in.readObject();
         System.out.println(v);
      }
      int i=((Integer)v.elementAt(v.size()-1)).intValue();

      if(i>0)
      {
           String name=request.getParameter("op");
           Questions temp=(Questions)v.elementAt(i-1);
            temp.ar=name;
            System.out.println("Answer :"+temp.ar);
            v.setElementAt(temp,i-1);
            session.putValue("data",v);
      }
      if(i >=v.size()-1)
      {
          showResult(out,session);
       }
      Questions q=(Questions)v.elementAt(i);
       v.setElementAt(new Integer(i+1),v.size()-1);
       session.putValue("data",v);
        System.out.println("Session inserterdd");
%>
<form action='./Result.jsp'><font color=blue><h2>Questions </h2><hr><br><table align='Center'>
<tr><td>Question </td><td><%=q.qd%></td></tr>
<tr><td><input type=radio name=op value=<%=q.op1%>></td><td><%=q.op1%></td></tr>
<tr><td><input type=radio name=op value=<%=q.op2%>></td><td><%=q.op2%></td></tr>
<tr><td><input type=radio name=op value=<%=q.op3%>></td><td><%=q.op3%></td></tr>
<tr><td><input type=radio name=op value=<%=q.op4%>></td><td><%=q.op4%></td></tr>
<tr><td><input type=submit value='Submit'></td><td><input type=reset value='Clear'></td></tr>
</table></font></form></body></html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}

 if((sl>0) && (vsize>0))
 {
%>
<font color=blue><h2><center>Result </center></h2><hr><br><br><h3>
No of Correct Ans :<font color=red><%=a%>
</font><br><br>No .of Marks :<font color=red><%=marks%>
<br><br><center><a href='./right.htm'>Home</a></center></font></h3></font>
<%
}
}
%>
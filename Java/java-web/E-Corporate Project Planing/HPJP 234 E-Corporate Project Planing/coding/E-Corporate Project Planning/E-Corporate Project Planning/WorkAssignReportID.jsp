<html>
<script language=javascript>
function valid()
 {
  if(document.f.pid.value=="")
      {  
        alert("Enter colum");
        document.f.pid.value="";
        document.f.pid.focus();
        return false;
      }
     else
     { 
       f .method="POST";
       f.action="./WorkAssignReportID.jsp?pid="+document.f.pid.value;
       f.submit();
     }     
   }
</script>
<body bgcolor="darkdarkblue" bordercolor=white>
<%@ page import="java.util.*,java.sql.*" %>
<%
  java.util.Date d=new java.util.Date();
  int dt=d.getDate();
  int m=d.getMonth();      
  int y=d.getYear();
  Connection con=null;
  Statement st=null;
  ResultSet rs=null; 
 int j=0;       
%>
<%@ page language="java"%>
<%@ page import="bean.Counter,java.util.*,java.lang.*"%>
<jsp:useBean id="counter"scope="session" class="bean.Counter" />
<jsp:useBean id="pr"scope="session" class="bean.ProjectReport" />
<%  //out.println(request.getParameter("pid"));
    String pid=request.getParameter("pid");
    pr.setProjectid(pid);
    
%>
<br><br>
<%
try
{Class.forName("oracle.jdbc.driver.OracleDriver");
 con=DriverManager.getConnection("jdbc:odbc:oracledsn","psismail","psis");
 st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
 String query="select MID,ATID,MP from module_details where pid='"+request.getParameter("pid")+"'";
 rs=st.executeQuery(query);
 while(rs.next())
    {
    j++;
    }
  j=j+6;
  rs.beforeFirst();
}
catch(Exception e)
  {
   e.printStackTrace();
  } 
%>
<form name=f method="POST">
<table border=1 align=center>
<tr>
<td rowspan=<%=j%>><strong><table border=1><tr><td bordercolor=darkwhite>EnterProjectID:</td><td bordercolor=darkwhite>
<%
 String f="p_id";
 String t="project_details";
counter.setTname(f,t);
Vector v=counter.getData();
int n=v.size();
   
   out.println("<select name=pid>");
  out.println("<option value="+"></option>");
   for(int i=0;i<n;i++)
	 {
	  
	   out.println("<option value="+v.elementAt(i)+">"+v.elementAt(i)+"</option>");
	 }
%></td></tr>
<tr>
<td align=center colspan=2 bordercolor=darkwhite><input type=submit name="clientsubmit" value="Show" onclick=valid()></td>
</tr>
</table>
</td>
</tr>
<tr>
<td align=center><strong><font color=blue>&nbsp;&nbsp;&nbsp;</strong></td>
<td align=right><strong><font color=blue>ProjectID:</strong></td>
<td align=center><lable><strong><% out.println(request.getParameter("pid"));%></strong></lable>
</tr>
<tr>
<td align=center><strong><font color=blue>&nbsp;&nbsp;&nbsp;</strong></td>
<td align=right><strong><font color=blue>ProjectName:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="pr" property="pname" /></trong></lable>
</tr>
<tr>
<td align=center><strong><font color=blue>&nbsp;&nbsp;&nbsp;</strong></td>
<td align=right><strong><font color=blue>No.Of Modules:<strong></td>
<td align=center><lable><strong><jsp:getProperty name="pr" property="nom" /></strong></lable>
</tr>
<tr>
<td align=center  colspan=3><strong><font color=green><i>ModuleDetails</strong></td>
</tr>
<tr><th>ModuleID</th><th>AssignTeam-ID</th><th>M-PlatForm</th></tr>
<%
 try{
  while(rs.next())
  {
  out.println("<tr>");
  out.println("<td align=center>"+rs.getString(1)+"</td>");
  out.println("<td align=center>"+rs.getString(2)+"</td>");
  out.println("<td align=center>"+rs.getString(3)+"</td>");
  out.println("</tr>");
  }
 st.close();
 con.close();
}
catch(Exception e)
 {
  e.printStackTrace();
 }
%>
<tr>
<td align=center colspan=6><strong><font color=blue>Client_Id:   <font color=red><i><jsp:getProperty name="pr" property="cid" /></font></strong></td>
</tr>
</table>
</form>
</body>
</html>
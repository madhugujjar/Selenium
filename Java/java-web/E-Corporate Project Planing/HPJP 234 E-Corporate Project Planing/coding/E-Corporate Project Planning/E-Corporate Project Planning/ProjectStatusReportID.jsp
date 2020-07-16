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
       f.action="./ProjectStatusReportID.jsp?pid="+document.f.pid.value;
       f.submit();
     }     
   }
function ps()
  {
    alert("this is statusok");
   f.method="POST";
   f.action="./ProjectStatusReportID.jsp?statu=chennai-ps";
   f.submit();     
  }
function alluser()
  {
   alert("this is ok");
   f.method="POST";
   f.action="./ProjectStatusReportID.jsp?allclients=thisalluser";
   f.submit();    
  }
</script>
<body bgcolor="darkdarkblue" bordercolor=white>
<%@ page import="java.util.*" %>
<%
  Date d=new Date();
  int dt=d.getDate();
  int m=d.getMonth();      
  int y=d.getYear();        
%>
<%@ page language="java"%>
<%@ page import="bean.Counter,java.util.*,java.lang.*"%>
<jsp:useBean id="counter"scope="session" class="bean.Counter" />
<jsp:useBean id="psr"scope="session" class="bean.ProjecStatustReport" />
<% 
  out.println("Project Id-----><font color=chennai><i><strong>"+request.getParameter("pid"));
  String pid=request.getParameter("pid");
  psr.setProjectId(pid);
 %>
<br><br>
<form name=f method="POST">
<table border=0 width=100%>
<tr>
<td rowspan=4 align=center><strong><table border=0><tr><td><strong>EnterProjectID:</td><td>
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
<td align=center colspan=2><br><input type=submit name="clientsubmit" value=" Show " onclick=valid()></td></tr></table>
</td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=center><strong><u><font color=blue>StatusReport :</font></u></strong></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=center><lable><strong><p><jsp:getProperty name="psr" property="work" /></strong></lable></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=center><strong><font color=blue>Client_Id:</font></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=center>
<lable><strong><jsp:getProperty name="psr" property="cid" /></strong></lable></td>
</tr>
<!--  <tr><td align=center colspan=6><br><br><br><strong><a href="./UC.html">Show Module Wise Status</a></strong></td></tr>-->
</table>
</form>
</body>
</html>
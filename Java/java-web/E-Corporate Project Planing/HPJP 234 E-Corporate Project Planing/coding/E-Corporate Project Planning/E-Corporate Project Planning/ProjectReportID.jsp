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
       f.action="./ProjectReportID.jsp?pid="+document.f.pid.value;
       f.submit();
     }     
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
<jsp:useBean id="pr"scope="session" class="bean.ProjectReport" />
<% //out.println(request.getParameter("pid"));
    String pid=request.getParameter("pid");
    pr.setProjectid(pid);
%>
<br><br>
<form name=f method="POST">
<table border=0>
<tr>
<td rowspan=7><strong><table border=1><tr><td bordercolor=darkwhite>EnterProjectID:</td><td bordercolor=darkwhite>
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
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>ProjectID:</strong></td>
<td align=center><lable><strong><% out.println(request.getParameter("pid"));%></strong></lable>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>ProjectName:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="pr" property="pname" /></trong></lable>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>No.Of Modules:<strong></td>
<td align=center><lable><strong><jsp:getProperty name="pr" property="nom" /></strong></lable>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>AssignTeam:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="pr" property="ateam" /></strong></lable></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Flatforms:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="pr" property="platform" /></strong></lable></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Client_Id:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="pr" property="cid" /></strong></lable></td>
</tr>
</table>
</form>
</body>
</html>
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
       f.action="./TimeSheetReportID.jsp?pid="+document.f.pid.value;
       f.submit();
     }     
   }
function ps()
  {
    alert("this is statusok");
   f.method="POST";
   f.action="./TimeSheetReportID.jsp?statu=chennai-ps";
   f.submit();     
  }
function alluser()
  {
   alert("this is ok");
   f.method="POST";
   f.action="./TimeSheetReportID.jsp?allclients=thisalluser";
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
<jsp:useBean id="tsr"scope="session" class="bean.TimeSheetReport" />
<% 
out.println("Project id--><font color=red><i>"+request.getParameter("pid"));
String st=request.getParameter("pid");
tsr.setProjectId(st);
//System.out.println(st);
%>
<br><br>
<form name=f method="POST">
<table border=0 align=center>
<tr>
<td rowspan=4 align=center><strong><table border=1 bordercolor=chennai><tr><td><strong>EnterProjectID:
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
	  
	   out.println("<option value="+v.elementAt(i)+">"+v.elementAt(i)+"</option>");}%></tr></td>
<tr><td align=center><br><input type=submit name="clientsubmit" value=" Show " onclick=valid()></td></tr></table>
</td>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Project Given Date :</font></strong></td>
<td align=right><strong><lable><jsp:getProperty name="tsr" property="givendate"/></lable></strong></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Client Req Date :</font></strong></td>
<td align=right><strong><lable><jsp:getProperty name="tsr" property="required"/></lable></strong></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Duration :</font></strong></td>
<td align=right><strong><lable><jsp:getProperty name="tsr" property="pgrdate" /><font color=red>(Days)</lable></strong></td>
</tr>
</tr>
<tr>
<td align=left colspan=7><strong><font color=blue><br>Project ClientID :</font></strong>
<lable><font color=red><i><jsp:getProperty name="tsr" property="clientid"/></font></lable></td>
</tr>
<tr>
<td rowspan=5 align=center><strong>Organization Time Details <em><font color=bhaskar> ==> </font></em></strong></td>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Project Start Date :</font></strong></td>
<td align=right><strong><lable><jsp:getProperty name="tsr" property="startdate" /></lable></strong></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Project Issue Date :</font></strong></td>
<td align=right><strong><lable><jsp:getProperty name="tsr" property="pidate"/></lable></strong></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Extended Issue Date :</font></strong></td>
<td align=right><strong><lable><jsp:getProperty name="tsr" property="eidate"/></lable></strong></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Duration :</font></strong></td>
<td align=right><strong><lable><jsp:getProperty name="tsr" property="duration2" /><font color=red>(Days)</lable></strong></td>
</tr>
</tr>
</table>
</form>
</body>
</html>
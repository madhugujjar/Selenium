<html>
<head>
<script language="javascript">
function val()
 {
 if(document.f.pid.value=="")
   {
     alert("Fill the project_id");
     document.f.pid.value="";
     document.f.pid.focus();
     return false;
   }
else
  if(document.f.status.value=="")
    {
     alert("write the status  of the project");
     document.f.status.value="";
     document.f.status.focus();
     return false;  
    }
else
    {
      f.action="./workstatu";
      f.submit()
    }
 }
</script>
</head>
<body method=post>
<%@ page import="java.util.*" %>
<%
  Date d=new Date();
  int dt=d.getDate();
  int m=d.getMonth();
  int y=d.getYear();
  Date to_date=new Date(dt,m,y);
%>
<%@ page language="java"%>
<%@ page import="bean.Counter,java.util.*,java.lang.*"%>
<jsp:useBean id="counter"scope="session" class="bean.Counter" />
<form name="f" method=post>
<table border="3" width=60% align=center bordercolor="black">
<tr bgcolor="#cccccc" bordercolor="#cccccc">
   <td colspan=2 ><em><strong><div align=center><font color="BLACK" size=5>Project Status 
   </font></div></strong></em>
   <em><strong><div align=right><font size=3 color="0033ff">Date:<% out.println(dt+"/"+(m+1)+"/"+(y+1900)); %>
   </font></div></strong></em><hr></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee"> 
   <td><em><strong><div align=right><font size=3 color="0033ff">ProjectID:</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff">
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
%></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc"> 
   <td><em><strong><div align=right><font size=3 color="0033ff">Write Completed Status :</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff"><textarea name="status" rows="8" columns="16"></textarea></font></div></strong></em></td>
</tr>
<tr bordercolor="#ffccaa " >
 <td colspan=2><em><strong><div align=center><font size=3 color="0033ff"><input type="submit" name=submit value="Insert" onClick=val()>  <input type="Reset" value="Reset"></font></div></strong></em></td>
   
</tr>
</table>
</form>
</body>
</html>
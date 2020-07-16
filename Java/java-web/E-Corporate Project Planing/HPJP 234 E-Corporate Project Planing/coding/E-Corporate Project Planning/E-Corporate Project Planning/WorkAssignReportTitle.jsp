<html>
<script>
function f()
{
 var d=new Date();
 //document.f1.t.value=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
  if(d.getSeconds()%2==0)
   {
   document.body.text="black" 
   }
  else
   {
   document.body.text="red" 
   }
 
 }
</script>
<head>
<%@ page import="java.util.*" %>
<%
  Date d=new Date();
  int dt=d.getDate();
  int m=d.getMonth();      
  int y=d.getYear();        
%>
<table align=center border=0>
<tr>
<td align=left><a href="./Reports.jsp" target="_top">Back To Reports</a></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><div align=RIGHT><font size=4 ><b><u>Work Assign Report</b></font></div></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><div align=left><em><strong><a href="./LoginForm.jsp" target="_top"><font color="red">Logout</font></a></strong></em></div></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td bgcolor=black><div align=left<em><strong><img src="./jpg/purhome.gif" width=25 height=25 usemap=#Map><map name="Map"><area shape="rect" coords="0,0,53,40" a href="./HomePage.jsp" target="_top" alt="Click Here To Go HomePage"></map></strong></em></div></td>
</tr>
</table>
<div align=right><% out.println(d);%></div>
</head>
<body bgcolor="lightgreen" onload="tt=setInterval('f()',1000);">
<form>
</form>
</table>
</body>
</html>
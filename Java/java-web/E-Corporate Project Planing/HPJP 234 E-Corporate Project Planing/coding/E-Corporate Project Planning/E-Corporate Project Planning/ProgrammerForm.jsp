<html>
<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%
  java.util.Date d=new java.util.Date();
  int dt=d.getDate();
  int m=d.getMonth();      
  int y=d.getYear();        
%>
<body bgcolor="#ffccaa">
<form method=post action="./sendmail">
<div align=right><h2>
<table>
<tr>
<td><div align=left><font size=4><b>PROJECT  STATUS  INFORMATION  SYSTEM</b></font></div></td>
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
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
 <td bgcolor=black><div align=left<em><strong><img src="./jpg/purhome.gif" width=25 height=25 usemap=#Map><map name="Map"><area shape="rect" coords="0,0,53,40" a href="./HomePage.jsp" target="_top" alt="Click Here To Go HomePage"></map></strong></em></div></td>
</tr>
</table>
</h2></div>
<hr color=blue>
<br><br><br>
<table align=center border=0>
<tr>
<td><input type=submit name=submit value="Show Work"></td>
</tr>
</table>
</form>
</body>
</html>


<html>
<body bgcolor="#EEEEFF">
<%@ page import="java.util.*" %>
<%
  Date d=new Date();
  int dt=d.getDate();
  int m=d.getMonth();      
  int y=d.getYear();        
%>
<%@ page language="java"%>
<%@ page import="bean.Counter,java.util.*,java.lang.*"%>
<jsp:useBean id="counter" scope="session" class="bean.Counter" />
<jsp:useBean id="tdb" scope="session" class="bean.TimeDetailsBean" />
<% 
 String st=request.getParameter("pid");
 tdb.setProjectId(st);
 String cid=tdb.getClientid();
 out.println("Client Id---------><font color=blue>"+cid);
%>
<form action="./timedetails" method="POST">
<table border="3" width=70% align=center  bordercolor="BLACK" >
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td colspan=2><em><div align=center><font size=6 color="BLACK"><i>Time Details </i></font></div></em>
  <strong><div align=right><font size=3 color="#0033ff">Date:<% out.println(dt+"/"+(m+1)+"/"+(y+1900)); %></font></div></strong>
  <hr></td>
</tr>
<tr bgcolor="#eeeeee"  bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">ProjectId:</font></div></strong></em></td>
<td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=pid value='<%=request.getParameter("pid")%>'></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">P Given Date :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=pgd value=<jsp:getProperty name="tdb" property="givenDate" />></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee"  bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">P Start Date:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=psd value=<jsp:getProperty name="tdb" property="startdate" />></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">C Required Date:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=crd value=<jsp:getProperty name="tdb" property="required" />></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">P Issue Date:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=id size=12 value=<jsp:getProperty name="tdb" property="required" />></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc" >
  <td><em><strong><div align=right><font size=3 color="#0033ff">Extend Issue Date:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=eid size=12><font size=1>(eg 06-05-2004)</font></font></div></strong></em></td>
</tr>
<tr  bordercolor="#ffccaa">
  <td><em><strong><div align=right><font size=3 color="#0033ff"><input type="submit" value="Submit"></font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type="Reset" value="Reset"></font></div></strong></em></td>
</tr>
</table>
</form>
</body>
</html>


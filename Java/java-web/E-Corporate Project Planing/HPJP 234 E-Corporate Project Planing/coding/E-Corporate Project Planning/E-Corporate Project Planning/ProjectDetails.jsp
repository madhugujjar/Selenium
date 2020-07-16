<html>
<body bgcolor="#EEEEFF">
<%@ page import="java.io.*, java.sql.* ,java.lang.*,java.util.*"%>
<%
  java.util.Date d=new java.util.Date();
  int dt=d.getDate();
  int m=d.getMonth();      
  int y=d.getYear();        
%>
<%@ page language="java"%>
<%@ page import="bean.Counter,java.util.*,java.lang.*"%>
<jsp:useBean id="counter"scope="session" class="bean.Counter" />
<jsp:useBean id="pk"scope="session" class="bean.PrimaryKeyGen" />
<form action="./projectdetails" method="POST">
<table border="3" width=65% align=center  bordercolor="BLACK" >
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td colspan=2><em><div align=center><font size=6 color="BLACK"><i>Project Registration </i></font></div></em>
  <strong><div align=right><font size=3 color="#0033ff">Date:<% out.println(dt+"/"+(m+1)+"/"+(y+1900)); %></font></div></strong>
  <hr></td>
</tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
<td><em><strong><div align=right><font size=3 color="#0033ff">ClientID:</font></div></strong></em></td>
<td><em><strong><div align=left><font size=3 color="#0033ff">
 <%
  String f="clientid";
  String t="client_details";
  counter.setTname(f,t);
  Vector v=counter.getData();
   int n=v.size();
   
   out.println("<select name=cid>");
   out.println("<option value="+"></option>");
   for(int i=0;i<n;i++)
	 {
	  
	   out.println("<option value="+v.elementAt(i)+">"+v.elementAt(i)+"</option>");
	 }
%>
</font></div></strong></em></td>
 
</tr>
<tr bgcolor="#eeeeee"  bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">ProjectID :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=pid size=12 value='<%=pk.getProjectId()%>'></font></div></strong></em></td></tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">ProjectName:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=pname size=12></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">No.Mudules:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=modul size=12></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc" >
  <td><em><strong><div align=right><font size=3 color="#0033ff">ProjectStartDate:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=startdate size=12><font size=0>(eg 12-mar-2005)</font></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee"  bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">AssignTeams:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=assteam size=12></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc">
<td><em><strong><div align=right><font size=3 color="0033ff">PlatForm:</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff">
   <select name=frontend size=1>
   <option value="JAVA">Java</option> 
   <option value="J2EE">J2EE</option>
   <option value="J2SE">J2SE</option>
   <option value=".NET">.NET</option>
   <option value="VB">VB</option>
   <option value="C">C</option>
   <option value="C++">C++</option>
   <option value="SAP">SAP</option>
   </select>
   <select name=backend size=1>
   <option value="SQL">SQL</option> 
   <option value="MYSQL">MYSQL</option>
   <option value="MS-ACC">MS-ACC</option>
   <option value="FOXPRO">FOXPRO</option>
   <option value="CYBASE">CYBASE</option>
   </select>
   </font></div></strong></em></td>
</tr>
<tr  bordercolor="#ffccaa">
  <td><em><strong><div align=right><font size=3 color="#0033ff"><input type="submit" value="Submit"></font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type="Reset" value="Reset"></font></div></strong></em></td>
</tr>
</table>
</form>
</body>
</html>


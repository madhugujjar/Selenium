<html>
<body bgcolor="#EEEEFF">
<%
  java.util.Date d=new java.util.Date();
  int dt=d.getDate();
  int m=d.getMonth();      
  int y=d.getYear();        
%>
<%@ page language="java"%>
<%@ page import="bean.Counter,java.util.*,java.lang.*"%>
<jsp:useBean id="counter"scope="session" class="bean.Counter" />
<form method="Post" action="./employedetails">
<table border="3" width=60% align=center  bordercolor="BLACK" >
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td colspan=2><em><div align=center><font size=5 color="BLACK"><i>Employee Registration </i></font></div></em>
  <strong><div align=right><font size=3 color="#0033ff">Date:<% out.println(dt+"/"+(m+1)+"/"+(y+1900)); %></font></div></strong>
  <hr></td>
</tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">EmployID :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=empid size=12 initialvalue="333"></font></div></strong></em></td></tr>
<tr bgcolor="#eeeeee"  bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">ProjectID :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff">
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
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">EmployName:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=empname size=12></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">TeamID :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff">
<%
  String f1="t_id";
  String t1="team_creation";
  counter.setTname(f1,t1);
  v=counter.getData();
  n=v.size();
   
   out.println("<select name=tid>");
   out.println("<option value="+"></option>");
   for(int i=0;i<n;i++)
	 {
	  
	   out.println("<option value="+v.elementAt(i)+">"+v.elementAt(i)+"</option>");
	 }
%></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc" >
  <td><em><strong><div align=right><font size=3 color="#0033ff">Role :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff">
  <select name=role size=1>
  <option value="Programmer">Programmer</option>
  <!--  <option value="Designer">Designer</option> 
    <option value="Tester">Tester</option>
  <option value="Manager">Manager</option>
 <option value="Coder">Coder</option>//-->
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


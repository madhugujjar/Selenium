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
<form action="./moduledetails" method="POST">
<table border="3" width=40% align=center  bordercolor="BLACK" >
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td colspan=2><em><div align=center><font size=6 color="BLACK"><i>Module Registration </i></font></div></em>
  <strong><div align=right><font size=3 color="#0033ff">Date:<% out.println(dt+"/"+(m+1)+"/"+(y+1900)); %></font></div></strong>
  <hr></td>
 </tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">ModuleID :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=mid size=12 initialvalue="333"></font></div></strong></em></td></tr>
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
%>
</font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">AssignTeamID:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff">
<%
  String f1="t_id";
  String t1="team_creation";
  counter.setTname(f1,t1);
  v=counter.getData();
  n=v.size();
   
   out.println("<select name=atid>");
   out.println("<option value="+"></option>");
   for(int i=0;i<n;i++)
	 {
	  
	   out.println("<option value="+v.elementAt(i)+">"+v.elementAt(i)+"</option>");
	 }
%></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">MdulAssignDate :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=cid size=12>
  </font><font size=1 color="0033ff">(eg 02-MAR-2005)</font></div></strong></em></td></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc" >
  <td><em><strong><div align=right><font size=3 color="#0033ff">DateToSubmit:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=dsubmit size=12><font size=1>(eg 08-feb-2004)</font></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
<td><em><strong><div align=right><font size=3 color="0033ff">ModulPlatForm:</font></div></strong></em></td>
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
   <option vale="sql">SQL</option>
   </select>
   </tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc" >
  <td><em><strong><div align=right><font size=3 color="#0033ff">ModuleDescription:</font></div></strong></em></td>
  <td><textarea name=des columns=5 rows=5></textarea></td>
</tr>

<tr  bordercolor="#ffccaa">
  <td><em><strong><div align=right><font size=3 color="#0033ff"><input type="submit" value="Submit"></font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type="Reset" value="Reset"></font></div></strong></em></td>
</tr>
</table>
</form>
</body>
</html>


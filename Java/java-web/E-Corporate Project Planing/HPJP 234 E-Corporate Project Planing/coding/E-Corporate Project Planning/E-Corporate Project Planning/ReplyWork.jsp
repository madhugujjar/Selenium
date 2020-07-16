<html>
<head>
</head>
<script language="javascript">
 function vali()
 {
 if(document.f.to.value=="")
 {
 alert("Fill To Field");
 document.f.to.value="";
 document.f.to.focus()
 return false;
 }
else
 if(document.f.subject.value=="")
 {
 alert("Fill Subject Field");
 document.f.subject.value="";
 document.f.subject.focus()
 return false;
 }
else
  if(document.f.from.value=="")
   {
    alert("Fill From Field ");
    document.f.from.value="";
    document.f.from.focus()
    return false;
   }
else
  if(document.f.eid.value=="")
   {
    alert("Enter Emp ID");
    document.f.eid.value="";
    document.f.eid.focus()
    return false;
   }
else
  if(document.f.work.value=="")
    {
    alert("Assign Work In Message box");
    document.f.work.value="";
    document.f.work.focus()
    return false;
   }
else
{
	f.action="./workassignment"
        f.submit();
}
 }
 </script>
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
<jsp:useBean id="counter"scope="session" class="bean.Counter" />
<form name="f" method="POST">
<table border="0" width=70% align=center  bordercolor="BLACK" >
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td colspan=2><em><div align=center><font size=6 color="BLACK"><i>Submit Work Form</i></font></div></em>
  <strong><div align=right><font size=3 color="#0033ff">Date:<% out.println(dt+"/"+(m+1)+"/"+(y+1900)); %></font></div></strong>
  </td>
</tr>
</table>
<hr color=blue>
<table border="3" width=80% align=center  bordercolor="BLACK">
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">To:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=to size=20 initialvalue="333"></font></div></strong></em></td></tr>
<tr bgcolor="#eeeeee"  bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">Subject:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=subject size=20></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">From :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=from size=20></font></div></strong></em></td>
</tr>

<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">Emp_ID:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff">
<%
 String f="EmpId";
 String t="Employe_Details";
counter.setTname(f,t);
Vector v=counter.getData();
int n=v.size();
   
   out.println("<select name=eid>");
  out.println("<option value="+"></option>");
   for(int i=0;i<n;i++)
	 {
	  
	   out.println("<option value="+v.elementAt(i)+">"+v.elementAt(i)+"</option>");
	 }
%>
</td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">Message:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><textarea name=work rows="8" cols="32"></textarea></font></div></strong></em></td>
</tr>
<tr  bordercolor="#ffccaa">
  <td><em><strong><div align=right><font size=3 color="#0033ff">&nbsp;</font></div></strong></em></td>
  <td><em><strong><div align=center><font size=3 color="#0033ff"><input type="submit" onclick=vali() value="S e n d" name="mail"> <input type="Reset" value="R e s e t"></font></div></strong></em></td>
</tr>
</table>
</form>
</body>
</html>


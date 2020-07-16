<html>
<script language=javascript>
function valid()
 {
  if(document.f.cid.value=="")
    {
    alert("Enter colum");
    document.f.cid.value="";
    document.f.cid.focus();
    return false;
   }
  else
    {
     f.action="./ClientID.jsp?cid="+document.f.cid.value;
     f.submit();
     }
 }
</script>
<body bgcolor="darkdarkblue">
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
<br><br><br><br><br>
<form name=f method=post>
<table border=0 align=center>
<tr>
<td rowspan=5><td><strong>EnterClientID:</strong></td>
<td>
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
%></td>
</tr>
<tr>
<td colspan=2 align=center><input type=submit name=clientsubmit value=" Show " onclick=valid()></td>
</tr>
</table>
</form>
</body>
</html>


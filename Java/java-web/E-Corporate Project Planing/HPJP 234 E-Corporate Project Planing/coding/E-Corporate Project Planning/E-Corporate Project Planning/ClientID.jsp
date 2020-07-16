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
       f .method="POST";
       f.action="./ClientID.jsp?cid="+document.f.cid.value;
       f.submit();
     }     
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
<jsp:useBean id="cr"scope="session" class="bean.ClientReport" />
<% //out.println(request.getParameter("cid"));
  String cid=request.getParameter("cid");
  cr.setClientid(cid);
%>
<br><br>
<form name=f method="POST">

<table border=0 width=80%>
<tr>
<td rowspan=7><strong><table border=1 bordercolor=chennai><tr><td bordercolor="darkdarkblue"><strong>EnterClientID:</td><td bordercolor="darkdarkblue">
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
%></td></tr>
<tr><td align=center colspan=2 bordercolor="darkdarkblue"><input type=submit name="clientsubmit" value=" Show " onclick=valid()></td></tr>
</table>
</td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>ClientID:</strong></td>
<td align=center><lable><strong><%=request.getParameter("cid")%></strong></lable>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>ClientName:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="cr" property="cname" /></trong></lable>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Ph No:<strong></td>
<td align=center><lable><strong><jsp:getProperty name="cr" property="phno" /></strong></lable>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Mail_Id:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="cr" property="mailid" /></strong></lable></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>RequiredFlatform:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="cr" property="platform" /></strong></lable></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align=right><strong><font color=blue>Project_Id:</strong></td>
<td align=center><lable><strong><jsp:getProperty name="cr" property="pid" /></strong></lable></td>
</tr>
</table><br><center>
</form>
</body>
</htmdl>
<html>
<div align=right><a href="./ProjectLeaderFrame.html" target=_top><img src="./jpg/blanprev.gif" width=30 height=30></img></a><div>
<body bgcolor=#FFECEC>
<%
 String tname=request.getParameter("tablename");
 String sub=request.getParameter("subject");
 //System.out.println(tname+" "+sub);
%>
<%@ page language="java"%>
<%@ page import="reportbean.MailAccess,java.util.*,java.lang.*"%>
<jsp:useBean id="mail"scope="session" class="reportbean.MailAccess" />
<%
  mail.setSubject(tname,sub);
%>
<center><h3><font color=megantha>Work   Details</font></h3></center>
<table align=center border=1 width=50%>
<tr>
<td align=center><font size=4 color=blue>Subject :</td>
<td align=center>
<jsp:getProperty name="mail" property="subject" />
</td>
</tr>
<tr>
<td align=center><font size=4 color=blue>SendDate :</td>
<td align=center>
<jsp:getProperty name="mail" property="pdate" />
</td>
</tr>
<tr>
<td align=center><font size=4 color=blue>From:</td>
<td align=center>
<jsp:getProperty name="mail" property="fromid" />
</td>
</tr>
<tr>
<td align=center><font size=4 color=blue>Message :</td>
<td align=center bgcolor=white>
<jsp:getProperty name="mail" property="message" />
</td>
</tr>
</body>

</html>

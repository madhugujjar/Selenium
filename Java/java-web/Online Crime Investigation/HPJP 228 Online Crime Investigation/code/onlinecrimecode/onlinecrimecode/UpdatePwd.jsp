<title>Customer Password Changing</title>
<%@page import="java.sql.*,CMST.*" %>

  <jsp:include page="ShowHeader.jsp" />
  
  <HTML><HEAD>
  
  <LINK href="css/styles.css" type=text/css rel=stylesheet>
      
      
  <BODY bgcolor=lightyellow onload="setfocus()"><A name=Entity_1></A>


<%
int regid=0;
Connection con=null;
   ResultSet rs=null;
   
   
try
{

  ConnectionBean CBean=new ConnectionBean();

  
  
  
  
  
  String txtnpwd=request.getParameter("txtnpwd");
  String uid=request.getParameter("txtuid");
  String txtopwd=request.getParameter("txtopwd");
    
  int updated=CBean.executeUpdate("update login_master set user_pwd='" + txtnpwd + "' where user_id='" + uid + "' and user_pwd='" + txtopwd + "' ");
  
  
  
  
  %>
  

  
  <jsp:forward page="PwdChanged.jsp" />
  



<%
}catch(Exception ex)
{
     out.println("Error At " + ex);
}
 %>

  
  
<h3>Password Changing</h3>

<form name="f1"  action="UpdatePwd.jsp">

</form>
<br>
<br>
<br>
<br>

<br>

<br>


<jsp:include page="Footer.htm" />

</body>
</html>

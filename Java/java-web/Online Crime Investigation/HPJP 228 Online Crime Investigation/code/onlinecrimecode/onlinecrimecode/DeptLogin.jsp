
<%@page import="java.sql.*,CMST.*" %>


<%

  try
  {
    ConnectionBean CBean=new ConnectionBean();
    Connection con=CBean.getConnection();
    String loginName=request.getParameter("cLid");
    String cPwd=request.getParameter("cPwd");
    ResultSet custrs=CBean.executeQuery("select reg_id,login_type from login_master where user_id='" + loginName + "' and user_pwd='" + cPwd + "' ");
    if(custrs.next())
    {
          String regid=custrs.getString(1);
    	  session.putValue("regid",regid);
    	 
    	 String login_type=custrs.getString(2);
    
    if(login_type.equals("D"))
    	 {
    	       System.out.println("Is  Valid");
		%>
	
		<jsp:forward page="DepartmentHome.jsp" />
	
		<%
		
    	 	
    	 }else 
    	 {
    	 %>
    	      	<jsp:forward page="ErroLogin.jsp" />
    	 
    	 <%
    	 
	 }
	 
	 
	 
	}else
	{
	%>
	
		
		<jsp:forward page="ErroLogin.jsp" />
<%

    }
    	
  }catch(Exception ex)
  {
     System.out.println(ex);
  }


%>

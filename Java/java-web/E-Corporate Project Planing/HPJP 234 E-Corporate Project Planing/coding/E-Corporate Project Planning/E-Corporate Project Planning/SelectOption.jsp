<html>
<body>
<%@ page import="java.io.*, java.sql.* ,java.lang.*,java.util.*"%>

<%
  Connection con;
  Statement st;
  ResultSet rs;
  Vector v=new Vector();
 try{Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
   st=con.createStatement();
   rs=st.executeQuery("select *from emp");
%>
<table border=1 align=center>
<tr><td>
<%
    while(rs.next())
    {
     v.addElement(new Integer(rs.getInt(1)));
	}
   
   int n=v.size();
   out.println("SelectName :<select name=uid>");
    for(int i=1;i<=n;i++)
	 {
	  
	   out.println("<option value="+v.elementAt(i)+">"+v.elementAt(i)+"</option>");
	 }

	    
 rs.close();
 st.close();
 con.close();
}
catch(Exception e)
  {
   out.println(e.getMessage());
 }

%>
</td></tr></table>
</body>
</html>      
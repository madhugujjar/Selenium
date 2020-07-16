<html>
<body bgcolor="#EEEEFF">
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*,java.sql.*" %>
<%! int dt,m,y;%>
<%! String date=null;%>
<%
  java.util.Date d=new java.util.Date();
  int dt=d.getDate();
  int m=d.getMonth();      
  int y=d.getYear();        
%>
<%
  Connection con;
  Statement st;
  ResultSet rs;
  Vector v=new Vector();
 try{Class.forName("oracle.jdbc.driver.OracleDriver");
   con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
   st=con.createStatement();
  //ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
   rs=st.executeQuery("select p_id from project_details");
%>
<form method=post action="./teamcreation">
<table border="3" width=40% align=center  bordercolor="BLACK" >
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td colspan=2><em><div align=center><font size=6 color="BLACK"><i>Team Registration </i></font></div></em>
  <strong><div align=right><font size=3 color="#0033ff">Date:<% out.println(dt+"/"+(m+1)+"/"+(y+1900)); %></font></div></strong>
  <hr></td>
</tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">Team_ID :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=tid size=12 initialvalue="333"></font></div></strong></em></td></tr>
<tr bgcolor="#eeeeee"  bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">Team_Leader :</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=tl size=12></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc"  bordercolor="#cccccc">
  <td><em><strong><div align=right><font size=3 color="#0033ff">Team_Size:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=tsize size=12></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
  <td><em><strong><div align=right><font size=3 color="#0033ff">Project_ID:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff">
<%
    v.clear();
    while(rs.next())
    {
     v.addElement(rs.getString(1));
    }
   
   int n=v.size();
   
   out.println("<select name=pid>");
  out.println("<option value="+"></option>");
   for(int i=0;i<n;i++)
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
</font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc" >
  <td><em><strong><div align=right><font size=3 color="#0033ff">Module_Givent_Date:</font></div></strong></em></td>
  <td><em><strong><div align=left><font size=4 color="#0033f"><input type=text name=pgd size=12> 
  </font><font size=1 color="0033ff">(eg 02-MAR-2005)</font></div></strong></em></td></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#cccccc" >
  <td><em><strong><div align=right><font size=3 color="#0033ff">Module_Start_Date:</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="#0033ff"><input type=text name=psd size=12></font><font size=1 color="0033ff">(eg 02-MAR-2005)</font></div></strong></em></td></font></div></strong></em></td>
</tr>

<tr  bordercolor="#ffccaa">
  <td><em><strong><div align=right><font size=3 color="#0033ff"><input type="submit" value="Submit"></font></div></strong></em></td>
  <td><em><strong><div align=left><font size=3 color="#0033ff"><input type="Reset" value="Reset"></font></div></strong></em></td>
</tr>
</table>
</form>
</body>
</html>


<%@page import="java.sql.*,CMST.*,java.util.*,java.lang.*" %>
<style>
a
{
           color:"Black";
           text-decoration:none;
}
a:hover
{
            color:Gray;
            text-decoration:underline;

}
</style>
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<HTML><HEAD><TITLE>Complaints Status</TITLE>
<META>

<body >

<jsp:include page="CompDHeader.jsp" />


<form  action="Complaints.jsp">
<BODY ><A name=Entity_1></A>
<DIV ><TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0 > <TBODY> 
</DIV>
  <TR>
<td>
<%

 Connection con=null;
 ResultSet rs=null;
 ConnectionBean CBean=new ConnectionBean();
 con=CBean.getConnection();
 Statement stmt=con.createStatement();
 String  regid=session.getValue("regid") + "";
 String sts[]=request.getParameterValues("sts");
 System.out.println("Complaint id");       
 String cmpid[]=new String[1000];
 System.out.println("Complaint id");       
 int j=0;

    
if(sts!=null)
{
   System.out.println("status not nullComplaint id");   
   rs=stmt.executeQuery("select complaint_id from complaint_reg where department_id='" + regid + "' ");
  
  while(rs.next())
 {
   //System.out.println("Complaint id"+ rs.getString(1));
   cmpid[j]=rs.getString(1);
   System.out.println(cmpid[j] + "Complaint id");     
   j++;
  
 }
 j=0;
 
 rs.close();
  

      for(int i=0;i<sts.length;i++)
      {
	                      
	                      
	                      
	                      try
			       {
 
	                      
	                      System.out.println(sts[i]);
	                      stmt.executeUpdate("update  complaint_reg  set status='" + sts[i] + "' where complaint_id=" + cmpid[i] + " ");
                              System.out.println("In Updation");
                              System.out.println("In Updation");
                              
                              }catch(Exception ex)
                              {
                                 System.out.println("Error " + ex);
                               
                              }
                              
      
      }
      
      
}

%>



<%
try
{
  
  rs=CBean.executeQuery("select c.complaint_id,c.prob_desc,c.status,p.area,c.ctype,to_char(c.cdate,'dd-mm-yyyy') from complaint_reg c ,police_department p  where c.department_id='" + regid + "' and p.department_id=c.department_id  order by complaint_id ");
%>

<center><h3 >REQUESTED COMPLAINT INFORMATION</h3> </center>
<table align=center border=1 colspace=10>
<th class=tabhead3>Complaint Id
<th class=tabhead3>Problem Description
<th class=tabhead3>Area
<th class=tabhead3>Complaint Type
<th class=tabhead3>Complaint Date

<th class=tabhead3>Status

<th class=tabhead3>Modify


<%
while(rs.next())
{
 String cid=rs.getString(1);
%>
<tr>
<td class=tabhead1><%=cid%></td>
<td class=tabhead1><%=rs.getString(2) %></td>
<td class=tabhead1><%=rs.getString(4) %></td>
<td class=tabhead1><%=rs.getString(5) %></td>
<td class=tabhead1><%=rs.getString(6) %></td>

<%
String status=rs.getString(3);
%>
<td class=tabhead1><%=status%></td>
<td class=tabhead1>
<select name=sts>


<%

System.out.println("In Status " + status);
if(status.equals("Pending"))
{
System.out.println("In Pending" + status);
%>
<option class=tabhead1  selected >Pending</option>
<option class=tabhead1>Process</option>
<option class=tabhead1>Closed</option>
 

<%
}else if(status.equals("Process"))
{
System.out.println("In Process" + status);
%>
<option class=tabhead1>Pending</option>
<option class=tabhead1 selected>Process</option>
<option class=tabhead1>Closed</option>
 

<%
}else if(status.equals("Closed"))
{
%>
  <option class=tabhead1>Pending</option>
  <option class=tabhead1>Process</option>  
  <option class=tabhead1 selected>Closed</option>
  <option class=tabhead1>ReOpen</option>
  
<%
 
 }else if(status.equals("ReOpen"))
{
%>
  <option class=tabhead1>Pending</option>
  <option class=tabhead1>Process</option>  
  <option class=tabhead1 >Closed</option>
  <option class=tabhead1 selected>ReOpen</option>
  
<%
}
%>

</select>
</td>
</tr>

<%
}





}catch(Exception ex)
{
%>
 <b>
<%
  out.println("Error While Connecting DataBase" + ex);
}
%>




</table>
<center>
<table>
<tr>

<td ><input type=submit value="Update"></td>
</table>
</center>

</form>
</body>
</html>
</td>





  </TR>
</TBODY></TABLE>
<br>
<br>
<br>
<jsp:include page="Footer.htm" />

</BODY>
</HTML>

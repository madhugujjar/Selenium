<%@page import="java.sql.*,CMST.*" %>


<LINK href="css/styles.css" type=text/css rel=stylesheet>
<BODY ><A name=Entity_1></A>
<DIV class=caption1><TABLE class=tabformat width="20%" border=0> </DIV>
<TBODY>
  <TR>
<%
   ResultSet rs=null;
   ResultSet ar_rs=null;
   Statement stmt=null;
   String area=null;
   
try
{

   Connection con=null;
   ConnectionBean CBean=new ConnectionBean();
   con=CBean.getConnection();
   
 
   
   stmt=con.createStatement();
  String dat1="12/28/06";
    

 int Updated=stmt.executeUpdate("insert into date1 values(to_date('" + dat1 + "','dd-mm-yyyy'))");
 
  


}catch(Exception ex)
{
     System.out.println("Error Atcxc " + ex);
}
 %>

</tr>
</td>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value="Update" onclick="return CheckInput()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="  Close  " onclick="Close()"></td>
</tr>
</table>
<br>
<br>
<br>
<br>



</form>
<jsp:include page="Footer.htm" />

</body>
</html>

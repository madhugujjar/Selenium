<title>Complaint Status Form</title>

<script>

function Go()
{

f.action="ComplaintStatus.jsp";

}

function CheckInput()
{

if(!(f.dtw.checked) && !(f.ct.checked))
{
  alert("Select Search Option");
 return false;
 
}


if(f.dtw.checked)
{
 if(f.fdt.value=="" && f.tdt.value=="")
 {
   alert("Please Select Valid dates");
   return false;
   
 }
 
}
 
 if(f.ct.checked)
 {
    if(f.ctype.selectedIndex==0)
   {
    alert("Please Select Complaint Type");
    return false;
   }
  
 }
 
 

if((f.dtw.checked) && (f.ct.checked))
{

f.action="ShowDTCComplaint.jsp";



}else if(f.dtw.checked)
{

f.action="ShowDTComplaint.jsp";


}else if(f.ct.checked)
{

f.action="ShowCTComplaint.jsp";


}








 
 
 


}

function Update(cid)
{
  alert(cid);
  window.open("UpdateComp.jsp?cid="+ cid + " ","popup","width=600,height=400");
  
}

</script>

<%@page import="java.sql.*,CMST.*" %>
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
<jsp:include page="CmpstHeader.jsp" />

<LINK href="css/styles.css" type=text/css rel=stylesheet>


<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<form name=f>
<A name=Entity_1></A>


<TR>
<td>

<%
try
{

 
	int regid=Integer.parseInt(session.getValue("regid") + "");
 
 Connection con=null;
 ResultSet rs=null;
 ConnectionBean CBean=new ConnectionBean();
 con=CBean.getConnection();
 
 
 
 rs=CBean.executeQuery("select c.complaint_id,c.prob_desc,c.status,p.area,c.ctype,to_char(c.cdate,'dd-mm-yyyy') from complaint_reg c ,police_department p  where c.customer_id=" + regid + " and p.department_id=c.department_id  order by complaint_id ");
%>

<center><h3 >COMPLAINT STATUS INFORMATION</h3> </center>
<table align=center border=1 colspace=10>
<th class=tabhead3 >Complaint Id
<th class=tabhead3 >Problem Description
<th class=tabhead3 >Area
<th class=tabhead3 >Complaint Type
<th class=tabhead3 >Complaint Date
<th class=tabhead3 >Status
<th class=tabhead3 >Check

<%
while(rs.next())
{
 
String cid=rs.getString(1);

%>
<tr>


<td class=tabhead1><%=cid %></td>
<td class=tabhead1><%=rs.getString(2) %></td>
<td class=tabhead1><%=rs.getString(4) %></td>

<td class=tabhead1><%=rs.getString(5) %></td>
<td class=tabhead1><%=rs.getString(6) %></td>

<%
String status=rs.getString(3);



%>


<td class=tabhead1><%=status%></td>
<%

if(status.equals("Pending"))
{
%>


<td class=tabhead1><a style={cursor:hand} onclick="Update(<%=cid%>)">Update</a></td>

<%
}else
{
%>
<td class=tabhead1 disabled>Update</td>
<%
}
%>



</tr>


<%
}
}catch(Exception ex)
{
%>

<%
  out.println("Error While Connecting DataBase" + ex);
}
%>



 <b>


</table>
<br>
<br>


<table align=center>


<tr>

<TD ALIGN=left><b><input type=checkbox value="Check" class=tabhead1 name=dtw >DateWise     &nbsp;&nbsp; &nbsp;&nbsp;
 &nbsp;&nbsp;
  &nbsp;&nbsp;
   &nbsp;&nbsp;
   From</b></td><td>
        <input type="text" name="fdt" readonly value="" maxlength=30 size=12  >
        <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.f.fdt);
				 return false;" HIDEFOCUS tabIndex=5>
			<img name="popcal" align="absmiddle" src="Calendar\calbtn.gif" width="34" height="22" border="0" alt="">

&nbsp;&nbsp; &nbsp;&nbsp;
 &nbsp;&nbsp;
  &nbsp;&nbsp;
   &nbsp;&nbsp;
   </td><td>
  <b> To</b></td><td>
  
  
        <input type="text" name="tdt" readonly value="" maxlength=30 size=12  >
        <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.f.tdt);
				 return false;" HIDEFOCUS tabIndex=5>
			<img name="popcal" align="absmiddle" src="Calendar\calbtn.gif" width="34" height="22" border="0" alt="">
			
			
			
</TR>
<br>
<br>
<tr>
<tr>
<tr>
<tr>
<tr>


<tr>
<td><input type=checkbox value="Check" class=tabhead1 name=ct><b>Complaint Type</b>
<td class=tabhead2><select  name="ctype">
<option selected>---Select Complaint Type---</option>
<option >Crime</option>
<option >Civil</option>
<option >Traffic</option>
</select>

</tr>
<tr>
<tr>
<tr>
<tr>

<tr>
<td><input type=submit value="Search"  onclick="return CheckInput()">
<td><input type=submit value="Show All"  onclick="Go()">

</tr>


</table>

</form>
</body>
</html>


<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="Calendar\ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;">
</iframe> 



</td>





  </TR>
</TBODY></TABLE>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<jsp:include page="Footer.htm" />

</BODY>
</HTML>

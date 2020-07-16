<script>

function CheckLogin()
{
  
 if(f.cLid.value=="")
 {
   alert("Please Enter Login Name");
   f.cLid.focus();
   
   
   return false;
   
 }else if(f.cPwd.value=="")
 {
   alert("Please Enter Password");
    f.cPwd.focus();
   return false;
 }else
 {
   
  f.action="UserLogin";
  f.submit();
 }
 
 
}
function Clear()
{
  f.cLid.value="";
  f.cPwd.value="";
  return false;
}
</script>
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
<HTML><HEAD><TITLE>Home Page</TITLE>
<META><LINK href="css/simple.css" type=text/css type=text/css rel=stylesheet>
<BODY class=rightPage><A name=Entity_1></A>
<DIV class=caption1>CONTENT MANAGEMENT SYSTEM</DIV>
<form name=f method=post>
<b><a href ="CMSHome.html" >Home</a></b>
<DIV class=caption2>General info</DIV>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0 >
  <TBODY>
  <TR>
	<TD class=tabhead width="15%"><a href="RequisitionForm.jsp">Requisition</a></TD>
    <TD class=tabhead width="15%"><a href="ServiceDetails.jsp">About Service</a></TD>
    <TD class=tabhead width="15%"><a href="CustLogin.jsp">Uploading</a></TD>
    <TD class=tabhead width="15%"><a href="ShowTemplates.jsp">Templates</a></TD>
    <TD class=tabhead width="15%"><a href="LoginCheck">Administration</a></TD>
    <TD class=tabhead width="15%"><a href="AboutUs.jsp">About Us</a></TD>
    <TD class=tabhead width="15%"><a href="ContactUs.jsp">Contact Us</a></TD>
  </TBODY></TABLE>
<br>
<br>
<br>
<br>
<center>
<h1><b>Login</b></h1>
<table border="0" >
<tr>
<td class=tabhead><b>Customer Login Name :</b>
<td class=tabhead><input type="text" name="cLid"></td></tr>
<td class=tabhead><b>Customer Password :</b></td>
<td class=tabhead><input type=password name="cPwd" ></td></tr>
<tr>
<td><center><img src="IMAGES/Login1.jpg" style={cursor:hand} heigth="1" width="70"  onclick="CheckLogin()"></img>&nbsp;&nbsp;&nbsp;&nbsp;<img src="IMAGES/Clear.jpg" heigth="1" width="70"  style={cursor:hand} onclick="return Clear()"></img></center></td>
</tr>
</table>

  </center>
<br>
<br>
<br>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TR>
    <TD class=tabhead width="10%"><H4><center>This is a Customer Domain  Registration and Service Management System Site</center></TD>
 </TR>
  <tr>
    <TD class=tabhead width="35%"><marquee><b>24 Hours Application dovelopment and Hosting Service </b></marquee></a></TD>
  </tr>
</TABLE>

</form>
</BODY></HTML>

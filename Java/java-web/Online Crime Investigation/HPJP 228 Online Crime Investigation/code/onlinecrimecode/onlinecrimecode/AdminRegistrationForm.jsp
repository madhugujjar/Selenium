<script>
function CheckInput()
{
if(f1.aid.value=="")
{
   alert("Please Enter Admin Id");
   return false;
}else if(f1.apwd.value=="")
{
   alert("Please Enter Admin Password");
   return false;
}else if(f1.cmp.value=="")
{
  alert("Please Enter Company Name");
  return false;
}else if(f1.AdminAdd.value=="")
{
  alert("Please Enter Company Address");
  return false;
}else if(f1.cno.value=="")
{
  alert("Please Enter Contact Number");
  return false;
}else if(f1.EmailId.value=="")
{
  alert("Please Enter Email Id");
  return false;
}

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
<HTML><HEAD><TITLE>Home Page</TITLE>
<META><LINK href="css/simple.css" type=text/css type=text/css rel=stylesheet>
<DIV class=caption1>CONTENT MANAGEMENT SYSTEM</DIV>
<b><a href ="CMSHome.html" >Home</a></b>
<DIV class=caption2>General info</DIV>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0 >
  <TBODY>
  <TR>
    <TD class=tabhead width="15%"><a href="RegistrationForm.jsp">Registration</a></TD>
    	<TD class=tabhead width="15%"><a href="Login.jsp">Customer Login</a></TD>
        <TD class=tabhead width="15%"><a href="LoginCheck">AdministrationLogin</a></TD>
        <TD class=tabhead width="15%"><a href="LoginCheck">Department Login</a></TD>
        <TD class=tabhead width="15%"><a href="">About Us</a></TD>
    <TD class=tabhead width="15%"><a href="">Contact Us</a></TD>
  </TBODY></TABLE>
<TABLE class=tabformat width="34%" border=0>
<TBODY>
<TR>
<html>
<body bgcolor=lightblue>
<center><h3>Admin Registration Form</h3></center>
<form name="f1" mothod=post action="AdminReg" >
<table border="0" >
<tr>
<td class=tabhead2><b>Admin Id:</b>
<td class=tabhead2><input type="text" name="aid" ></td></tr>
<td class=tabhead2><b>Admin Password</b></td>
<td class=tabhead2><input type=password name="apwd"></td></tr>
<td class=tabhead2><b>Address</b>
<td class=tabhead2><textarea name="AdminAdd" cols=20 rows=5></textarea></td></tr>
<td class=tabhead2><b>Contact No: </b></td>
<td class=tabhead2><input name="cno" type="text" ></td></tr>
<td class=tabhead2><b>Email Id: </b></td>
<td class=tabhead2><input type="text" name="EmailId"></td></tr>
</tr>
</td>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value="Register" onclick="return CheckInput()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value=clear ></td>
</tr>
</table>
<br>
<br>
<br>
<br>

<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TR>
    <TD class=tabhead width="10%"><H4><center>This is a Customer ON-LINE Complaint Registration Services </center></TD>
 </TR>

</TABLE>
</form>
</body>
</html>

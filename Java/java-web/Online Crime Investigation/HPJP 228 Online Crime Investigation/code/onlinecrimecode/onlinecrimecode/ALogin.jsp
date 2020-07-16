<script>
function CheckLogin()
{
 if(f.cLid.value=="")
 {
   alert("Please Enter Login Name");
   return false;
   
 }else if(f.cPwd.value=="")
 {
   alert("Please Enter Password");
   return false;
 }else
 {
 f.action="AdminLogin";
 f.submit();
 }
 
}

function Clear()
{
  f.aLid.value="";
  f.aPwd.value="";
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

<jsp:include page="Header.htm" />

<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<BODY class=rightPage><A name=Entity_1></A>
<form name=f >
  <DIV class=caption1></DIV>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>
  <TD><h3>Administrator Login<h3></td>
  </TR>

</TBODY></TABLE>
  <br>
<br>
<table border="0" >
<tr>
<td class=tabhead2><b>Login Name :</b>
<td class=tabhead2><input type="text" name="cLid"></td></tr>
<td class=tabhead2><b>Password :</b></td>
<td class=tabhead2><input type=password name="cPwd" ></td></tr>
<tr>
<td><center><img src="IMAGES/Login1.jpg" style={cursor:hand} heigth="1" width="70"  onclick="return CheckLogin()"></img>&nbsp;&nbsp;&nbsp;&nbsp;<img src="IMAGES/Clear.jpg" heigth="1" width="70"  style={cursor:hand} onclick="return Clear()"></img></center></td>
</tr>
</table>

<jsp:include page="Footer.htm" />

</form>
</BODY>
</HTML>

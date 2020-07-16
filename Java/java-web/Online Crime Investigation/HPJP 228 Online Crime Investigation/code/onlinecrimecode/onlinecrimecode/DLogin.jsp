<title>Department Login Form</title>


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
 
 
 
 
        var uid=f.cLid.value;
 		var pwd=f.cPwd.value;
 	    var oXMLHTTP = new ActiveXObject( "Microsoft.XMLHTTP" );
 		var sURL = "./CheckDept1?uid=" + uid + "&pwd=" + pwd
 		oXMLHTTP.open( "POST", sURL, false );
 		oXMLHTTP.send();
 		var  status=oXMLHTTP.responseText;
 		var s=status;
 		var str="I";
 		
 	        if(s.charAt(0)==str)
 		{
 		  alert(s);
 		  f.cLid.value="";
 		  f.cPwd.value="";
 	          f.cLid.focus();
 		  return false;
 		}else
 		{
 		f.action="DeptLogin.jsp";
 		f.submit();
    	        }
    	
		
 
 }
 
}



function Go()
{




if(event.keyCode==13)
{
 
              CheckLogin();
              

}

}





function setfocus()
{

 f.cLid.focus();
      
   return false;


}


function Clear()
{
  f.cLid.value="";
  f.cPwd.value="";
   f.cLid.focus();
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


<jsp:include page="DeptHeader1.jsp" />


<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<BODY  onload="setfocus()"><A name=Entity_1></A>
<form name=f method=post>
  <DIV class=caption1></DIV>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>

  </TR>

</TBODY></TABLE>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>
  <TD><h3>Department Login<h3></td>
  </TR>

</TBODY></TABLE>
<br>
<br>
<br>
<table border="0" >
<tr>
<td class=tabhead2><b>Login Name :</b>
<td class=tabhead2><input type="text" name="cLid" size=20 maxlength=20 class="pwdstyle"  onkeydown="Go()"   ></td></tr>
<td class=tabhead2><b>Password :</b></td>
<td class=tabhead2><input type=password name="cPwd" size=20 maxlength=20 class="pwdstyle" onkeydown="Go()"   ></td></tr>
<tr>
<td><center>
             <input type=button value="  Login  " onclick="return CheckLogin()" o>&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="  Clear "  style={cursor:hand} onclick="return Clear()" height="30"></img> 
             
        </center></td>
</tr>
</table>


<br>
<br>
<br>
<br>

<br>
<br>

<br><br>
<br>


<br>





<jsp:include page="Footer.htm" />

</form>
</BODY>
</HTML>

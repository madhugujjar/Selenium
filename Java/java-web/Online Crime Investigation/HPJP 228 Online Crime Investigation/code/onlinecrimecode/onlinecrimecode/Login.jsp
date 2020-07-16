<title>Customer Login Form</title>


<script>

function setfocus()
{

 f.cLid.focus();
      
   return false;


}


function Go()
{




if(event.keyCode==13)
{
 
                var uid=f.cLid.value;
  	       var pwd=f.cPwd.value;
  	         var oXMLHTTP = new ActiveXObject( "Microsoft.XMLHTTP" );
  		var sURL = "./CheckCustomer?uid=" + uid + "&pwd=" + pwd
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
  		f.action="ULogin.jsp";
  		f.submit();
     	        }
    	
    	

}

}




function Go1()
{




if(event.keyCode==13)
{
 
CheckLogin();

	
	
}

}




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
 		var sURL = "./CheckCustomer?uid=" + uid + "&pwd=" + pwd
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
 		f.action="ULogin.jsp";
 		f.submit();
    	        }
    	
    	
 
 
 

 }
 
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

<jsp:include page="LoginHeader.jsp" />

<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<BODY  onload="setfocus()">
<form name=f method=post>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>

  </TR>

</TBODY></TABLE>

<br>
<br>

<h3>Customer Login </h3>
<br>
<table border="0" >
<tr>
<td class=tabhead2><b>Login Name :</b>

<td class=tabhead2><input type="text"  name="cLid"  size=20  maxlength=20 class="pwdstyle" onkeydown="Go1()"  ></td></tr>

<td class=tabhead2><b>Password :</b></td>

<td class=tabhead2><input type=password name="cPwd" size=20 maxlength=20 class="pwdstyle" onkeydown="Go1()" ></td></tr>



<tr>
<td><center>
          <input type=button value="  Login  " onclick="return CheckLogin()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="  Clear "  style={cursor:hand} onclick="return Clear()" height="50"></img> 
        </center></td>
</tr>
</table>


<br>
<br>
<br>
<br>
<br>


<td class=tabhead2><b><a href="fpwd.jsp">ForGet Password ?</a></b></td>



<br>
<br>
<br>
<br>
<br>
<br>
<br>

<jsp:include page="Footer.htm" />

</form>
</BODY>
</HTML>

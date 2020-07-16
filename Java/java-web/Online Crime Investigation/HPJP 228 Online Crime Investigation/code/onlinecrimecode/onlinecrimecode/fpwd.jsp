<title>Forget Password Form</title>



<jsp:include page="LoginHeader.jsp" />

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
	    var oXMLHTTP = new ActiveXObject( "Microsoft.XMLHTTP" );
  		var sURL = "./CheckCustomer1?uid=" + uid 
  		  		oXMLHTTP.open( "POST", sURL, false );
  		oXMLHTTP.send();
  		var  status=oXMLHTTP.responseText;
  		var s=status;
  		var str="I";
        if(s.charAt(0)==str)
  		{
     		  alert(s);
  	    	  f.cLid.value="";
  		      f.cLid.focus();
  		      return false;
  		}else
  		{
  		 f.action="ShowPwd.jsp";
  		f.submit();
        }
 
}

}

function CheckLogin()
{
	
  if(f.cLid.value=="")
  {
  	  alert("Please Enter Login Name");
  	 f.cLid.focus();  
	  return false;
 }else
 {

	 
	   var uid=f.cLid.value;
	    var oXMLHTTP = new ActiveXObject( "Microsoft.XMLHTTP" );
  		var sURL = "./CheckCustomer1?uid=" + uid 
  		oXMLHTTP.open( "POST", sURL, false );
  		oXMLHTTP.send();
  		var  status=oXMLHTTP.responseText;
  		var s=status;
  		var str="I";
        
  		if(s.charAt(0)==str)
  		{
     		  alert(s);
     		  f.cLid.value="";
  		      f.cLid.focus();
  		      return false;
  		}else
  		{

	   upwd.innerHTML="Your Password Is" + " "  + " : " +s;
	   
	   return false;
	   f.action="ShowPwd.jsp";
  	   f.submit();
        }
        
        	 
 }
	}




function Clear()
{
  f.cLid.value="";
  upwd.innerHTML="";
  
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



<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<BODY  onload="setfocus()" >
<form name=f method=post >
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>

  </TR>

</TBODY></TABLE>

<br>
<br>

<h3>Customer Login Details</h3>
<br>
<table border="0" >
<tr>
<td class=tabhead2><b>Login Name</b>

<td class=tabhead2><input type="text" name="cLid"  size=20 maxlength=20 class="pwdstyle" ></td>

<div id="pwds"  >
<td><b><p id=upwd align="left"></p></b>


</td>
</div>


</tr>





<tr>
<td><center>

        <input type=button value="  Submit  " onclick="return CheckLogin()" >&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="  Clear "  style={cursor:hand} onclick="return Clear()" height="30"></img> 
        </center></td>

</tr>
</table>
<br>
<br>
<br>
<br>
<br>

<br>
<br>
<br>
<br>
<br>
<br>
<br>

</form>
<jsp:include page="Footer.htm" />

</BODY>
</HTML>

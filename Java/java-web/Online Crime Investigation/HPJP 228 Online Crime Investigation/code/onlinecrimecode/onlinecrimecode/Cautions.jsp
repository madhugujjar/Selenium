<script>
function CheckInput()
{
	
 if(f.txtca.value=="")
 {
   alert("Please Enter Caution");
   f.txtca.focus();
   return false;
   
 }else  if(f.txtca.value.length<10)
 {

   alert("Caution Should be Minimum 10 Characters ");
   f.txtca.focus();
   return false;
   
   
	 
	 
	 	 
 }
 
}

function NoCheck1(obj)
{
n=event.keyCode;
len=obj.value;


if(n==32)
{
 obj.value="";

}

}

function its_whitespace(obj)
{


n = event.keyCode;



if(n==0)
{
return false;
}


len=obj.value;

var colors=new Array("~","`","!","@","#","$","%","^","&","*","(",")","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|");
for(j=0;j<=len.length-1;j++)
{
var char=len.substring(j,j+1);
for(i=0;i<=colors.length-1;i++)
{
  var sNumber=colors[i];
  if(sNumber==char)
  {
  
   obj.value="";
   obj.focus();
   return false;
  }
}


}


	 
if(obj.value.length==0)
{
	
return false;

}





string_value=obj.value;

	
  // These are the whitespace characters
  var whitespace = " \n\r\t\."
  var existed="No";
  var Valid="No";
  
  
  
  
  // Run through each character in the string
    for (var counter = 0; counter < string_value.length; counter++) 
    {
      // Get the current character
      current_char = string_value.charAt(counter)
      // If it's not in the whitespace characters string,
      // return false because we found a non-whitespace character
      if(whitespace.indexOf(current_char) =="") 
      {
  	    var existed="Yes";
      }else if(whitespace.indexOf(current_char) ==-1) 
      {
  	     existed="No";
  	     Valid="Yes";
  	     break;
      }
    }
    if(existed=="No" && Valid=="Yes")
    {
        existed="Yes";
   	  Valid="No";
   	  return false;
    }else
    {
  		 obj.value="";
  		  existed="Yes";
  		  Valid="No";
  		  obj.focus();
  		  return false;
  	
    }



    
	

  
}

function CharCheck(obj)
{
len=obj.value;


len=obj.value;

if(len.charAt(0)==" " || len.charAt(0)=="."  )
{
  var oldvalue=len.substring(1,len.length);
  obj.value=oldvalue;
}

n = event.keyCode;



len=obj.value;

if((n==188) || (n==13)) 
{
	return false;
}



}




function Clear()
{
  f.txtca.value="";
  return false;
}


function SetFocus()
{
	
  f.txtca.focus();
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
  
  <jsp:include page="CautionHeader.jsp" />
  
<HTML><HEAD><TITLE>Cautions Form</TITLE>
<META>
<BODY class=rightPage onload="SetFocus()">
<form name=f action="SaveCaution">
  <DIV class=caption1></DIV>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>

  </TR>

</TBODY></TABLE>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>
  <TD><h3>Cautions Details<h3></td>
  </TR>

</TBODY></TABLE>

<table border="0" >
<tr>
<td class=tabhead2><b>Caution</b>

<td class=tabhead2><textarea name="txtca" rows=7 cols=40  onkeyup="CharCheck(this)" onblur="its_whitespace(this)" ></textarea></td></tr>
<tr>
<br>
<br>

<td><input type=submit value="  Save  " onclick="return CheckInput()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="  Clear  " ></td>
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
 
  
  <jsp:include page="Footer.htm" />
  
</form>
</BODY>
</HTML>

<title>Customer Password Changing</title>
<script>



function its_whitespace2(obj)
 {
	
	

if(obj.value.length==0)
{
	
return false;

	}
// These are the whitespace characters


  var whitespace = " \n\r\t"
  var existed="No";
  var Valid="No";
len=obj.value;

var string_value=obj.value;


var char=len.substring(len.length,len.length-1);
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
	
    
	
	
  // Otherwise, the string has nothing but
  // whitespace characters, so return true
}


function Check(obj)
{

if(obj.value=="" || obj.value==null)

{

 return false;
 

}


if(obj.value!=f1.txtoldpwd.value)
	{
	  alert("Invalid Old Password");
	  obj.value="";
	  obj.focus();
	  
	  return false;
	 }
	  
	  
}

function CheckInput()
{
	
	
if(f1.txtopwd.value=="" || f1.txtopwd.value==null)
{
   alert("Please Enter Old Password");
   f1.txtopwd.focus();
   return false;
}else if(f1.txtnpwd.value=="" || f1.txtnpwd.value==null)
{
   alert("Please Enter New Password");
   f1.txtnpwd.focus();
   return false;


}else if(f1.txtnpwd.value.length<4)
{
    alert("User Password Should Be Minimum 4 Characters");
    f1.txtnpwd.focus();
    return false;
}else if(f1.txtnpwd.value==f1.txtopwd.value)
{
   alert("Old Password and New Password Both Are Same");
   f1.txtnpwd.value="";
   f1.txtopwd.value="";
   f1.txtopwd.focus();
   
   
   return false;


}



}



function setfocus()
{

f1.txtopwd.focus();

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
<jsp:include page="ShowHeader.jsp" />

<HTML><HEAD>

<LINK href="css/styles.css" type=text/css rel=stylesheet>
    
    
<BODY bgcolor=lightyellow onload="setfocus()"><A name=Entity_1></A>

<%
int regid=0;
Connection con=null;
   ResultSet rs=null;
    String uid="";
    
     String pwd="";
     
   
try
{

  ConnectionBean CBean=new ConnectionBean();

  con=CBean.getConnection();
  regid =Integer.parseInt(session.getValue("regid") + "");
  
  uid=session.getValue("uid")+"";
 pwd=session.getValue("pwd")+""; 

%>




<%
}catch(Exception ex)
{
     out.println("Error At " + ex);
}
 %>

  
  
<h3>Password Changing</h3>

<form name="f1"  action="UpdatePwd.jsp">

<TABLE class=tabformat >
 
<tr>

<td class=tabhead2><b>Old Password</b></td>
<td class=tabhead2><input type=password name=txtopwd  onblur="Check(this)" size=20 maxlength=20 class="pwdstyle" ></td>

<td class=tabhead2><input type=hidden name=txtuid  value=<%=uid%> size=20 maxlength=20 class="pwdstyle" ></td>

<td class=tabhead2><input type=hidden name=txtoldpwd value=<%=pwd%> size=20 maxlength=20 class="pwdstyle" ></td>



<tr>

<td class=tabhead2><b>New Password</b></td>

<td class=tabhead2><input type=password name=txtnpwd  onblur="its_whitespace2(this)" size=20 maxlength=20 class="pwdstyle" ></td></tr>

</tr>
</td>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value="Change" onclick="return CheckInput()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="  Clear  " ></td>
</tr>
</table>
<tr>
<tr>
</td>

</tr>

</form>
<br>
<br>
<br>
<br>

<br>

<br>


<jsp:include page="Footer.htm" />

</body>
</html>

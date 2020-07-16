<script>


function Check(obj)
{
len=obj.value;
var colors=new Array("`","~","!","@","#","$","%","^","&","*","(",")","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|",",","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
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
var whitespace = " \n\r\t\."
var existed="No";
var Valid="No";
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











function its_whitespace(obj)
{
len=obj.value;
var colors=new Array("~","`","!","@","#","$","%","^","&","*","(",")","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|",",","1","2","3","4","5","6","7","8","9","0");
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



function its_whitespace1(obj)
{
len=obj.value;
var colors=new Array("`","~","!","@","#","$","%","^","&","*","(",")","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|",",");
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

function NoCheck(obj)
{
n=event.keyCode;
len=obj.value;
if((n<=57 && n>=48) ||  n==8 || (n<=105 && n>=96) || n==46 ||(n>=33 && n<=36) || (n==37) || (n==18) ||(n==92) ||(n==93) ||(n==17) ||(n==145) ||(n==19) ||(n==144) ||(n==35)|| (n==46)||(n==45)||(n==40)|| (n==38) || (n==39) || (n==9))
{

}else
{
 obj.value="";

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





function setfocus()
{

f1.CustName.focus();


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


if((n>=65 && n<=90)|| (n>=33 && n<=36) || (n==37) || (n==18) ||(n==92) ||(n==93) ||(n==17) ||(n==145) ||(n==19) ||(n==144) ||(n==35)|| (n==46)||(n==45)||(n==40)|| (n==38) || (n==39)||(n==32) || (n==8) || (n==110) || (n==190) || (n==20) || (n==9) || (n==16) || n==36)
{
	
	
}else
{
  obj.value="";
  return false;
}
}


function validateuserid(obj)
{


       if(f1.are.value==f1.oldare.value)
       {
       
       
       return false;
       }
       


          
        its_whitespace3(obj);

        var user=obj.value
	var oXMLHTTP = new ActiveXObject( "Microsoft.XMLHTTP" );
	var sURL = "./CheckDept?user=" + user
	oXMLHTTP.open( "POST", sURL, false );
	oXMLHTTP.send();
	var  status=oXMLHTTP.responseText;
	var s=status;
	var str="a";
	
	if(s.charAt(0)==str)
        {
        
        
          alert(s);
          
         f1.are.value="";
         
	 f1.are.focus();
        }
}




function setfocus()
{
f1.DeptName.focus();

return false;

}

function its_whitespace3(obj)
{
len=obj.value;
var colors=new Array("~","`","!","@","#","$","%","^","&","*","(",")","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|",",");

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

}





function CheckInput()
{
if(f1.DeptName.value=="")
{
  alert("Please Enter Department Name");
  f1.DeptName.focus();
  return false;
}else if(f1.DeptName.value.length<3)
{
  alert("Department Name Should  Be Minimum 3 Characters");
  f1.DeptName.focus();
  return false;
}else if(f1.SiName.value=="")
{
   alert("Please Enter SI Name");
   f1.SiName.focus();
   return false;
}else if(f1.SiName.value.length<3)
{
  alert("Si Name Should  Be Minimum 3 Characters");
  f1.SiName.focus();
  return false;
}else if(f1.add.value=="")
{
  alert("Please Enter Department Address");
    f1.add.focus();
  return false;
  
}else if(f1.add.value.length<5)
{
 alert("Department Address Should  Be Minimum 5 characters");
   f1.add.focus();
 return false;
 

}else if(f1.add.value.length>100)
{
 alert("Department Address Should Not Be greater than the 100 characters");
 f1.add.focus();
 return false;
 
}else if(f1.are.value=="")
{
  alert("Please Enter Department Area");
  f1.are.focus();
  return false;
}else if(f1.are.value.length<3)
{
 alert("Department Area Should  Be Minimum 3 characters");
 f1.are.focus();
 return false;
}else if(f1.code.value=="")
{
  alert("Please Enter Code No");
  f1.code.focus();
  return false;
  
}else if(f1.code.value.length<3)
{
	
 alert("Code Number Should Be Minimum 3 Digits");
 f1.code.focus();
 return false;
 
}else if(f1.cno.value=="")
{
  alert("Please Enter Contact No");
  f1.cno.focus();
  return false;
}else if(f1.cno.value.length<6)
{
 alert("Department Phone Number Should Be Minimum 6 Digits");
 f1.cno.focus();
 return false;
}


}




function onlyno(obj)
{
     phno=obj.value;
     no=phno.charAt(phno.length-1)
     if ( isNaN(no) && no!='-' ) 
          obj.value=phno.substring(0,phno.length-1)
          
          
          len=obj.value;
	  	        if(len.charAt(len.length-1)==" ")
	  	        {
	  	           alert("Spaces are not Allowed");
	  	           obj.value=len.substring(0,len.length-1);
	  	        }
	  	        
}




function Close()
{

  self.close();
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

<LINK href="css/styles.css" type=text/css rel=stylesheet>
    
<DIV class=caption1></DIV>
<table border="0" >

<td class=tabhead>Modifying Department Details</td>
</table>
<body onload="setfocus()">
<form name="f1" method=post  action="UpdateDept" ">
<TABLE class=tabformat width="20%" border=0>
  <TBODY>
  <TR>
<%

   Connection con=null;
   ResultSet dept_rs=null;
   ConnectionBean CBean=new ConnectionBean();
   con=CBean.getConnection();
   String Did=request.getParameter("Did");
   System.out.println("" + Did);
   dept_rs=CBean.executeQuery("select *  from police_department where department_id=" + Did);
   dept_rs.next();
    
   
   
   
%>
<html>
<table border="0" >
<tr>
<td class=tabhead1><b>Department Id:</b>
<td class=tabhead1><input type="text" name="Dno" readonly value=<%=dept_rs.getString(1)%>></td></tr>
<td class=tabhead1><b>Department Name</b></td>
<td class=tabhead1><input type="text" name="DeptName" value="<%=dept_rs.getString(2)%>"    maxlength=20  onkeyup="CharCheck(this)" onblur="its_whitespace(this)"></td></tr>
<td class=tabhead1><b>Si Name</b></td>
<td class=tabhead1><input name="SiName" type="text" value="<%=dept_rs.getString(3)%>" maxlength=20     onkeyup="CharCheck(this)" onblur="its_whitespace(this)"></td></tr>
<td class=tabhead1><b>Address</b></td>
<td class=tabhead1><textarea name="add" onblur="its_whitespace2(this)" ><%=dept_rs.getString(4)%></textarea></td></tr>
<td class=tabhead1><b>Area</b></td>

<%
String area=dept_rs.getString(5);


%>

<td class=tabhead1><input type="text" name="are" value="<%=area %>"  onblur="validateuserid(this);"  maxlength=20   ></td>

<input type="hidden" name="oldare"  value="<%=area%>" >

</tr>






<td class=tabhead1><b>Contact No</b>
	<td class=tabhead1><input type="text" name="code" value="<%=dept_rs.getString(6) %>" size=5 onkeyup="NoCheck(this)" onblur="Check(this)" maxlength=5>-
<input type="text" name="cno" value="<%=dept_rs.getString(7) %>"  onkeyup="NoCheck(this)"  onblur="Check(this)" maxlength=13></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value="Update" style={cursor:hand} onclick="return CheckInput()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value=Close style={cursor:hand}  onclick="Close()"></td>
</tr>
</table>

<%
dept_rs.close();
%>

<br>
<br>
<br>
<br>
</form>
</body>
</html>

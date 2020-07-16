<script>

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





function Check(obj)
{


    
	 if(obj.value=="")
        {
        
return false;

}

               
	
     if(obj.value==0)
        {
        
              alert("Years Should Not Be 0 Years");
               obj.value="";
               obj.focus();
        
        
        }else if(obj.value>100)
        {
        
          alert("Years Should Not Be Greater than 100 Years");
           obj.value="";
           obj.focus();
           
           return false;
         
    }
    
    
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



function Check1(obj)
{


    
	 if(obj.value=="")
        {
        
return false;

}

               
	
     if(obj.value==0)
        {
        
              alert("Months Should Not Be 0 Years");
               obj.value="";
               obj.focus();
        
        
        }else if(obj.value>11)
        {
        
          alert("Months Should Not Be Greater than 12 Months");
           obj.value="";
           obj.focus();
           return false;
         
    }
    
    
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




function Check2(obj)
{


    
	 if(obj.value=="")
        {
        
return false;

}

               
	
     if(obj.value==0)
        {
        
              alert("Days Should Not Be 0 Years");
               obj.value="";
               obj.focus();
        
        
        }else if(obj.value>31)
        {
        
          alert("Days Should Not Be Greater Than 31");
           obj.value="";
           obj.focus();
           
           return false;
         
    }
    
    
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



if(n==48)
{


	
	}



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









function CheckInput()
{
if(f1.thName.value=="")
{
   alert("Please Enter Criminal Name");
   f1.thName.focus();
   return false;
}else if(f1.thName.value.length<3)
{
   alert("Criminal Name Should be Minimum 3 Characters");
   f1.thName.focus();
   return false;
}else if(f1.tloc.value=="")
{
   alert("Please Enter Location");
   f1.tloc.focus();
   return false;
}else if(f1.tloc.value.length<5)
{
   alert("Criminal Location Should be Minimum 5 Characters");
   f1.tloc.focus();
   return false;
}else if(f1.tloc.value.length>30)
{
   alert("Criminal Location Should Not Be Greater than the  30  Characters");
   f1.tloc.focus();
   return false;
}else if(f1.noy.value=="" && f1.nom.value=="" && f1.nod.value=="")
{
  alert("Please Enter Wanted Since");
  f1.noy.focus();
  return false;
}else if(f1.tth.selectedIndex==0)
{
  alert("Please Select Criminal Type");
  f1.tth.focus();
  return false;
  
}else if(f1.photo.value=="")
{
  alert("Please Select Criminal Photo");
  return false;

}


}



function setfocus()
{

f1.thName.focus();
return false;


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
<jsp:include page="NThRegHeaderTemp.jsp" />


<HTML><HEAD><TITLE>Criminal Registration Form</TITLE>
<META>


<BODY class=rightPage onload="setfocus()">






<TABLE class=tabformat width="30%" border=0>
  <TBODY>


<%
try
{

   Connection con=null;
   ResultSet th_rs=null;
   ConnectionBean CBean=new ConnectionBean();
   con=CBean.getConnection();
   th_rs=CBean.executeQuery("select nvl(max(thieve_id),0)+1 from thieves");
   th_rs.next();
   String  th_no=th_rs.getString(1);
   System.out.println(th_no);
   th_rs.close();
%>



<h3>Criminal Registration Form</h3>
<form name="f1"  action="ThRegister">
<table border="0" width="30%">
<tr>
      <td class=tabhead2><b>Criminal Id</b> 
      <td class=tabhead2><input type="text" name="thid" readonly value=<%=th_no%>></td></tr>
<tr>


      <td class=tabhead2><b>Criminal Name</b></td>
      
<td class=tabhead2><input type="text" name="thName" maxlength=30   onkeyup="CharCheck(this)" onblur="its_whitespace(this)" ></td></tr>
<tr>
<td class=tabhead2><b>Criminal Location</b></td>
<td class=tabhead2><textarea name="tloc" onblur="its_whitespace2(this)" ></textarea></td></tr>
<tr>

<td class=tabhead2><b>Wanted Since</b>

<td>Yrs<input type="text" name="noy" maxlength=3  size=3 onkeyup="NoCheck(this)"  onblur="Check(this)" >
Mths<input type="text" name="nom" maxlength=3  size=3 onkeyup="NoCheck(this)"  onblur="Check1(this)"></td><td>
Dys<input type="text" name="nod" maxlength=3  size=3 onkeyup="NoCheck(this)"  onblur="Check2(this)"></td>


</tr>




<tr>

<td class=tabhead2><b>Type Of Crime</b></td>

<td><select class=tabhead1 name="tth" >
    <option>Select Category
	<option>Crime
	<option>Civil
	<option>Pick Pocketers</select>
	
	</td></tr>
<tr>
      <td class=tabhead2><b>Criminal Photo</b></td>
<td class=tabhead2><input type=file  name="photo" ></td></tr>
<tr>
<td><input type=submit value="Register" onclick="return CheckInput()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="  Clear  "></td>
</tr>
</table>
<%
}catch(Exception ex)
{
     out.println("Error At " + ex);
}
%>


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
</body>
</html>

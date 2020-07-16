<title>Complaint Registration Form</title>


<script>
function CheckInput()
{

if(f1.pdes.value=="")
{
   alert("Please Enter Complaint Description");
   f1.pdes.focus();
   return false;
}else if(f1.pdes.value.length<20)
{
 alert("Complaint Description Should be Minimum 20 Characters");
   f1.pdes.focus();
   return false;
   
 
}else if(f1.pdes.value.length>400)
{

    alert("Complaint Description Should be greater than 400 Characters");
   f1.pdes.focus();
   return false;
   

}else if(f1.area.selectedIndex==0)
{
  alert("Please Select Area Code");
  f1.area.focus();
  return false;
}else if(f1.ctype.selectedIndex==0)
{
  alert("Please Select Complaint Type");
  f1.ctype.focus();
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


if((n==13) )

{
	
return false;
	
}



}



function its_whitespace(obj)
{
len=obj.value;
var colors=new Array("~","`","!","@","#","$","%","^","&","*","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|");
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



function setfocus()
{
  


f1.pdes.focus();
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
<jsp:include page="CompHeader.jsp" />

<HTML><HEAD><TITLE>Home Page</TITLE>

<LINK href="css/styles.css" type=text/css rel=stylesheet>
    
    
<BODY bgcolor=lightyellow onload="setfocus()"><A name=Entity_1></A>
<DIV><TABLE class=tabformat width="20%" border=0> </DIV>
<TBODY>
  <TR>
<%
try
{

   Connection con=null;
   ResultSet cmp_rs=null;
   ResultSet ar_rs=null;
   ConnectionBean CBean=new ConnectionBean();
   con=CBean.getConnection();
   cmp_rs=CBean.executeQuery("select nvl(max(complaint_id),0)+1 from complaint_reg");
   cmp_rs.next();
   String  cmp_no=cmp_rs.getString(1);
   System.out.println(cmp_no);
   cmp_rs.close();
   ar_rs=CBean.executeQuery("select area from police_department order by department_id");
dep_rs=CBean.executeQuery("select department_name from police_department order by department_id");


%>

<h3>Customer Complaint Registration </h3>
<form name="f1" action="CompRegister.jsp" ">
<table border="0">
<tr>
<td class=tabhead2><b>Complaint Id:</b>
<td class=tabhead2><input type="text" name="cno" readonly value=<%=cmp_no%>></td></tr>
<td class=tabhead2><b>Problem Description</b></td>
<td class=tabhead2><textarea name="pdes" rows=10 cols=50 onkeyup="CharCheck(this)" onblur="its_whitespace(this)"></textarea></td></tr>
<td class=tabhead2><b>Area</b></td>
<td class=tabhead2><select  name="area">
<option selected>---Area Code---</option>
<%
while(ar_rs.next())
{
%>
 <option><%=ar_rs.getString(1)%></option>
<%
}
%>
</select>
</td>
<tr>

<td class=tabhead2><b>Complaint Type</b></td>


<td class=tabhead2><select  name="ctype">
<option selected>---Select Complaint Type---</option>
<%
while(dep_rs.next())
{
%>
 <option><%=dep_rs.getString(1)%></option>
<%
}
%>
</select>
</td>
</tr>


<%
}catch(Exception ex)
{
     out.println("Error At " + ex);
}
 %>

</tr>
</td>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value="Register" onclick="return CheckInput()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="  Clear  " ></td>
</tr>
</table>
<br>
<br>
<br>
<br>



</form>
<jsp:include page="Footer.htm" />

</body>
</html>

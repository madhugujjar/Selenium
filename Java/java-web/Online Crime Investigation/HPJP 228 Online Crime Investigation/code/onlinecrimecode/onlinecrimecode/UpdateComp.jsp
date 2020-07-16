<script>
function Close()
{
self.close();



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



function its_whitespace(obj)
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
<LINK href="css/styles.css" type=text/css rel=stylesheet>
<BODY ><A name=Entity_1></A>
<DIV class=caption1><TABLE class=tabformat width="20%" border=0> </DIV>
<TBODY>
  <TR>
<%
   ResultSet rs=null;
   ResultSet ar_rs=null;
   Statement stmt=null;
   String area=null;
   
try
{

   Connection con=null;

   ConnectionBean CBean=new ConnectionBean();
   con=CBean.getConnection();
   
   String cid=request.getParameter("cid");
   System.out.println(cid);
   
   stmt=con.createStatement();
   
   rs=stmt.executeQuery("select * from complaint_reg where COMPLAINT_ID=" + cid + "   ");
   rs.next();
   
   
   ar_rs=CBean.executeQuery("select area from police_department where department_id='" + rs.getString(5) + "'");
      if(ar_rs.next())
      {
        area=ar_rs.getString(1);
      }
      ar_rs.close();
   
   
   ar_rs=CBean.executeQuery("select area from police_department ");
   
   
   
%>

<h3>Modifying Complaint Details</h3>
<form name="f1" action="UpdateCompR.jsp" ">
<table border="0">
<tr>
<td class=tabhead2><b>Complaint Id:</b>
<td class=tabhead2><input type="text" name="cno" readonly value="<%=rs.getString(1)%>"></td>
</tr>
<td class=tabhead2><b>Problem Description</b></td>
<td class=tabhead2><textarea name="pdes" rows=10 cols=50 onkeyup="CharCheck(this)" onblur="its_whitespace(this)"><%=rs.getString(2)%></textarea></td></tr>
<td class=tabhead2><b>Area</b></td>
<td class=tabhead2><select  name="area">
<option selected>---Area Code---</option>
<%


while(ar_rs.next())
{

String tmparea=ar_rs.getString(1);

if(tmparea.equals(area))
{
%>
 <option selected><%=tmparea%></option>
 <%
 }else
 {
 
 %>
  <option selected><%=tmparea%></option>


 <%
 }
  

}
%>
</select>
</td>
<tr>

<td class=tabhead2><b>Complaint Type</b></td>

<%
String ctype=rs.getString(6);
%>

<td class=tabhead2><select  name="ctype">

<%
  if(ctype.equals("Crime"))
  {
  %>
  
   <option selected>Crime</option>
   <option >Civil</option>
   <option >Traffic</option>

<%

}else if(ctype.equals("Civil"))
{
%>
   <option >Crime</option>
   <option selected>Civil</option>
   <option >Traffic</option>

<%
}else if(ctype.equals("Traffic"))
{
%>

<option >Crime</option>
   <option >Civil</option>
   <option selected>Traffic</option>

<%
}
%>




</select>
</td>
</tr>


<%
}catch(Exception ex)
{
     System.out.println("Error Atcxc " + ex);
}
 %>

</tr>
</td>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value="Update" onclick="return CheckInput()">&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="  Close  " onclick="Close()"></td>
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

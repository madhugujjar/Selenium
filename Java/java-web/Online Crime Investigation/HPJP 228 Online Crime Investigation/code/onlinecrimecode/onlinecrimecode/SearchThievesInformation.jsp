<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<script>


function Check()
{
if(f.catth.selectedIndex==0)
{
  alert("Please Select Criminal Category");
  return false;
}else
{
   f.action="SearchThievesInformation.jsp";
   f.submit();
}

}



function ShowImage()
{

    var imgid=event.srcElement.id;
    window.open("ShowImage.jsp?imgid="+ imgid + " ","popup","width=600,height=400")
 
}

function Update(tid)
{
  alert(tid);
  window.open("UpdateThieve.jsp?tid="+ tid + " ","popup","width=600,height=400")
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

<jsp:include page="ThInfoHeader.jsp" />

<HTML><HEAD><TITLE>Criminal Information</TITLE>
<META>

<LINK href="css/styles.css" type=text/css rel=stylesheet>

<form name=f method="post">
<TR>
<td>

<%
String cat=request.getParameter("catth");

try
{
 int i=1;	 
 Connection con=null;
 ResultSet rs=null;
 ConnectionBean CBean=new ConnectionBean();
 con=CBean.getConnection();
 rs=CBean.executeQuery("select * from thieves where type_th='" + cat + "' order by thieve_id ");
%>


<center><h3>CRIMINAL INFORMATION DETAILS</h3> </center>
<table align=center border=1 colspace=10>
<th class=tabhead3 >Criminal Id
<th class=tabhead3 >Criminal Name
<th class=tabhead3 >Criminal Location
<th class=tabhead3 >Wanted Since
<th class=tabhead3 >Type of Crime
<th class=tabhead3 >Photo
<th class=tabhead3 >Check
<%
while(rs.next())
{
 String tid=rs.getString(1);
%>
<tr>
<td class=tabhead1><%=tid%></td>
<td class=tabhead1><%=rs.getString(2) %></td>
<td class=tabhead1><%=rs.getString(3) %></td>
<td class=tabhead1><%=rs.getString(4) %></td>
<td class=tabhead1><%=rs.getString(5) %></td>



<%
    byte picData[]=rs.getBytes(6);
    FileOutputStream fos=new FileOutputStream("e:\\jakarta-tomcat-5.5.9\\webapps\\OCR1\\img\\"+  i  + ".bmp");
	fos.write(picData);
	fos.close();
	out.print("<td class=tabhead1><img src='./img/");
	out.print(i);
	out.print(".bmp");
	out.print("'");
	
	out.print(" id=");
	out.print(i);
	out.print(" ");
	
	out.print("width=25 style={cursor:hand} onclick='ShowImage()' ");
	
        out.print(">");
		
	out.println("</td>");
	
	i++;
%>
<td class=tabhead1><a style={cursor:hand} onclick="Update(<%=tid%>)">Update</a></td>
</tr>
<%
}
}catch(Exception ex)
{
%>
 
<%
  out.println("Error While Connecting DataBase" + ex);
}
%>
</table>


</body>
</html>





</td>





  </TR>
</TBODY></TABLE>




<br>
<br>
<br>
<br>
<br>
<table>
<tr>
<td class=tabhead1>Search Criminal Information</td>
</tr>
<tr>
 <td class=tabhead1>Select Criminal Category</td>
<td><Select name=catth class=tabhead1 >
<option selected >Select Category</option>
<option>Crime</option>
<option>Civil</option>
<option>Pick Pocketers</option>
<option>All</option>
<td>


<input type=button value="Search" onclick="Check()">


</table>

<br>
<br>

</form>

<jsp:include page="Footer.htm" />

</BODY>
</HTML>

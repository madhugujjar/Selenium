u<title>Criminals Information</title>


<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<script>

function Check()
{
if(f.catth.selectedIndex==0)
{
  alert("Please Select Criminal Category");
  return false;
}else
{
   f.action="CThievesInformation.jsp";
   f.submit();
}

}



function Go()
{

 
 if(f.catth.selectedIndex==1)
 {
   window.open("ShowImage1.jsp","popup","width=800,height=600")
 }else if(f.catth.selectedIndex==2)
 {
    window.open("ShowImage2.jsp","popup","width=800,height=600")
 }else if(f.catth.selectedIndex==3)
 {
    window.open("ShowImage3.jsp","popup","width=800,height=600")
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
  window.open("UpdateThieve.jsp?tid="+ tid + " ","popup","width=500,height=400")
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

<jsp:include page="CTHeader.jsp" />

<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<form name=f>
<TR>
<td>

<%
String cat=request.getParameter("catth");
System.out.println("value is" +cat);
try
{
 int i=1;	 
 Connection con=null;
 ResultSet rs=null;
 ConnectionBean CBean=new ConnectionBean();
 con=CBean.getConnection();
 
if((cat==null) || cat.equals("All"))
{

 rs=CBean.executeQuery("select * from thieves order by thieve_id");
}else
{
 rs=CBean.executeQuery("select * from thieves where  type_th='" + cat + "' order by thieve_id");
}


%>

<center><h3>CRIMINALS INFORMATION DETAILS</h3> </center>
<table align=center border=1 colspace=10>
<th class=tabhead3 >Criminal Id
<th class=tabhead3 >Criminal Name
<th class=tabhead3 >Criminal Location
<th class=tabhead3 >Wanted Since
<th class=tabhead3 >Type of Crime
<th class=tabhead3 >Photo

<%
while(rs.next())
{
 String tid=rs.getString(1);
%>
<tr>
<td class=tabhead1><%=tid%></td>
<td class=tabhead1><%=rs.getString(2) %></td>
<td class=tabhead1><%=rs.getString(3) %></td>


<%
String Yrs="Yrs";
String Mns="Mns";
String Dys="Dys";

String wsp=rs.getString(4);
int cnt=1;

  StringTokenizer st = new StringTokenizer(wsp,",");
  
     while (st.hasMoreTokens()) 
     
     {

       if(cnt==1)
           Yrs=st.nextToken() + "-" +Yrs ;
       if(cnt==2)
           Mns="," + st.nextToken() + "-" + Mns;
       if(cnt==3)
           Dys="," + st.nextToken() + "-" +Dys;
           cnt=cnt+1;
           
     }
 

String Wants=Yrs+Mns+Dys;


%>


<td class=tabhead1><%=Wants%></td>






<td class=tabhead1><%=rs.getString(5) %></td>



<%
    byte picData[]=rs.getBytes(6);
    FileOutputStream fos=new FileOutputStream("C:/Program Files/Apache Software Foundation/Tomcat 5.5/webapps/onlinecrimecode/img//"+  i  + ".bmp");
	fos.write(picData);
		fos.close();
		out.print("<td class=tabhead1><img src='./img/");
		out.print(i);
		out.print(".bmp");
		out.print("'");
		
		out.print(" id=");
		out.print(i);
		out.print(" ");
		
		out.print("width=25  style={cursor:hand} onclick='ShowImage()' ");
		
	    out.print(">");
			
	out.println("</td>");
	
	i++;
%>

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
<br>
<br>
<br>


</body>
</html>





</td>





  </TR>
</TBODY></TABLE>

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


<input type=button value="  Show  " style={cursor:hand} onclick="Check()">


</table>


<br>
<br>
<br>
<br>
<br>

<br>
<br>


<jsp:include page="Footer.htm" />

</BODY>
</HTML>

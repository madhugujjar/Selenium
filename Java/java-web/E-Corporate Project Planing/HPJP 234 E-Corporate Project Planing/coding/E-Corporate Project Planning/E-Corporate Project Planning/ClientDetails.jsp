<html>
<head>
<script language="JavaScript">
function check()
{
  
 if(document.f.cid.value=="")
     {
     alert("Please Enter Cid");
     document.f.cid.value="";
     document.f.cid.focus();
     return false;
     }
  else
     if(document.f.cname.value=="")
     {
     alert("Please Enter Cname");
     document.f.cname.value="";
     document.f.cname.focus();
     return false;
     }
  else
     if(document.f.add.value=="")
     {
     alert("Please Enter add");
     document.f.add.value="";
     document.f.add.focus();
     return false;
     } 
  else
     if(document.f.phno.value=="")
     {
     alert("Please Enter Cphno");
     document.f.phno.value="";
     document.f.phno.focus();
     return false;
     }
  else
     if(document.f.email.value=="")
     {
     alert("Please Enter email");
     document.f.email.value="";
     document.f.email.focus();
     return false;
     } 
  else
     if(document.f.date.value=="")
     {
     alert("Please Enter date");
     document.f.date.value="";
     document.f.date.focus();
     return false;
     }
  else
     if(document.f.des.value=="")
     {
     alert("Please Enter des");
     document.f.des.value="";
     document.f.des.focus();
     return false;
     }  

    else
     {
 
      f.action="./clientdetails";
      f.submit()
    } 
 
}
</script>
</head>
<body bgcolor="#EEEEFF">
<%@ page import="java.util.*" %>
<%
  Date d=new Date();
  int dt=d.getDate();
  int m=d.getMonth();
  int y=d.getYear();
  Date to_date=new Date(dt,m,y);
//action="./clientdetails"
%>
<%@ page language="java"%>
<%@ page import="bean.Counter,java.util.*,java.lang.*"%>
<jsp:useBean id="counter"scope="session" class="bean.Counter" />
<jsp:useBean id="pk"scope="session" class="bean.PrimaryKeyGen" />
<form name="f" method=POST>
<table border="3" width=40% align=center bordercolor="black">
<tr bgcolor="#cccccc" bordercolor="#cccccc">
   <td colspan=2 ><em><strong><div align=center><font color="BLACK" size=5>Client RegiStration 
   </font></div></strong></em>
   <em><strong><div align=right><font size=3 color="0033ff">Date:<% out.println(dt+"/"+(m+1)+"/"+(y+1900)); %>
   </font></div></strong></em><hr></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee"> 
   <td><em><strong><div align=right><font size=3 color="0033ff">ClientID</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff"><input type=text name=cid size=12 text="dont" value='<%=pk.getClientId()%>'></font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc"> 
   <td><em><strong><div align=right><font size=3 color="0033ff">ClientName :</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff"><input type=text name=cname size=12></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee">
   <td><em><strong><div align=right><font size=3 color="0033ff">ClientAddress :</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff"><textarea name=add rows="4"columns="6"></textarea></font></div></strong></em></td>
  
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc"> 
   <td><em><strong><div align=right><font size=3 color="0033ff">PhoneNo:</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff"><input type=text name=phno size=12></font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee"  bordercolor="#eeeeee">
    <td><em><strong><div align=right><font size=3 color="0033ff">E_mail :</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff"><input type=text name=email size=12></font></div></strong></em></td>
   
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc"> 
   <td><em><strong><div align=right><font size=3 color="0033ff">ClientRequiredDate:</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff"><input type=text name=date size=12>
   </font><font size=1 color="0033ff">(eg 02-MAR-2005)</font></div></strong></em></td>
</tr>
<tr bgcolor="#eeeeee" bordercolor="#eeeeee"> 
   <td><em><strong><div align=right><font size=3 color="0033ff">ClientRequiredPlatforms:</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff">
   <select name=frontend size=1>
   <option value="JAVA">Java</option> 
   <option value="J2EE">J2EE</option>
   <option value="J2SE">J2SE</option>
   <option value=".NET">.NET</option>
   <option value="VB">VB</option>
   <option value="C">C</option>
   <option value="C++">C++</option>
   <option value="SAP">SAP</option>
   </select>
   <select name=backend size=1>
   <option value="SQL">SQL</option> 
   <option value="MYSQL">MYSQL</option>
   <option value="MS-ACC">MS-ACC</option>
   <option value="FOXPRO">FOXPRO</option>
   <option value="CYBASE">CYBASE</option>
   </select>
   </font></div></strong></em></td>
</tr>
<tr bgcolor="#cccccc" bordercolor="#cccccc"> 
   <td><em><strong><div align=right><font size=3 color="0033ff">ProjectDescription :</font></div></strong></em></td>
   <td><em><strong><div align=left><font size=3 color="0033ff"><textarea name=des rows="4" columns="12"></textarea></font></div></strong></em></td>
</tr>
<tr bordercolor="#ffccaa ">
    <td><em><strong><div align=right><font size=3 color="0033ff"><input type="submit" name=submit value="Insert" onClick="check()"></font></div></strong></em></td>
    <td><em><strong><div align=left><font size=3 color="0033ff"><input type="Reset" value="Reset"></font></div></strong></em></td> 
</tr>
</table>
</form>
</body>
</html>
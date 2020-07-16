<html>
<script>
var r=1,g,b;
function f()
{
 var d=new Date();
 //document.f1.t1.value=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
   
  if(r==1)
      {
       document.body.text="RED";
       r=0;
       g=1; 
      }
  else
     if(g==1)
      {
       document.body.text="GREEN";
       g=0;
       b=1;
      }
  else
      if(b==1)
         {
          document.body.text="Gray"   
           b=0;
           r=1;
         }    
  
   
   
 }
</script>

<head>
<center><h2>E-Corporate Project Planning</h2></center>
<hr size=2 color="blue">
</head>
<script language="JavaScript">
function exwin()
{
window.close();
}
</script>
<body bgcolor="#ffccaa" onload="tt=setInterval('f()',1000);">
<br><br>
<table align=center border=0 width=80%>
<tr>
   <td><div align=center><img src="./jpg/CON_ANI.GIF" width=200 height=160></div></td>
   <td><div align=center><em><font size=4 color=black><strong><font size=5>T</font></strong>his project details with the various levels of projects development 
and will account for time used in analysis design programming,testing 
and verfication etc. It helps mangers to view the progreee iof the projects.
                     Go For 
<a href="LoginForm.jsp"><font color="Blue" size=4>Login</font></a></div></td>
</tr>
</table>

<center><img src="./jpg/exit.jpg" width="50" height="35" onClick="exwin()"></center>

</body>
</html>
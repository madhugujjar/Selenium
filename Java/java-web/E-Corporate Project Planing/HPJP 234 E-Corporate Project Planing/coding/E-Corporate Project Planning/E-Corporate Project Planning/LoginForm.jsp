<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.util.*,java.lang.*"%>
<div align=right><%out.print(new Date());%></div>
<html>
<script>
function f()
{
 var d=new Date();
 //document.f1.t.value=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
  if(d.getSeconds()%2==0)
   {
   document.body.text="BLACK" 
   }
  else
   {
   document.body.text="BLUE" 
   }
  
 }
</script>
<script language="javascript">
function validate()
{
  if(document.ff.userid.value=="")
    {
      alert("Enter UserId");  
      document.ff.userid.value="";
      document.ff.userid.focus();
      return false;
   }  
   else
       if(document.ff.pass.value=="")
        {
          alert("Enter Password");
          document.ff.pass.value="";
          document.ff.pass.focus();
          return false;
        }
  else
      {
       ff.action="./login" 
       ff.method="POST" 
       ff.submit();
      } 
  
}

function infoscroll(seed,looped)
{
  var text1  = "Project Status Information";
  var text2  = " System";        
  var msg=text1+text2;
  var putout = " ";
  var c   = 1;

  if (looped > 10) 
  {  window.status="<Thanks !>";  }
  else if (seed > 100) 
  {
     seed--;
     var cmd="infoscroll(" + seed + "," + looped + ")";
     timerTwo=window.setTimeout(cmd,100);
  }
  else if (seed <= 100 && seed > 0) 
  {
    for (c=0 ; c < seed ; c++) 
    {  putout+=" ";  }
    putout+=msg.substring(0,100-seed);	
    seed--;
    var cmd="infoscroll(" + seed + "," + looped + ")";
    window.status=putout;
    timerTwo=window.setTimeout(cmd,100);
  }
  else if (seed <= 0) 
  {
    if (-seed < msg.length) 
    {
      putout+=msg.substring(-seed,msg.length);
      seed--;
      var cmd="infoscroll(" + seed + "," + looped + ")";
      window.status=putout;
      timerTwo=window.setTimeout(cmd,100); // 100
    }
    else 
    {
      window.status=" ";
      looped += 1;
      var cmd = "infoscroll(100," + looped + ")";
      timerTwo=window.setTimeout(cmd,75); // 75
    }
  }
}
// -->

<!--
   infoscroll(100,1)
     
// -->
</script>
<h3><center>E-Corporate Project Planning</center></h3>
<hr>
<body bgcolor="#ffccaa" onLoad="tt=setInterval('f()',1000);">
<form name=ff method="POST">
<table border=0 bordercolor=black align=center width=40% bgcolor=green name=ta>
<tr><td bgcolor="#ffccaa"><br> <p align="center"> <em><strong><font size="6" COLOR=RED
 face="Times New Roman, Times, serif"><u SIZE=4>L O G I N</u> 
</font></strong></em></p></td></tr>
<tr><td bgcolor="#ffccaa">
<table align="center" >
<tr>
<td height="23" bgcolor="527F76"><font size="4" color="#FFFFCC">UserId:</td>
<td><input type=text name=userid size=15></td>
</tr>
<tr>
<td height="23" bgcolor="527F76"><font size="4" color="#FFFFCC">PassWord:</td>
<td><input type=password name=pass size=15></td>
</tr>
<tr>
<td align="center" height="23" bgcolor="527F76"><font size="4" color="#FFFFCC">Role:</td>
<td align="center">
<select name=rol size=1>
<option value="ProjectManager">ProjectManager</option>
<option value="ProjectLeader">ProjectLeader</option>
<option value="TeamLeader">TeamLeader</option>
<option value="Programmer">Programmer</option>
</select></td>
</tr>
<tr>
<td align="center"><br> <input type=button value="L o g i n" onclick=validate()></td>
<td align="center"><br><input type=reset value="R e s e t"></td>
</tr>
</table>
<br></td></tr></table>
<br>
</form>
</body>
</html>


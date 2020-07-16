
<HTML><HEAD><TITLE>CRIMINAL PHOTO</TITLE>
<META>
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<form name=f>
<TR>
<td>

<center><h3>CRIMINAL PHOTO</h3> </center>

<table align=center border=1 colspace=10>

<%

String imgid=request.getParameter("imgid");

	out.print("<td class=tabhead1><img src='./img/");
	out.print(imgid);
	out.print(".bmp");
	out.print("'");
	
	out.print(" ");
	
	out.print("width=200 ");
	
    out.print(">");
		
	out.println("</td>");
	

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

<br>
<br>




</BODY>
</HTML>

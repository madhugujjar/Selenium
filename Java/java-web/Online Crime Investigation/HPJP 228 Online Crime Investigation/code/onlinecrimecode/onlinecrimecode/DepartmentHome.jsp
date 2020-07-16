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

<jsp:include page="DeptHeader.jsp" />

<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<BODY class=rightPage><A name=Entity_1></A>
<DIV class=caption1><br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
   <h3>WelCome To Department  Area</h3>
   
  <br>
  <br>
  <br>
  <br>
 
  
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <%
  System.out.println(session.getValue("regid")+"");
%>
</DIV>
<jsp:include page="Footer.htm" />

</BODY></HTML>

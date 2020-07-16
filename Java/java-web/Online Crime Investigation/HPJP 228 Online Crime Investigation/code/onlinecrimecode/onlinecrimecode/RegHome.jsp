<HTML>
<BODY bottomMargin=0 leftMargin=0
background="Images/shim.gif" topMargin=0
rightMargin=0 MS_POSITIONING="GridLayout">

<%@page import="java.sql.*,CMST.*" %>
<%
 String caution="No Cautions";
 
try

{

 Connection con=null;
 ResultSet rs=null;

 ConnectionBean CBean=new ConnectionBean();
 con=CBean.getConnection();
 rs=CBean.executeQuery("select * from cautions");
 
 if(rs.next())
 {
    caution=rs.getString(1);
 }else
 {
    caution="No Cautions";
 
 }
 
 rs.close();
}catch(Exception ex)
{



}


%>


<FORM id=Form1 name=Form1 action= method=post encType=multipart/form-data>
  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width="5%"><IMG height=16
      src="Images/top1.gif" width=94></TD>
      <TD bgColor=#e5e5e5 colSpan=2><img height=16
      src="Images/top1.gif" width=694></TD>
    <TD align=right width="10%"><IMG height=16
      src="Images/topr.gif" width=211></TD></TR>
  <TR>
    <TD><IMG height=79 alt=CID
      src="Images/cid.gif" width=94></TD>
    <TD width="45%"
      background="Images/tbg.gif"><IMG height=79
      src="Images/cid_let.gif" width=368></TD>
    <TD align=right width="22%"
    background="Images/tbg.gif"><IMG height=79
      src="Images/tr1.gif" width=72></TD>
    <TD align=right
      background="Images/tbg.gif"><IMG height=79
      src="Images/tr2.gif"
width=211></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
      <TD width="9%"
      background="Images/mbg.gif">&nbsp;</TD>
    <TD width="60%" background="Images/mbg.gif">
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
            <TD width=75>&nbsp;</TD>
            <TD width=75>&nbsp;</TD>
            <TD align=right width=95>&nbsp;</TD>



            <TD align=right width=85>&nbsp;</TD>
            <TD width=75>&nbsp;</TD>
            <TD width=65>&nbsp;</TD>
            <TD>&nbsp;</TD>
            <TD align=left>&nbsp;</TD>
          </TR></TBODY></TABLE></TD>
    <TD align=right width="31%"
    background="Images/mbg.gif"><IMG height=19
      src="Images/mright.gif" width=211></TD></TR>
  <TR><LINK href="Images/mt_style.css"
    type=text/css rel=stylesheet>
      <TD  class=nav  background="Images/mgbg.gif"
    colSpan=2> <IMG height=13 alt="CID Home" hspace=11
      src="Images/cid_home.gif" width=11
      align=absMiddle><a href="HomePage.jsp"><FONT 
color=#000066 > <b > Home Page</b></font></a> |<a disabled ><FONT 
color=#000066> <b>Registration</b></font></a>
        | <a href="Login.jsp"><FONT 
color=#000066> <b> Customer Login</b></font></a>| <a href="AdminLogin.jsp"><FONT 
color=#000066> <b> Admin Login</b></font></a>|<a href="DLogin.jsp"><FONT 
color=#000066> <b>Department
        Login</b></font></a></TD>

    <TD class=nav align=right
    background="Images/mgbg.gif" height=20><SPAN
      class=nav id=HeaderDate1_lblDate
      style="BACKGROUND-COLOR: transparent"></SPAN></TD></TR></TBODY></TABLE>
  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 height="261">
    <TBODY>
    <TR>
      <TD
  >&nbsp; </TD>
    <TD vAlign=top width="98%">
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
            <TD align=middle bgColor=#cc0000>&nbsp; </TD>
          </TR></TBODY></TABLE>
        <table cellspacing=0 cellpadding=0 width="100%" border=0>
          <tbody>
          <tr>
            <td width="60%"
          background="Images/alertbg.gif"><img
            height=30 alt="Most Wanted"
            src="Images/alert_head.gif"
          width=268></td>
		    <td width="100%"  background="Images/alertbg.gif"
         ><b><%=caution%></b></td>
		  
          </tr>
          <tr>

          </tr>
          </tbody>
        </table>
      </TD>
    <TD  vAlign=top align=right >
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=middle>

            <TABLE cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                  <TD background="Images/wadbg.gif">&nbsp;
                  </TD>
                </TR></TBODY></TABLE>
              <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 height="42">
                <TBODY>
                <TR>
                  <TD class=greyhead width="94%"
                background="Images/grey_head.gif">&nbsp;</TD>
                  <TD class=greyhead align=right width="6%"
                background="Images/grey_head.gif"><IMG
                  height=22 src="Images/corner.gif"
                  width=9></TD>
                </TR>
                <TR>
                  <TD align=middle
                background="Images/crime_stats.jpg"
                colSpan=2>&nbsp;</TD>
                </TR>
                </TBODY>
              </TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=middle width="100%"><A
                  href="http://www.aponline.gov.in/" target=_blank><IMG id=img
                  style="HEIGHT: 60px" alt="AP Online"
                  src="Images/aponline.gif"
                  border=0></A>
  </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>

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
  <br><br>


<TABLE cellSpacing=0 cellPadding=0 width="100%"
border=0>
  <TBODY>
  <TR>

      <TD class=nav vAlign=center noWrap align=right height="20" bgcolor="#FFFFFF" background="Images/botbgh.gif">Developed
        by:<A
      href="">Millennium Software Solutions.</A></TD>
    </TR></TBODY></TABLE>

</FORM></BODY></HTML>

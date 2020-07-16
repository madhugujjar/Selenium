<%@ include file="Common.jsp" %><%!
//
//   Filename: Header.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/2001
//

static final String sFileName = "Header.jsp";
              
static final String PageBODY = "bgcolor=\"#FFFFFF\"";
static final String FormTABLE = "";
static final String FormHeaderTD = "bgcolor=\"#808080\" align=\"center\"";
static final String FormHeaderFONT = "face=\"arial\" color=\"#FFFFFF\" style=\"font:bold\"";
static final String FieldCaptionTD = "bgcolor=\"#CCCCCC\"";
static final String FieldCaptionFONT = "face=\"arial\" size=\"2\" style=\"font:bold\"";
static final String DataTD = "bgcolor=\"#EEEEEE\"";
static final String DataFONT = "face=\"arial\" size=\"2\"";
static final String ColumnFONT = "face=\"arial\" size=\"2\" style=\"font:bold\"";
static final String ColumnTD = "bgcolor=\"#CCCCCC\"";
%><%
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sHeaderErr = "";

java.sql.Connection conn = null;
java.sql.Statement stat = null;
conn = cn();
stat = conn.createStatement();
%><table cellspacing="0" cellpadding="0" background="images/background.gif">
 <tr>
  <td><img src="images/logo.gif"><a href="/adxpress"><img border="0" src="images/banner.gif"></a>
  </td>
<tr>
<td><hr color="#000000" size="1">
<br>
</td>
</tr>
</table>
<table cellspacing="0" cellpadding="0" background="images/background.gif">
<tr>
<td valign="top">
 <table>
  <tr>
   <td valign="top">
<% Header_Show(request, response, session, out, sHeaderErr, sForm, sAction, conn, stat); %>   
   </td>
  </tr>
 </table>
</td>
<td><img src="images/0-0.gif" width="30"></td>
<td>
<%!

  void Header_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sHeaderErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
  
      out.println("    <table >");
      
      out.print("     <tr>");
      // Set URLs
      
      String fldField1 = "Default.jsp";
      String fldField4 = "Registration.jsp";
      String fldField3 = "MyClassifieds.jsp";
      String fldField5 = "MyAdSelCat.jsp";
      String fldField2 = "AdminMenu.jsp";
      // Show fields
      
      out.print("\n      <td bgcolor=\"#EEEEEE\"><a href=\""+fldField1+"\"><font face=\"arial\" size=\"2\"><img src=\"images/home.gif\" border=\"0\"></font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td bgcolor=\"#EEEEEE\"><a href=\""+fldField4+"\"><font face=\"arial\" size=\"2\"><img src=\"images/reg.gif\" border=\"0\"></font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td bgcolor=\"#EEEEEE\"><a href=\""+fldField3+"\"><font face=\"arial\" size=\"2\"><img src=\"images/my.gif\" border=\"0\"></font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td bgcolor=\"#EEEEEE\"><a href=\""+fldField5+"\"><font face=\"arial\" size=\"2\"><img src=\"images/new.gif\" border=\"0\"></font></a></td>\n\n      </tr>\n\n      <tr>");
      out.print("\n      <td bgcolor=\"#EEEEEE\"><a href=\""+fldField2+"\"><font face=\"arial\" size=\"2\"><img src=\"images/admin.gif\" border=\"0\"></font></a></td><tr>");

	  out.print("\n      <td bgcolor=\"#EEEEEE\"><a href=\"YDefault.jsp\"><font face=\"arial\" size=\"2\"><img src=\"images/yellowpagesgif.gif\" border=\"0\"></font></a></td></tr><tr>");

	  out.print("\n      <td bgcolor=\"#EEEEEE\"><a href=\"LDefault.jsp\"><font face=\"arial\" size=\"2\"><img src=\"images/links.gif\" border=\"0\"></font></a></td></tr><tr>");

	  out.print("\n      <td bgcolor=\"#EEEEEE\"><a href=\"TDefault.jsp\"><font face=\"arial\" size=\"2\"><img src=\"images/tasks.gif\" border=\"0\"></font></a></td>");

      out.println("\n     </tr>\n    </table>");
  
    }
    catch (Exception e) { out.println(e.toString()); }
  }
%>
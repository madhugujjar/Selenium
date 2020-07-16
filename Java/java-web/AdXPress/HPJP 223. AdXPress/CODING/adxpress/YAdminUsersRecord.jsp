<%@ include file="YCommon.jsp" %><%!
//
//   Filename: AdminUsersRecord.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "YAdminUsersRecord.jsp";
              
static final String PageBODY = "bgcolor=\"#FFFFFF\" text=\"#000000\" link=\"#0000FF\" vlink=\"#800080\" alink=\"#FF0000\"";
static final String FormTABLE = "border=\"0\" cellspacing=\"0\" cellpadding=\"2\"";
static final String FormHeaderTD = "align=\"center\" bgcolor=\"#99CCFF\"";
static final String FormHeaderFONT = "style=\"font-size: 12pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\"";
static final String FieldCaptionTD = "bgcolor=\"#FFFF99\"";
static final String FieldCaptionFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\"";
static final String DataTD = "bgcolor=\"#F5F5F5\"";
static final String DataFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\"";
static final String ColumnFONT = "style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\"";
static final String ColumnTD = "bgcolor=\"#FFD9E5\"";
%><%

String cSec = checkSecurity(3, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String susersErr = "";

java.sql.Connection conn = null;
java.sql.Statement stat = null;
String sErr = loadDriver();
conn = cn();
stat = conn.createStatement();
if ( ! sErr.equals("") ) {
 try {
   out.println(sErr);
 }
 catch (Exception e) {}
}
if ( sForm.equals("members") ) {
  susersErr = usersAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(susersErr)) return;
}

%>            
<html>
<head>
<title>YellowPages</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/01"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">
<jsp:include page="Header.jsp" flush="true"/>
<jsp:include page="YHeader.jsp" flush="true"/>
 <table>
  <tr>
   
   <td valign="top">
<% users_Show(request, response, session, out, susersErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["members"])
document.members.onsubmit=delconf;
function delconf() {
if (document.members.FormAction.value == 'delete')
  return confirm('Delete record?');
}
</SCRIPT>
   </td>
  </tr>
 </table>


<center><font face="Arial"></small></font></center>
</body>
</html>
<%%>
<%
if ( stat != null ) stat.close();
if ( conn != null ) conn.close();
%>
<%!


  String usersAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String susersErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "YAdminUsersGrid.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKuser_id = "";
      if (sAction.equalsIgnoreCase("cancel") ) {
        try {
          if ( stat != null ) stat.close();
          if ( conn != null ) conn.close();
        }
        catch ( java.sql.SQLException ignore ) {}
        response.sendRedirect (sActionFileName);
        return "sendRedirect";
      }

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKuser_id = getParam( request, "PK_user_id");
        if ( isEmpty(pPKuser_id)) return susersErr;
        sWhere = "user_id=" + toSQL(pPKuser_id, adNumber);
      }


      String flduser_login="";
      String flduser_password="";
      String flduser_level="";
      String fldname="";
      String fldemail="";
      String flduser_id="";

      // Load all form fields into variables
    
      flduser_login = getParam(request, "user_login");
      flduser_password = getParam(request, "user_password");
      flduser_level = getParam(request, "user_level");
      fldname = getParam(request, "name");
      fldemail = getParam(request, "email");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(flduser_login) ) {
          susersErr = susersErr + "The value in field Login is required.<br>";
        }
        if ( isEmpty(flduser_password) ) {
          susersErr = susersErr + "The value in field Password is required.<br>";
        }
        if ( isEmpty(flduser_level) ) {
          susersErr = susersErr + "The value in field Level is required.<br>";
        }
        if ( isEmpty(fldname) ) {
          susersErr = susersErr + "The value in field Name is required.<br>";
        }
        if ( ! isNumber(flduser_level)) {
          susersErr = susersErr + "The value in field Level is incorrect.<br>";
        }
        if ( ! isEmpty(flduser_login)) {
          iCount = 0;
          if ( iAction == iinsertAction ) {
            iCount = dCountRec(stat, "members", "user_login=" + toSQL(flduser_login, adText));
          }
          else {
            if ( iAction == iupdateAction ) {
              iCount = dCountRec( stat, "members", "user_login=" + toSQL(flduser_login, adText) + " and not(" + sWhere + ")");
            }
          }
          if (iCount > 0) {
            susersErr = susersErr + "The value in field Login is already in database.<br>";
          }
        }
        if (susersErr.length() > 0 ) {
          return (susersErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into members (" + 
                "user_login," +
                "user_password," +
                "user_level," +
                "name," +
                "email)" +

                " values (" + 
                toSQL(flduser_login, adText) + "," +
                toSQL(flduser_password, adText) + "," +
                toSQL(flduser_level, adNumber) + "," +
                toSQL(fldname, adText) + "," +
                toSQL(fldemail, adText) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update members set " +
                "user_login=" + toSQL(flduser_login, adText) +
                ",user_password=" + toSQL(flduser_password, adText) +
                ",user_level=" + toSQL(flduser_level, adNumber) +
                ",name=" + toSQL(fldname, adText) +
                ",email=" + toSQL(fldemail, adText);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from members where " + sWhere;
          
        break;
  
      }

      if ( susersErr.length() > 0 ) return susersErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        susersErr = e.toString(); return (susersErr);
      }
  
      try {
        if ( stat != null ) stat.close();
        if ( conn != null ) conn.close();
      }
      catch ( java.sql.SQLException ignore ) {}
      response.sendRedirect (sActionFileName);

      return "sendRedirect";
    }
    catch (Exception e) {out.println(e.toString()); }
    return (susersErr);
  }

  


  void users_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String susersErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {

      String sSQL="";
      String sQueryString = "";
      String sPage = "";
      String sWhere = "";
      String transitParams = "";
      String transitParamsHidden = "";
      String requiredParams = "";
      String primaryKeyParams ="";
      java.util.Hashtable rsHash = new java.util.Hashtable();
      
      String puser_id = "";

      String flduser_id="";
      String flduser_login="";
      String flduser_password="";
      String flduser_level="";
      String fldname="";
      String fldemail="";


      boolean bPK = true;

      if ( "".equals(susersErr)) {
        // Load primary key and form parameters
        puser_id = getParam( request, "user_id");
      }
      else {
        // Load primary key, form parameters and form fields
        flduser_id = getParam( request, "user_id");
        flduser_login = getParam( request, "user_login");
        flduser_password = getParam( request, "user_password");
        flduser_level = getParam( request, "user_level");
        fldname = getParam( request, "name");
        fldemail = getParam( request, "email");
        puser_id = getParam( request, "PK_user_id");
      }

      
      if ( isEmpty(puser_id)) { bPK = false; }
      
      sWhere += "user_id=" + toSQL(puser_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_user_id\" value=\""+puser_id+"\"/>";

      sSQL = "select * from members where " + sWhere;


      out.println("    <table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#99CCFF\" colspan=\"2\"><font style=\"font-size: 12pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">members</font></td>\n     </tr>");
      if ( ! susersErr.equals("")) {
        out.println("     <tr>\n      <td bgcolor=\"#F5F5F5\" colspan=\"2\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+susersErr+"</font></td>\n     </tr>");
      }
      susersErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"members\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "members".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        flduser_id = (String) rsHash.get("user_id");
        if ( "".equals(susersErr)) {
          // Load data from recordset when form displayed first time
          flduser_login = (String) rsHash.get("user_login");
          flduser_password = (String) rsHash.get("user_password");
          flduser_level = (String) rsHash.get("user_level");
          fldname = (String) rsHash.get("name");
          fldemail = (String) rsHash.get("email");
        }

        if (sAction.equals("") || ! "members".equals(sForm)) {
      
          flduser_id = (String) rsHash.get("user_id");
          flduser_login = (String) rsHash.get("user_login");
          flduser_password = (String) rsHash.get("user_password");
          flduser_level = (String) rsHash.get("user_level");
          fldname = (String) rsHash.get("name");
          fldemail = (String) rsHash.get("email");
        }
        
      }
      else {
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#FFFF99\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Login</font></td><td bgcolor=\"#F5F5F5\">"); out.print("<input type=\"text\"  name=\"user_login\" maxlength=\"15\" value=\""+toHTML(flduser_login)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#FFFF99\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Password</font></td><td bgcolor=\"#F5F5F5\">"); out.print("<input type=\"password\"  name=\"user_password\" maxlength=\"15\" value=\""+toHTML(flduser_password)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#FFFF99\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Level</font></td><td bgcolor=\"#F5F5F5\">"); 
      out.print("<select name=\"user_level\">"+getOptionsLOV("0;None;1;User;3;Admin",false,true,flduser_level)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#FFFF99\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Name</font></td><td bgcolor=\"#F5F5F5\">"); out.print("<input type=\"text\"  name=\"name\" maxlength=\"20\" value=\""+toHTML(fldname)+"\" size=\"20\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#FFFF99\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">E-mail</font></td><td bgcolor=\"#F5F5F5\">"); out.print("<input type=\"text\"  name=\"email\" maxlength=\"30\" value=\""+toHTML(fldemail)+"\" size=\"30\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "members".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.members.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.members.FormAction.value = 'delete';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.members.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"members\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Insert\" onclick=\"document.members.FormAction.value = 'insert';\">");out.print("<input type=\"submit\" value=\"Cancel\" onclick=\"document.members.FormAction.value = 'cancel';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"members\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"user_id\" value=\""+toHTML(flduser_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>
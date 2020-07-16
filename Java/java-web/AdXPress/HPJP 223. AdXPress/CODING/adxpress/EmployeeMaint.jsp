<%@ include file="TCommon.jsp" %><%!
//
//   Filename: EmployeeMaint.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "EmployeeMaint.jsp";
              
static final String PageBODY = "bgcolor=\"#ffffff\"";
static final String FormTABLE = "bgcolor=\"#FFFFFF\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\"";
static final String FormHeaderTD = "bgcolor=\"#1262C4\" align=\"center\"";
static final String FormHeaderFONT = "face=\"tahoma\" style=\"font: bold\" size=\"2\" color=\"#ffffff\"";
static final String FieldCaptionTD = "bgcolor=\"#92BBEE\"";
static final String FieldCaptionFONT = "face=\"tahoma\" size=\"2\" color=\"#000000\"";
static final String DataTD = "bgcolor=\"#F2F8FF\"";
static final String DataFONT = "face=\"tahoma\" size=\"2\"";
static final String ColumnFONT = "face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\"";
static final String ColumnTD = "bgcolor=\"#92BBEE\"";
%><%

String cSec = checkSecurity(3, session, response, request);
if ("sendRedirect".equals(cSec) ) return;
                
boolean bDebug = false;

String sAction = getParam( request, "FormAction");
String sForm = getParam( request, "FormName");
String sEmployeeErr = "";

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
if ( sForm.equals("Employee") ) {
  sEmployeeErr = EmployeeAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sEmployeeErr)) return;
}

%>            
<html>
<head>
<title>Employee Maintenance</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#ffffff">
<jsp:include page="THeader.jsp" flush="true"/>
 <table>
  <tr>
   
   <td valign="top">
<% Employee_Show(request, response, session, out, sEmployeeErr, sForm, sAction, conn, stat); %>
    
   </td>
  </tr>
 </table>



</body>
</html>
<%%>
<%
if ( stat != null ) stat.close();
if ( conn != null ) conn.close();
%>
<%!


  String EmployeeAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sEmployeeErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "EmployeeList.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKmember_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKmember_id = getParam( request, "PK_member_id");
        if ( isEmpty(pPKmember_id)) return sEmployeeErr;
        sWhere = "member_id=" + toSQL(pPKmember_id, adNumber);
      }


      String fldname="";
      String fldemail="";
      String fldlogin="";
      String fldpass="";
      String fldmember_level="";
      String fldmember_id="";

      // Load all form fields into variables
    
      fldname = getParam(request, "name");
      fldemail = getParam(request, "email");
      fldlogin = getParam(request, "member_login");
      fldpass = getParam(request, "member_password");
      fldmember_level = getParam(request, "member_level");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldname) ) {
          sEmployeeErr = sEmployeeErr + "The value in field Name is required.<br>";
        }
        if ( isEmpty(fldlogin) ) {
          sEmployeeErr = sEmployeeErr + "The value in field Login is required.<br>";
        }
        if ( isEmpty(fldpass) ) {
          sEmployeeErr = sEmployeeErr + "The value in field Password is required.<br>";
        }
        if ( isEmpty(fldmember_level) ) {
          sEmployeeErr = sEmployeeErr + "The value in field Security Level is required.<br>";
        }
        if ( ! isNumber(fldmember_level)) {
          sEmployeeErr = sEmployeeErr + "The value in field Security Level is incorrect.<br>";
        }
        if ( ! isEmpty(fldlogin)) {
          iCount = 0;
          if ( iAction == iinsertAction ) {
            iCount = dCountRec(stat, "members", "member_login=" + toSQL(fldlogin, adText));
          }
          else {
            if ( iAction == iupdateAction ) {
              iCount = dCountRec( stat, "members", "member_login=" + toSQL(fldlogin, adText) + " and not(" + sWhere + ")");
            }
          }
          if (iCount > 0) {
            sEmployeeErr = sEmployeeErr + "The value in field Login is already in database.<br>";
          }
        }
        if (sEmployeeErr.length() > 0 ) {
          return (sEmployeeErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into members (" + 
                "name," +
                "email," +
                "member_login," +
                "member_password," +
                "member_level)" +

                " values (" + 
                toSQL(fldname, adText) + "," +
                toSQL(fldemail, adText) + "," +
                toSQL(fldlogin, adText) + "," +
                toSQL(fldpass, adText) + "," +
                toSQL(fldmember_level, adNumber) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update members set " +
                "name=" + toSQL(fldname, adText) +
                ",email=" + toSQL(fldemail, adText) +
                ",member_login=" + toSQL(fldlogin, adText) +
                ",member_password=" + toSQL(fldpass, adText) +
                ",member_level=" + toSQL(fldmember_level, adNumber);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from members where " + sWhere;
          
        break;
  
      }

      if ( sEmployeeErr.length() > 0 ) return sEmployeeErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sEmployeeErr = e.toString(); return (sEmployeeErr);
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
    return (sEmployeeErr);
  }

  


  void Employee_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sEmployeeErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pmember_id = "";

      String fldmember_id="";
      String fldname="";
      String fldemail="";
      String fldlogin="";
      String fldpass="";
      String fldmember_level="";


      boolean bPK = true;

      if ( "".equals(sEmployeeErr)) {
        // Load primary key and form parameters
        pmember_id = getParam( request, "member_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldmember_id = getParam( request, "member_id");
        fldname = getParam( request, "name");
        fldemail = getParam( request, "email");
        fldlogin = getParam( request, "member_login");
        fldpass = getParam( request, "member_password");
        fldmember_level = getParam( request, "member_level");
        pmember_id = getParam( request, "PK_member_id");
      }

      
      if ( isEmpty(pmember_id)) { bPK = false; }
      
      sWhere += "member_id=" + toSQL(pmember_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_member_id\" value=\""+pmember_id+"\"/>";

      sSQL = "select * from members where " + sWhere;


      out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">");
      out.println("     <tr>\n      <td bgcolor=\"#1262C4\" align=\"center\" colspan=\"2\"><font face=\"tahoma\" style=\"font: bold\" size=\"2\" color=\"#ffffff\">Add/Edit Employee</font></td>\n     </tr>");
      if ( ! sEmployeeErr.equals("")) {
        out.println("     <tr>\n      <td bgcolor=\"#F2F8FF\" colspan=\"2\"><font face=\"tahoma\" size=\"2\">"+sEmployeeErr+"</font></td>\n     </tr>");
      }
      sEmployeeErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"Employee\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "Employee".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldmember_id = (String) rsHash.get("member_id");
        if ( "".equals(sEmployeeErr)) {
          // Load data from recordset when form displayed first time
          fldname = (String) rsHash.get("name");
          fldemail = (String) rsHash.get("email");
          fldlogin = (String) rsHash.get("member_login");
          fldpass = (String) rsHash.get("member_password");
          fldmember_level = (String) rsHash.get("member_level");
        }

        if (sAction.equals("") || ! "Employee".equals(sForm)) {
      
          fldmember_id = (String) rsHash.get("member_id");
          fldname = (String) rsHash.get("name");
          fldemail = (String) rsHash.get("email");
          fldlogin = (String) rsHash.get("member_login");
          fldpass = (String) rsHash.get("member_password");
          fldmember_level = (String) rsHash.get("member_level");
        }
        
      }
      else {
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\">Name</font></td><td bgcolor=\"#F2F8FF\">"); out.print("<input type=\"text\"  name=\"name\" maxlength=\"50\" value=\""+toHTML(fldname)+"\" size=\"30\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\">Email</font></td><td bgcolor=\"#F2F8FF\">"); out.print("<input type=\"text\"  name=\"email\" maxlength=\"50\" value=\""+toHTML(fldemail)+"\" size=\"30\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\">Login</font></td><td bgcolor=\"#F2F8FF\">"); out.print("<input type=\"text\"  name=\"member_login\" maxlength=\"15\" value=\""+toHTML(fldlogin)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\">Password</font></td><td bgcolor=\"#F2F8FF\">"); out.print("<input type=\"password\"  name=\"member_password\" maxlength=\"15\" value=\""+toHTML(fldpass)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\">Security Level</font></td><td bgcolor=\"#F2F8FF\">"); 
      out.print("<select name=\"member_level\">"+getOptionsLOV("1;Member;3;Admin",false,true,fldmember_level)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "Employee".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.Employee.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.Employee.FormAction.value = 'delete';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Employee\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Add\" onclick=\"document.Employee.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"Employee\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"member_id\" value=\""+toHTML(fldmember_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>
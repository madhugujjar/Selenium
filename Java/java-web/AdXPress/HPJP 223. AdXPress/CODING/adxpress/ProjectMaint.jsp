<%@ include file="TCommon.jsp" %><%!
//
//   Filename: ProjectMaint.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "ProjectMaint.jsp";
              
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
String sProjectMaintErr = "";

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
if ( sForm.equals("ProjectMaint") ) {
  sProjectMaintErr = ProjectMaintAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sProjectMaintErr)) return;
}

%>            
<html>
<head>
<title>Project Maintenance</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/01"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#ffffff">
<jsp:include page="Header.jsp" flush="true"/>
<jsp:include page="THeader.jsp" flush="true"/>
 <table>
  <tr>
   
   <td valign="top">
<% ProjectMaint_Show(request, response, session, out, sProjectMaintErr, sForm, sAction, conn, stat); %>
    <SCRIPT Language="JavaScript">
if (document.forms["ProjectMaint"])
document.ProjectMaint.onsubmit=delconf;
function delconf() {
if (document.ProjectMaint.FormAction.value == 'delete')
  return confirm('Delete record?');
}
</SCRIPT>
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


  String ProjectMaintAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sProjectMaintErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "ProjectList.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKproject_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKproject_id = getParam( request, "PK_project_id");
        if ( isEmpty(pPKproject_id)) return sProjectMaintErr;
        sWhere = "project_id=" + toSQL(pPKproject_id, adNumber);
      }


      String fldproject_name="";
      String fldemployee_id="";
      String fldproject_id="";

      // Load all form fields into variables
    
      fldproject_name = getParam(request, "project_name");
      fldemployee_id = getParam(request, "employee_id");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldproject_name) ) {
          sProjectMaintErr = sProjectMaintErr + "The value in field Client Name is required.<br>";
        }
        if ( isEmpty(fldemployee_id) ) {
          sProjectMaintErr = sProjectMaintErr + "The value in field Responsible User is required.<br>";
        }
        if ( ! isNumber(fldemployee_id)) {
          sProjectMaintErr = sProjectMaintErr + "The value in field Responsible User is incorrect.<br>";
        }
        if (sProjectMaintErr.length() > 0 ) {
          return (sProjectMaintErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into projects (" + 
                "project_name," +
                "employee_id)" +

                " values (" + 
                toSQL(fldproject_name, adText) + "," +
                toSQL(fldemployee_id, adNumber) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update projects set " +
                "project_name=" + toSQL(fldproject_name, adText) +
                ",employee_id=" + toSQL(fldemployee_id, adNumber);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from projects where " + sWhere;
          
        break;
  
      }

      if ( sProjectMaintErr.length() > 0 ) return sProjectMaintErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sProjectMaintErr = e.toString(); return (sProjectMaintErr);
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
    return (sProjectMaintErr);
  }

  


  void ProjectMaint_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sProjectMaintErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String pproject_id = "";

      String fldproject_id="";
      String fldproject_name="";
      String fldemployee_id="";


      boolean bPK = true;

      if ( "".equals(sProjectMaintErr)) {
        // Load primary key and form parameters
        fldproject_id = getParam( request, "project_id");
        pproject_id = getParam( request, "project_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldproject_id = getParam( request, "project_id");
        fldproject_name = getParam( request, "project_name");
        fldemployee_id = getParam( request, "employee_id");
        pproject_id = getParam( request, "PK_project_id");
      }

      
      if ( isEmpty(pproject_id)) { bPK = false; }
      
      sWhere += "project_id=" + toSQL(pproject_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_project_id\" value=\""+pproject_id+"\"/>";

      sSQL = "select * from projects where " + sWhere;


      out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">");
      out.println("     <tr>\n      <td bgcolor=\"#1262C4\" align=\"center\" colspan=\"2\"><font face=\"tahoma\" style=\"font: bold\" size=\"2\" color=\"#ffffff\">Add/Edit Client</font></td>\n     </tr>");
      if ( ! sProjectMaintErr.equals("")) {
        out.println("     <tr>\n      <td bgcolor=\"#F2F8FF\" colspan=\"2\"><font face=\"tahoma\" size=\"2\">"+sProjectMaintErr+"</font></td>\n     </tr>");
      }
      sProjectMaintErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"ProjectMaint\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "ProjectMaint".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldproject_id = (String) rsHash.get("project_id");
        if ( "".equals(sProjectMaintErr)) {
          // Load data from recordset when form displayed first time
          fldproject_name = (String) rsHash.get("project_name");
          fldemployee_id = (String) rsHash.get("employee_id");
        }

        if (sAction.equals("") || ! "ProjectMaint".equals(sForm)) {
      
          fldproject_id = (String) rsHash.get("project_id");
          fldproject_name = (String) rsHash.get("project_name");
          fldemployee_id = (String) rsHash.get("employee_id");
        }
        
      }
      else {
        if ( "".equals(sProjectMaintErr)) {
          fldproject_id = toHTML(getParam(request,"project_id"));
        }
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\">Client Name</font></td><td bgcolor=\"#F2F8FF\">"); out.print("<input type=\"text\"  name=\"project_name\" maxlength=\"50\" value=\""+toHTML(fldproject_name)+"\" size=\"50\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\">Responsible User</font></td><td bgcolor=\"#F2F8FF\">"); 
      out.print("<select name=\"employee_id\">"+getOptions( conn, "select member_id, name from members order by 2",false,true,fldemployee_id)+"</select>");
      
      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "ProjectMaint".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.ProjectMaint.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.ProjectMaint.FormAction.value = 'delete';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"ProjectMaint\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Add\" onclick=\"document.ProjectMaint.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"ProjectMaint\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"project_id\" value=\""+toHTML(fldproject_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>
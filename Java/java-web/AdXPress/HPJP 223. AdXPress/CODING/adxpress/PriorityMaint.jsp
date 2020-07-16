<%@ include file="TCommon.jsp" %><%!
//
//   Filename: PriorityMaint.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "PriorityMaint.jsp";
              
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
String sPriorityMaintErr = "";

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
if ( sForm.equals("PriorityMaint") ) {
  sPriorityMaintErr = PriorityMaintAction(request, response, session, out, sAction, sForm, conn, stat);
  if ( "sendRedirect".equals(sPriorityMaintErr)) return;
}

%>            
<html>
<head>
<title>Priority Maintenance</title>
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
<% PriorityMaint_Show(request, response, session, out, sPriorityMaintErr, sForm, sAction, conn, stat); %>
    
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


  String PriorityMaintAction(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sAction, String sForm, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
  
    String sPriorityMaintErr ="";
    try {

      if (sAction.equals("")) return "";

      String sSQL="";
      String transitParams = "";
      String primaryKeyParams = "";
      String sQueryString = "";
      String sPage = "";
      String sParams = "";
      String sActionFileName = "PrioritiesList.jsp";
      String sWhere = " ";
      boolean bErr = false;
      long iCount = 0;

  
      String pPKpriority_id = "";

      final int iinsertAction = 1;
      final int iupdateAction = 2;
      final int ideleteAction = 3;
      int iAction = 0;

      if ( sAction.equalsIgnoreCase("insert") ) { iAction = iinsertAction; }
      if ( sAction.equalsIgnoreCase("update") ) { iAction = iupdateAction; }
      if ( sAction.equalsIgnoreCase("delete") ) { iAction = ideleteAction; }

      // Create WHERE statement

      if ( iAction == iupdateAction || iAction == ideleteAction ) { 
        pPKpriority_id = getParam( request, "PK_priority_id");
        if ( isEmpty(pPKpriority_id)) return sPriorityMaintErr;
        sWhere = "priority_id=" + toSQL(pPKpriority_id, adNumber);
      }


      String fldpriority_desc="";
      String fldpriority_id="";

      // Load all form fields into variables
    
      fldpriority_desc = getParam(request, "priority_desc");
      // Validate fields
      if ( iAction == iinsertAction || iAction == iupdateAction ) {
        if ( isEmpty(fldpriority_desc) ) {
          sPriorityMaintErr = sPriorityMaintErr + "The value in field Priority is required.<br>";
        }
        if (sPriorityMaintErr.length() > 0 ) {
          return (sPriorityMaintErr);
        }
      }


      sSQL = "";
      // Create SQL statement

      switch (iAction) {
  
        case iinsertAction :
          
            sSQL = "insert into priorities (" + 
                "priority_desc)" +

                " values (" + 
                toSQL(fldpriority_desc, adText) + ")";
          break;
  
      case iupdateAction:
        
          sSQL = "update priorities set " +
                "priority_desc=" + toSQL(fldpriority_desc, adText);
          sSQL = sSQL + " where " + sWhere;
        break;
      
      case ideleteAction:
           sSQL = "delete from priorities where " + sWhere;
          
        break;
  
      }

      if ( sPriorityMaintErr.length() > 0 ) return sPriorityMaintErr;
      try {
        // Execute SQL statement
        stat.executeUpdate(sSQL);
      }
      catch(java.sql.SQLException e) {
        sPriorityMaintErr = e.toString(); return (sPriorityMaintErr);
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
    return (sPriorityMaintErr);
  }

  


  void PriorityMaint_Show(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sPriorityMaintErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
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
      
      String ppriority_id = "";

      String fldpriority_id="";
      String fldpriority_desc="";


      boolean bPK = true;

      if ( "".equals(sPriorityMaintErr)) {
        // Load primary key and form parameters
        fldpriority_id = getParam( request, "priority_id");
        ppriority_id = getParam( request, "priority_id");
      }
      else {
        // Load primary key, form parameters and form fields
        fldpriority_id = getParam( request, "priority_id");
        fldpriority_desc = getParam( request, "priority_desc");
        ppriority_id = getParam( request, "PK_priority_id");
      }

      
      if ( isEmpty(ppriority_id)) { bPK = false; }
      
      sWhere += "priority_id=" + toSQL(ppriority_id, adNumber);
      primaryKeyParams += "<input type=\"hidden\" name=\"PK_priority_id\" value=\""+ppriority_id+"\"/>";

      sSQL = "select * from priorities where " + sWhere;


      out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">");
      out.println("     <tr>\n      <td bgcolor=\"#1262C4\" align=\"center\" colspan=\"2\"><font face=\"tahoma\" style=\"font: bold\" size=\"2\" color=\"#ffffff\">Add/Edit Priority</font></td>\n     </tr>");
      if ( ! sPriorityMaintErr.equals("")) {
        out.println("     <tr>\n      <td bgcolor=\"#F2F8FF\" colspan=\"2\"><font face=\"tahoma\" size=\"2\">"+sPriorityMaintErr+"</font></td>\n     </tr>");
      }
      sPriorityMaintErr="";
      out.println("     <form method=\"get\" action=\""+sFileName+"\" name=\"PriorityMaint\">");

      java.sql.ResultSet rs = null;

      if ( bPK &&  ! (sAction.equals("insert") && "PriorityMaint".equals(sForm))) {

        // Open recordset
        rs = openrs( stat, sSQL);
        rs.next();
        String[] aFields = getFieldsName( rs );
        getRecordToHash( rs, rsHash, aFields );
        rs.close();
        fldpriority_id = (String) rsHash.get("priority_id");
        if ( "".equals(sPriorityMaintErr)) {
          // Load data from recordset when form displayed first time
          fldpriority_desc = (String) rsHash.get("priority_desc");
        }

        if (sAction.equals("") || ! "PriorityMaint".equals(sForm)) {
      
          fldpriority_id = (String) rsHash.get("priority_id");
          fldpriority_desc = (String) rsHash.get("priority_desc");
        }
        
      }
      else {
        if ( "".equals(sPriorityMaintErr)) {
          fldpriority_id = toHTML(getParam(request,"priority_id"));
        }
      }
      


      // Show form field
      
      out.print("     <tr>\n      <td bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\">Priority</font></td><td bgcolor=\"#F2F8FF\">"); out.print("<input type=\"text\"  name=\"priority_desc\" maxlength=\"15\" value=\""+toHTML(fldpriority_desc)+"\" size=\"15\">");

      out.println("</td>\n     </tr>");
      
      out.print("     <tr>\n      <td colspan=\"2\" align=\"right\">");
      

      if ( bPK && ! (sAction.equals("insert") && "PriorityMaint".equals(sForm))) {
        out.print("<input type=\"submit\" value=\"Update\" onclick=\"document.PriorityMaint.FormAction.value = 'update';\">");out.print("<input type=\"submit\" value=\"Delete\" onclick=\"document.PriorityMaint.FormAction.value = 'delete';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"PriorityMaint\"><input type=\"hidden\" value=\"update\" name=\"FormAction\">");
      }
      
      else {
        out.print("<input type=\"submit\" value=\"Add\" onclick=\"document.PriorityMaint.FormAction.value = 'insert';\">");
        out.print("<input type=\"hidden\" name=\"FormName\" value=\"PriorityMaint\"><input type=\"hidden\" value=\"insert\" name=\"FormAction\">");
      }out.print("<input type=\"hidden\" name=\"priority_id\" value=\""+toHTML(fldpriority_id)+"\">");
      out.print(transitParamsHidden+requiredParams+primaryKeyParams);
      out.println("</td>\n     </tr>\n     </form>\n    </table>");
      



    }
    catch (Exception e) { out.println(e.toString()); }
  } %>
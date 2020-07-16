<%@ include file="TCommon.jsp" %><%!
//
//   Filename: PrioritiesList.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "PrioritiesList.jsp";
              
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
String sPrioritiesListErr = "";

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

%>            
<html>
<head>
<title>Priorities List</title>
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
<% PrioritiesList_Show(request, response, session, out, sPrioritiesListErr, sForm, sAction, conn, stat); %>
    
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

  void PrioritiesList_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sPrioritiesListErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
    String sWhere = "";
    int iCounter=0;
    int iPage = 0;
    boolean bIsScroll = true;
    boolean hasParam = false;
    String sOrder = "";
    String sSQL="";
    String transitParams = "";
    String sQueryString = "";
    String sPage = "";
    int RecordsPerPage = 20;
    String sSortParams = "";
    String formParams = "";


 
    // Build WHERE statement
        
    // Build ORDER statement
    sOrder = " order by p.priority_desc Asc";

  // Build full SQL statement
  
  sSQL = "select p.priority_desc as p_priority_desc, " +
    "p.priority_id as p_priority_id " +
    " from priorities p ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"1\" bgcolor=\"#F2F8FF\"><font face=\"tahoma\" size=\"2\">No records</font></td>\n     </tr>";


  String tableHeader = "";
    tableHeader = "     <tr>\n      <td colspan=\"1\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Priority</font></td>\n     </tr>";
  
  
  try {
    out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">");
    out.println("     <tr>\n      <td bgcolor=\"#1262C4\" align=\"center\" colspan=\"1\"><a name=\"PrioritiesList\"><font face=\"tahoma\" style=\"font: bold\" size=\"2\" color=\"#ffffff\">Priorities List</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    java.sql.ResultSet rs = null;
    // Open recordset
    rs = openrs( stat, sSQL);
    iCounter = 0;
    
    java.util.Hashtable rsHash = new java.util.Hashtable();
    String[] aFields = getFieldsName( rs );

    // Show main table based on recordset
    while ( rs.next() ) {

      getRecordToHash( rs, rsHash, aFields );
      String fldpriority_desc = (String) rsHash.get("p_priority_desc");
      String fldpriority_id = (String) rsHash.get("p_priority_id");

      out.println("     <tr>");
      
      out.print("      <td bgcolor=\"#F2F8FF\">"); out.print("<a href=\"PriorityMaint.jsp?"+transitParams+"priority_id="+toURL((String) rsHash.get("p_priority_id"))+"&\"><font face=\"tahoma\" size=\"2\">"+toHTML(fldpriority_desc)+"</font></a>");

      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"1\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
      out.print("<a href=\"PriorityMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Priority</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    out.print("     <tr>\n      <td colspan=\"1\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
    out.print("<a href=\"PriorityMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Priority</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
    out.println("</td>\n     </tr>");
    
    }

    if ( rs != null ) rs.close();
    out.println("    </table>");
    
  }
  catch (Exception e) { out.println(e.toString()); }
}
%>
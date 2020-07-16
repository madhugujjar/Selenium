<%@ include file="TCommon.jsp" %><%!
//
//   Filename: StatusList.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "StatusList.jsp";
              
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
String sStatusListErr = "";

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
<title>Status List</title>
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
<% StatusList_Show(request, response, session, out, sStatusListErr, sForm, sAction, conn, stat); %>
    
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

  void StatusList_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sStatusListErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
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
    sOrder = " order by s.status_id Asc";
    String sSort = getParam( request, "FormStatusList_Sorting");
    String sSorted = getParam( request, "FormStatusList_Sorted");
    String sDirection = "";
    String sForm_Sorting = "";
    int iSort = 0;
    try {
      iSort = Integer.parseInt(sSort);
    }
    catch (NumberFormatException e ) {
      sSort = "";
    }
    if ( iSort == 0 ) {
      sForm_Sorting = "";
    }
    else {
      if ( sSort.equals(sSorted)) { 
        sSorted="0";
        sForm_Sorting = "";
        sDirection = " DESC";
        sSortParams = "FormStatusList_Sorting=" + sSort + "&FormStatusList_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "FormStatusList_Sorting=" + sSort + "&FormStatusList_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by s.status" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select s.status as s_status, " +
    "s.status_id as s_status_id " +
    " from statuses s ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"1\" bgcolor=\"#F2F8FF\"><font face=\"tahoma\" size=\"2\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td bgcolor=\"#92BBEE\"><a href=\""+sFileName+"?"+formParams+"FormStatusList_Sorting=1&FormStatusList_Sorted="+sSorted+"&\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Status</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">");
    out.println("     <tr>\n      <td bgcolor=\"#1262C4\" align=\"center\" colspan=\"1\"><a name=\"StatusList\"><font face=\"tahoma\" style=\"font: bold\" size=\"2\" color=\"#ffffff\">Status List</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "FormStatusList_Page"));
  }
  catch (NumberFormatException e ) {
    iPage = 0;
  }

  if (iPage == 0) { iPage = 1; }
  RecordsPerPage = 20;
  try {
    java.sql.ResultSet rs = null;
    // Open recordset
    rs = openrs( stat, sSQL);
    iCounter = 0;
    absolute (rs, (iPage-1)*RecordsPerPage+1);
    java.util.Hashtable rsHash = new java.util.Hashtable();
    String[] aFields = getFieldsName( rs );

    // Show main table based on recordset
    while ( (iCounter < RecordsPerPage) && rs.next() ) {

      getRecordToHash( rs, rsHash, aFields );
      String fldstatus = (String) rsHash.get("s_status");
      String fldstatus_id = (String) rsHash.get("s_status_id");

      out.println("     <tr>");
      
      out.print("      <td bgcolor=\"#F2F8FF\">"); out.print("<a href=\"StatusMaint.jsp?"+transitParams+"status_id="+toURL((String) rsHash.get("s_status_id"))+"&\"><font face=\"tahoma\" size=\"2\">"+toHTML(fldstatus)+"</font></a>");

      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"1\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
      out.print("<a href=\"StatusMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Status</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"1\" bgcolor=\"#92BBEE\">\n       <font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
      out.print("\n        <a href=\"StatusMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Status</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"1\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
    
      out.print("\n       <a href=\"StatusMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Status</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormStatusList_Page="+(iPage - 1)+"#Form\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormStatusList_Page="+(iPage + 1)+"#Form\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"1\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
        out.print("\n        <a href=\"StatusMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Status</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      }
    
      out.println("</td>\n     </tr>");
    }
  
    }

    if ( rs != null ) rs.close();
    out.println("    </table>");
    
  }
  catch (Exception e) { out.println(e.toString()); }
}
%>
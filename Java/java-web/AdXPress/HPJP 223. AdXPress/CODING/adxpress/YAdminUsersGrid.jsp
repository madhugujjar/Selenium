<%@ include file="YCommon.jsp" %><%!
//
//   Filename: AdminUsersGrid.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "YAdminUsersGrid.jsp";
              
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
String sSearchErr = "";

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
<% Search_Show(request, response, session, out, sSearchErr, sForm, sAction, conn, stat); %>
    
   </td>
  </tr>
 </table>
 <table>
  <tr>
   <td valign="top">
<% users_Show(request, response, session, out, susersErr, sForm, sAction, conn, stat); %>
    
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

  void users_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String susersErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
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

      String pname="";


    formParams = "name=" + toURL(getParam( request, "name")) + "&"; 
    // Build WHERE statement
    // Check members parameter and create a valid sql for where clause 
   
    pname = getParam( request, "name");


    if ( ! pname.equals("") ) { 
      hasParam = true;
      sWhere = "u.user_login like '%" + replace(pname, "'", "''") + "%'" + " or " + "u.name like '%" + replace(pname, "'", "''") + "%'";}
    if (hasParam) { sWhere = " WHERE (" + sWhere + ")"; }
    // Build ORDER statement
    String sSort = getParam( request, "Formusers_Sorting");
    String sSorted = getParam( request, "Formusers_Sorted");
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
        sSortParams = "Formusers_Sorting=" + sSort + "&Formusers_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "Formusers_Sorting=" + sSort + "&Formusers_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by u.user_login" + sDirection; }
      if ( iSort == 2) { sOrder = " order by u.name" + sDirection; }
      if ( iSort == 3) { sOrder = " order by u.user_level" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select u.name as u_name, " +
    "u.user_id as u_user_id, " +
    "u.user_level as u_user_level, " +
    "u.user_login as u_user_login " +
    " from members u ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"3\" bgcolor=\"#F5F5F5\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td bgcolor=\"#FFD9E5\"><a href=\""+sFileName+"?"+formParams+"Formusers_Sorting=1&Formusers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">User Login</font></a></td>\n      <td bgcolor=\"#FFD9E5\"><a href=\""+sFileName+"?"+formParams+"Formusers_Sorting=2&Formusers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Name</font></a></td>\n      <td bgcolor=\"#FFD9E5\"><a href=\""+sFileName+"?"+formParams+"Formusers_Sorting=3&Formusers_Sorted="+sSorted+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Level</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">");
    out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#99CCFF\" colspan=\"3\"><a name=\"members\"><font style=\"font-size: 12pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">members</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "Formusers_Page"));
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
      String fldname = (String) rsHash.get("u_name");
      String flduser_level = (String) rsHash.get("u_user_level");
      String flduser_login = (String) rsHash.get("u_user_login");

      out.println("     <tr>");
      
      out.print("      <td bgcolor=\"#F5F5F5\">"); out.print("<a href=\"YAdminUsersRecord.jsp?"+transitParams+"user_id="+toURL((String) rsHash.get("u_user_id"))+"&\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(flduser_login)+"</font></a>");

      out.println("</td>");
      out.print("      <td bgcolor=\"#F5F5F5\">"); out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(fldname)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#F5F5F5\">"); 
        flduser_level = getValFromLOV(flduser_level, "0;None;1;User;3;Admin");out.print("<font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">"+toHTML(flduser_level)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"3\" bgcolor=\"#FFD9E5\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
      out.print("<a href=\"YAdminUsersRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"3\" bgcolor=\"#FFD9E5\">\n       <font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
      out.print("\n        <a href=\"YAdminUsersRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"3\" bgcolor=\"#FFD9E5\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
    
      out.print("\n       <a href=\"YAdminUsersRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"Formusers_Page="+(iPage - 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"Formusers_Page="+(iPage + 1)+"#Form\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"3\" bgcolor=\"#FFD9E5\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">");
        out.print("\n        <a href=\"YAdminUsersRecord.jsp?"+formParams+"\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      }
    
      out.println("</td>\n     </tr>");
    }
  
    }

    if ( rs != null ) rs.close();
    out.println("    </table>");
    
  }
  catch (Exception e) { out.println(e.toString()); }
}


  void Search_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sSearchErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
    try {
      

      String fldname="";


      String sSQL="";
      String transitParams = "";
      String sQueryString = "";
      String sPage = "";
      

      out.println("    <table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">");
      out.println("     <tr>\n      <td align=\"center\" bgcolor=\"#99CCFF\" colspan=\"3\"><a name=\"Search\"><font style=\"font-size: 12pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold\">Search</font></a></td>\n     </tr>");
      out.println("     <form method=\"get\" action=\"YAdminUsersGrid.jsp\" name=\"Search\">\n     <tr>");
      // Set variables with search parameters
      
      fldname = getParam( request, "name");

      // Show fields
      

      out.println("      <td bgcolor=\"#FFFF99\"><font style=\"font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica\">Name</font></td>");
      out.print("      <td bgcolor=\"#F5F5F5\">"); out.print("<input type=\"text\"  name=\"name\" maxlength=\"20\" value=\""+toHTML(fldname)+"\" size=\"\">");
 out.println("</td>");
      
      out.println("      <td ><input type=\"submit\" value=\"Search\"/></td>");
      out.println("     </tr>\n     </form>\n    </table>");
      out.println("");
    }
    catch (Exception e) { out.println(e.toString()); }
  }
%>
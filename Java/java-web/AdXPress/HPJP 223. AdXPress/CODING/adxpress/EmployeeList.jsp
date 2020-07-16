<%@ include file="TCommon.jsp" %><%!
//
//   Filename: EmployeeList.jsp
//   Generated with CodeCharge  v.1.2.0
//   JSP.ccp build 05/21/01
//

static final String sFileName = "EmployeeList.jsp";
              
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
String sEmployeesErr = "";

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
<title>Employee List</title>
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
<% Employees_Show(request, response, session, out, sEmployeesErr, sForm, sAction, conn, stat); %>
    
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

  void Employees_Show (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sEmployeesErr, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException  {
  
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
    sOrder = " order by e.name Asc";
    String sSort = getParam( request, "FormEmployees_Sorting");
    String sSorted = getParam( request, "FormEmployees_Sorted");
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
        sSortParams = "FormEmployees_Sorting=" + sSort + "&FormEmployees_Sorted=" + sSort + "&";
      }
      else {
        sSorted=sSort;
        sForm_Sorting = sSort;
        sDirection = " ASC";
        sSortParams = "FormEmployees_Sorting=" + sSort + "&FormEmployees_Sorted=" + "&";
      }
    
      if ( iSort == 1) { sOrder = " order by e.name" + sDirection; }
      if ( iSort == 2) { sOrder = " order by e.member_login" + sDirection; }
      if ( iSort == 3) { sOrder = " order by e.email" + sDirection; }
      if ( iSort == 4) { sOrder = " order by e.member_level" + sDirection; }
    }
  

  // Build full SQL statement
  
  sSQL = "select e.email as e_email, " +
    "e.member_id as e_employee_id, " +
    "e.name as e_employee_name, " +
    "e.member_login as e_login, " +
    "e.member_level as e_security_level " +
    " from members e ";
  
  sSQL = sSQL + sWhere + sOrder;

  String sNoRecords = "     <tr>\n      <td colspan=\"4\" bgcolor=\"#F2F8FF\"><font face=\"tahoma\" size=\"2\">No records</font></td>\n     </tr>";


  String tableHeader = "";
      tableHeader = "     <tr>\n      <td bgcolor=\"#92BBEE\"><a href=\""+sFileName+"?"+formParams+"FormEmployees_Sorting=1&FormEmployees_Sorted="+sSorted+"&\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Employee</font></a></td>\n      <td bgcolor=\"#92BBEE\"><a href=\""+sFileName+"?"+formParams+"FormEmployees_Sorting=2&FormEmployees_Sorted="+sSorted+"&\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Login</font></a></td>\n      <td bgcolor=\"#92BBEE\"><a href=\""+sFileName+"?"+formParams+"FormEmployees_Sorting=3&FormEmployees_Sorted="+sSorted+"&\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Email</font></a></td>\n      <td bgcolor=\"#92BBEE\"><a href=\""+sFileName+"?"+formParams+"FormEmployees_Sorting=4&FormEmployees_Sorted="+sSorted+"&\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Security Level</font></a></td>\n     </tr>";
  
  
  try {
    out.println("    <table bgcolor=\"#FFFFFF\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">");
    out.println("     <tr>\n      <td bgcolor=\"#1262C4\" align=\"center\" colspan=\"4\"><a name=\"Employees\"><font face=\"tahoma\" style=\"font: bold\" size=\"2\" color=\"#ffffff\">Employees</font></a></td>\n     </tr>");
    out.println(tableHeader);

  }
  catch (Exception e) {}

  
  try {
    // Select current page
    iPage = Integer.parseInt(getParam( request, "FormEmployees_Page"));
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
      String fldemail = (String) rsHash.get("e_email");
      String fldemployee_id = (String) rsHash.get("e_employee_id");
      String fldemployee_name = (String) rsHash.get("e_employee_name");
      String fldlogin = (String) rsHash.get("e_login");
      String fldsecurity_level = (String) rsHash.get("e_security_level");

      out.println("     <tr>");
      
      out.print("      <td bgcolor=\"#F2F8FF\">"); out.print("<a href=\"EmployeeMaint.jsp?"+transitParams+"member_id="+toURL((String) rsHash.get("e_employee_id"))+"&\"><font face=\"tahoma\" size=\"2\">"+toHTML(fldemployee_name)+"</font></a>");

      out.println("</td>");
      out.print("      <td bgcolor=\"#F2F8FF\">"); out.print("<font face=\"tahoma\" size=\"2\">"+toHTML(fldlogin)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#F2F8FF\">"); out.print("<font face=\"tahoma\" size=\"2\">"+toHTML(fldemail)+"&nbsp;</font>");
      out.println("</td>");
      out.print("      <td bgcolor=\"#F2F8FF\">"); 
        fldsecurity_level = getValFromLOV(fldsecurity_level, "1;Member;3;Admin");out.print("<font face=\"tahoma\" size=\"2\">"+toHTML(fldsecurity_level)+"&nbsp;</font>");
      out.println("</td>");
      out.println("     </tr>");
    
      iCounter++;
    }
    if (iCounter == 0) {
      // Recordset is empty
      out.println(sNoRecords);
    
      out.print("     <tr>\n      <td colspan=\"4\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
      out.print("<a href=\"EmployeeMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Employee</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("</td>\n     </tr>");
    
      iCounter = RecordsPerPage+1;
      bIsScroll = false;
    }

    else {

  
    // Parse scroller
    boolean bInsert = false;
    boolean bNext = rs.next();
    if ( !bNext && iPage == 1 ) {
    
      out.print("     <tr>\n      <td colspan=\"4\" bgcolor=\"#92BBEE\">\n       <font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
      out.print("\n        <a href=\"EmployeeMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Employee</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      out.println("\n      </td>\n     </tr>");
    
    }
    else {
      out.print("     <tr>\n      <td colspan=\"4\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
    
      out.print("\n       <a href=\"EmployeeMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Employee</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
      bInsert = true;
    
      if ( iPage == 1 ) {
        out.print("\n       <a href_=\"#\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Previous</font></a>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormEmployees_Page="+(iPage - 1)+"#Form\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Previous</font></a>");
      }
  
      out.print("\n       [ "+iPage+" ]");
  
      if (!bNext) { 
        out.print("\n       <a href_=\"#\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Next</font></a><br>");
      }
      else {
        out.print("\n       <a href=\""+sFileName+"?"+formParams+sSortParams+"FormEmployees_Page="+(iPage + 1)+"#Form\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Next</font></a><br>");
      }
    
      if ( ! bInsert ) {
        out.print("     <tr>\n      <td colspan=\"4\" bgcolor=\"#92BBEE\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">");
        out.print("\n        <a href=\"EmployeeMaint.jsp?"+formParams+"\"><font face=\"tahoma\" size=\"2\" color=\"#000000\" style=\"font: bold\">Add New Employee</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
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
<%@ include file="LTemplateObj.jsp" %>
<%@ include file="LCommon.jsp" %><%!
//   Filename: Login.jsp
//   Generated with CodeCharge 1.2.0
//   JSPTemplates build 05/21/2001

String sFileName = "LLogin.jsp";

%><%

java.sql.Connection conn = null;
java.sql.Statement  stat = null;
String sErr = loadDriver();
if ( ! sErr.equals("") ) {
 try {
   out.println(sErr);
 }
 catch (Exception e) {}
}
conn = cn();                  
stat = conn.createStatement();


String sAction =null;
String sForm =null;



session.putValue("sLoginErr","");

String sTemplateFileName = "LLogin.html";





TextTemplate oTpl = new TextTemplate();
String appPath = pageContext.getServletContext().getRealPath(request.getRequestURI()).replace('\\','/');
String cPath = request.getContextPath();
if ( cPath.length() > 1 ) {
  int f1 = appPath.lastIndexOf(cPath);
  appPath = appPath.substring(0,f1)+appPath.substring(f1+cPath.length());
}
appPath = appPath.substring(0,appPath.lastIndexOf('/')+1);
oTpl.loadTemplate(appPath+ sTemplateFileName , "main"); 

final String sHeaderFileName = appPath + "LHeader.html";
oTpl.loadTemplate(sHeaderFileName, "Header"); 

oTpl.setVar ("FileName", sFileName);


oTpl.setVar ("PageBODY", stylePageBODY);

oTpl.setVar ("FormTABLE", styleFormTABLE);

oTpl.setVar ("FormHeaderTD", styleFormHeaderTD);

oTpl.setVar ("FormHeaderFONT", styleFormHeaderFONT);

oTpl.setVar ("FieldCaptionTD", styleFieldCaptionTD);

oTpl.setVar ("FieldCaptionFONT", styleFieldCaptionFONT);

oTpl.setVar ("DataTD", styleDataTD);

oTpl.setVar ("DataFONT", styleDataFONT);

oTpl.setVar ("ColumnFONT", styleColumnFONT);

oTpl.setVar ("ColumnTD", styleColumnTD);


sAction = getParam(request, "FormAction", Text_TYPE);
sForm = getParam(request, "FormName", Text_TYPE);

if (sForm.equalsIgnoreCase("Login")) {
  LoginAction( request, response, session, out, sForm, sAction, conn, stat, oTpl);
  if ("sendRedirect".equals(((String) session.getAttribute("sLoginErr"))) ) {
    if ( stat != null )  { stat.close(); stat = null; }
    if ( conn != null ) { conn.close(); conn = null; }
    return;
  }
}
Menu_Show( request, response, session, out, sForm, sAction, conn, stat, oTpl);
Login_Show( request, response, session, out, sForm, sAction, conn, stat, oTpl);
oTpl.parse("Header", false);
oTpl.parse("main", false);
out.print(oTpl.printVar("main"));


if ( stat != null )  { stat.close(); stat = null; }
if ( conn != null ) { conn.close(); conn = null; }

%><%!
void LoginAction( javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat, TextTemplate oTpl) throws java.io.IOException {

  if ("login".equals(sAction)){    
    // Login action
      
    String sLogin = getParam(request, "Login", Text_TYPE);
    String sPassword = getParam(request, "Password", Text_TYPE);
    String bPassed = dLookUp(stat, "members", "count(*)", "member_login =" + toSQL(sLogin, Text_TYPE) + " and member_password=" + toSQL(sPassword, Text_TYPE));
    System.out.println(sLogin);
    System.out.println(sPassword);
    System.out.println(bPassed);
    String sQueryString ="";
    String sPage="";
    if ((!isEmpty(bPassed))&&(!("0".equals(bPassed)))) {
      // Login and password passed
      session.setAttribute("UserID", dLookUp(stat, "members", "member_id", "member_login =" + toSQL(sLogin, Text_TYPE) + " and member_password=" + toSQL(sPassword, Text_TYPE)));
      
      session.setAttribute("UserRights", dLookUp(stat, "members", "member_level", "member_login ="+toSQL(sLogin,  Text_TYPE) + " and member_password=" + toSQL(sPassword, Text_TYPE)));
      sQueryString = getParam(request, "querystring", Text_TYPE);
      sPage = getParam(request, "ret_page", Text_TYPE);
      try{
        if ( ! sPage.equals(request.getRequestURI() ) && ! "".equals(sPage)) {
          try {
            if ( stat != null )  { stat.close(); stat = null; }
            if ( conn != null ) { conn.close(); conn = null; }
          }
          catch ( java.sql.SQLException ignore ) {}
          response.sendRedirect(sPage +"?" + sQueryString);
          addSessionError("sLoginErr", "sendRedirect", session);
          return;
        }
        
        try {
          if ( stat != null )  { stat.close(); stat = null; }
          if ( conn != null ) { conn.close(); conn = null; }
        }
        catch ( java.sql.SQLException ignore ) {}
        response.sendRedirect("LAdminMenu.jsp");
        addSessionError("sLoginErr", "sendRedirect", session);
        return;
      }catch(Exception e){};
    }else {
      // Logout action
      oTpl.setVar ("querystring", sQueryString);
      oTpl.setVar ("ret_page", sPage);
      session.putValue("sLoginErr", "Login or Password is incorrect.");
    }
    oTpl.parse ("FormLogin", false);
      
  } else if ("logout".equals(sAction)){
      
    session.removeAttribute("UserID");
    session.removeAttribute("UserRights");
    oTpl.parse ("FormLogin", false);
      
  }
}

void Login_Show( javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, String sForm, String sAction, java.sql.Connection conn, java.sql.Statement stat, TextTemplate oTpl) throws java.io.IOException {
  
  oTpl.setVar ("sLoginErr", (String) session.getAttribute("sLoginErr"));
  oTpl.setVar ("querystring", getParam(request, "querystring", Text_TYPE));
  oTpl.setVar ("ret_page", getParam(request, "ret_page", Text_TYPE));
  

  if (session.getAttribute("UserID")==null) {
    // User did not login
    oTpl.setVar ("LogoutAct", "");
    oTpl.setVar ("UserInd", "");
    oTpl.setVar ("Login", toHTML(getParam( request, "Login", Text_TYPE)));
    if ("".equals((String) session.getAttribute("sLoginErr")))
      oTpl.setVar ("LoginError", "");
    else {
      oTpl.setVar ("sLoginErr", (String) session.getAttribute("sLoginErr"));
      oTpl.parse ("LoginError", false);
    }
    oTpl.parse ("LoginAct", false);
   }
  else{
    // User logged in
    oTpl.setVar ("LoginError", "");
    oTpl.setVar ("LoginAct", "");
    oTpl.setVar ("UserID", dLookUp(stat, "members", "member_login", "member_id =" + ((String) session.getAttribute("UserID"))));
    oTpl.parse ("UserInd", false);
  }
  oTpl.parse ("FormLogin", false);
  

}
%><%@ include file="LHeader.jsp" %>
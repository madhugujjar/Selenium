<%@page language="java" import="java.sql.*,java.util.*"%>
<%Connection con;Class.forName("oracle.jdbc.driver.OracleDriver");
  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","knowledge","knowledge");
%>
  
  
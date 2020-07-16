<%@page import="java.net.*,java.io.*"%>
<%@include file="connect.jsp"%>
<%String method=request.getMethod();
       if(method.equals("GET"))
       {
                 String sid=request.getParameter("cc");
	String cid=request.getParameter("cid");
	 try{
  %>     
	<html><body><center><font color=blue><h3>Session Information</h3></font></center>
             <form action="CourseContent.jsp" method=POST><hr>
	<input type=hidden name=cid value=<%=cid%>><input type=hidden name=sid value=<%=sid%>>
<font color=red><b>Paste The Content Below In Html Format :</b></font><textarea name=ta cols=70 rows=20></textarea><br><input type=submit value=Paste>&nbsp;&nbsp;&nbsp;<input type=reset value=Clear>
<%
     }catch(Exception e){
%> <pre>
<%
      e.printStackTrace();
%>
     </pre>
<%
    }
    out.close();
   }
   else if(method.equals("POST"))
   {
      try{
	String cid=request.getParameter("cid");
	String sid=request.getParameter("sid");
	String fc=request.getParameter("ta");
	String fname="c:\\"+cid+sid+".html";
	FileOutputStream fout=new FileOutputStream(fname);
	fout.write(fc.getBytes(),0,fc.length());
	fout.flush();
	PreparedStatement ps=con.prepareStatement("insert into session_details 	values(?,?,?)");
	ps.setString(1,cid);
	ps.setString(2,sid);
	ps.setString(3,fname);
	int i=ps.executeUpdate();
%>  
	<html><body><center><font color=blue><h3>Updated Successfully</h3></font><br><input type=button value=Close onCLick='window.close()'></center></body></html>
<%
  con.close();
}catch(Exception e){
e.printStackTrace();
         }
}
%>
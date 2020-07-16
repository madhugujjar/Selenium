// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DeleteMail.java

import java.io.*;
import java.sql.*;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class DeleteMail extends HttpServlet
{

    public DeleteMail()
    {
    }

    public void service(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        int n = 0;
        String del = req.getParameter("maildel");
        String rep = req.getParameter("mailrep");
        if(del == null)
            del = "ok";
        String fromid = req.getParameter("mailid");
        String tablename = req.getParameter("mailid").substring(0, req.getParameter("mailid").indexOf('@'));
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();
        Enumeration enm = req.getParameterNames();
        try
        {
            if(del.equals("Delete"))
            {Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
                Statement st = con.createStatement();
                while(enm.hasMoreElements()) 
                {
                    String str = (String)enm.nextElement();
                    String val = req.getParameter(str);
                    if(val.equalsIgnoreCase(str))
                    {
                        val = val.substring(1 + val.indexOf(' '), 19).trim();
                        System.out.println(val);
                        String query = (new StringBuilder("delete from ")).append(tablename).append(" where time='").append(val).append("'").toString();
                        int i = st.executeUpdate(query);
                        n = i;
                    }
                }
                if(n >= 1)
                {
                    out.println("<br><br><br><font color=BLUE><center><img src='./jpg/Storm-01.gif' width=300 height=350></img><center></font>");
                    res.setHeader("refresh", (new StringBuilder("1;url=./EmployBean.jsp?mailid=")).append(fromid).toString());
                } else
                {
                    out.println((new StringBuilder("<br><br><br><font color=BLUE><center>")).append(n).append("----->Messages are deleted<center></font>").toString());
                }
            } else
            if(rep.equals("Reply"))
                res.sendRedirect("./ReplyWork.jsp");
        }
        catch(Exception e)
        {
            System.out.println((new StringBuilder("deletemail ")).append(e.getMessage()).toString());
        }
    }
}

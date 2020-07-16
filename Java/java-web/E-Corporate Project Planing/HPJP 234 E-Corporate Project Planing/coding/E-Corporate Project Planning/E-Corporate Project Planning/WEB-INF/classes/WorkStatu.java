// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   WorkStatu.java

import beans.DataBaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class WorkStatu extends HttpServlet
{

    public WorkStatu()
    {
    }

    public void init(ServletConfig servletconfig)
        throws ServletException
    {
    }

    public void service(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        DataBaseConnection bean = new DataBaseConnection();
        try
        {
            String query = (new StringBuilder("insert into Project_Status values(sysdate,'")).append(req.getParameter("pid")).append("','").append(req.getParameter("status")).append("')").toString();
            bean.setQuery(query);
            i = bean.getResult();
        }
        catch(Exception e)
        {
            message = e.getMessage();
        }
        if(i == 1)
        {
            out.println((new StringBuilder("<html><body bgcolor=#eeeeee><center><br><br><br>")).append(i).append("--->Record Successfully Inserted</center></body></html>").toString());
            res.setHeader("refresh", "1;url=./OveralProjectStatu.jsp");
        } else
        {
            out.println("<html><body bgcolor=#eeeeee><center><br><br><br>Record NOT Inserted");
            out.println((new StringBuilder("<br>Due To This Exception")).append(message).append("</center></body></html>").toString());
            res.setHeader("refresh", "12;url=./OveralProjectStatu.jsp");
        }
    }

    int i;
    String message;
}

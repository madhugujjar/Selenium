// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   WorkAssignment.java

import beans.DataBaseCreation;
import java.io.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class WorkAssignment extends HttpServlet
{

    public WorkAssignment()
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
        try
        {
            DataBaseCreation dbc = new DataBaseCreation();
            String query = (new StringBuilder("insert into ")).append(req.getParameter("to")).append(" values(").append("sysdate").append(",'").append(req.getParameter("subject")).append("','").append(req.getParameter("from")).append("','").append(req.getParameter("eid")).append("','").append(req.getParameter("work")).append("',").append("to_char(sysdate,'HH24:MI:SS')").append(")").toString();
            dbc.createQuery(req.getParameter("to"), query);
            n = dbc.getResult();
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        if(n == 1)
        {
            out.println((new StringBuilder("<html><body bgcolor=#eeeeee text=blue><center><br><br><br><br><h3>Your Message has been sent to <br>")).append(req.getParameter("to")).append("</center></body></html>").toString());
            res.setHeader("refresh", "1;url=./WorkAssignDetails.jsp");
        } else
        {
            out.println("<html><body bgcolor=#eeeeee><center><br><br><br>Message is not sent");
            out.println((new StringBuilder("<br>Due To This Exception")).append(message).append("</center></body></html>").toString());
            res.setHeader("refresh", "8;url=./WorkAssignDetails.jsp");
        }
    }

    public void destroy()
    {
    }

    int n;
    String message;
}

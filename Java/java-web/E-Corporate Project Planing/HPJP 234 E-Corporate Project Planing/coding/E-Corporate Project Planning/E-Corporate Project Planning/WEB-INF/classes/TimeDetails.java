// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TimeDetails.java

import beans.DataBaseConnection;
import java.io.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class TimeDetails extends HttpServlet
{

    public TimeDetails()
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
            System.out.println(req.getParameter("eid"));
            String query = (new StringBuilder("insert into Time_Details values('")).append(req.getParameter("pid")).append("','").append(req.getParameter("pgd")).append("','").append(req.getParameter("psd")).append("','").append(req.getParameter("crd")).append("','").append(req.getParameter("id")).append("','").append(req.getParameter("eid")).append("')").toString();
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
            res.setHeader("refresh", "1;url=./TimeDetailsFirst.jsp");
        } else
        {
            out.println("<html><body bgcolor=#eeeeee><center><br><br><br>Record NOT Inserted");
            out.println((new StringBuilder("<br>Due To This Exception")).append(message).append("</center></body></html>").toString());
            res.setHeader("refresh", "12;url=./TimeDetails.jsp");
        }
    }

    int i;
    String message;
}

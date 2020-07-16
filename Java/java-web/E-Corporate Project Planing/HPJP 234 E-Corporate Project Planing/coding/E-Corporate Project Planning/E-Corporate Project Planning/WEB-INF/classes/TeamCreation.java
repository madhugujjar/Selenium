// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TeamCreation.java

import beans.DataBaseConnection;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class TeamCreation extends HttpServlet
{

    public TeamCreation()
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
            String query = (new StringBuilder("insert into TEAM_CREATION values('")).append(req.getParameter("tid")).append("','").append(req.getParameter("tl")).append("','").append(Integer.parseInt(req.getParameter("tsize"))).append("','").append(req.getParameter("pid")).append("',").append("sysdate").append(",'").append(req.getParameter("psd")).append("')").toString();
            System.out.println("query ok");
            bean.setQuery(query);
            System.out.println("SET ok");
            i = bean.getResult();
            System.out.println("GET ok");
            System.out.println(i);
        }
        catch(Exception e)
        {
            message = e.getMessage();
        }
        if(i == 1)
        {
            out.println((new StringBuilder("<html><body bgcolor=#eeeeee><center><br><br><br>")).append(i).append("--->Record Successfully Inserted</center></body></html>").toString());
            res.setHeader("refresh", "3;url=./TeamsCreation.jsp");
        } else
        {
            out.println("<html><body bgcolor=#eeeeee><center><br><br><br>Record NOT Inserted");
            out.println((new StringBuilder("<br>Due To This Exception")).append(message).append("</center></body></html>").toString());
            res.setHeader("refresh", "12;url=./TeamsCreation.jsp");
        }
    }

    int i;
    String message;
}

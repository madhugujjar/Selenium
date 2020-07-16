// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ProjectDetails.java

import beans.DataBaseConnection;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ProjectDetails extends HttpServlet
{

    public ProjectDetails()
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
            String flatform = (new StringBuilder(String.valueOf(req.getParameter("frontend")))).append("/").append(req.getParameter("backend")).toString();
            String query = (new StringBuilder("insert into Project_Details values('")).append(req.getParameter("cid")).append("','").append(req.getParameter("pid")).append("','").append(req.getParameter("pname")).append("','").append(Integer.parseInt(req.getParameter("modul"))).append("','").append(req.getParameter("startdate")).append("','").append(req.getParameter("assteam")).append("','").append(flatform).append("')").toString();
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
            res.setHeader("refresh", "1;url=./ProjectDetails.jsp");
        } else
        {
            out.println("<html><body bgcolor=#eeeeee><center><br><br><br>Record NOT Inserted");
            out.println((new StringBuilder("<br>Due To This Exception")).append(message).append("</center></body></html>").toString());
            res.setHeader("refresh", "12;url=./ProjectDetails.jsp");
        }
    }

    int i;
    String message;
}

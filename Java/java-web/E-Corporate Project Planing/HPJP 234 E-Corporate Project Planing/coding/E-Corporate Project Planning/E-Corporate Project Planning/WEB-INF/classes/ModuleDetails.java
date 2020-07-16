// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ModuleDetails.java

import beans.DataBaseConnection;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ModuleDetails extends HttpServlet
{

    public ModuleDetails()
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
            String query = (new StringBuilder("insert into Module_Details values('")).append(req.getParameter("mid")).append("','").append(req.getParameter("pid")).append("','").append(req.getParameter("atid")).append("',").append("sysdate").append(",'").append(req.getParameter("dsubmit")).append("','").append(req.getParameter("frontend")).append("','").append(req.getParameter("des")).append("')").toString();
            System.out.println("query ok");
            bean.setQuery(query);
            System.out.println("SET ok");
            i = bean.getResult();
            System.out.println("GET ok");
            System.out.println(i);
            System.out.println("iook");
        }
        catch(Exception e)
        {
            message = e.getMessage();
        }
        if(i == 1)
        {
            out.println((new StringBuilder("<html><body bgcolor=#eeeeee><center><br><br><br>")).append(i).append("--->Record Successfully Inserted</center></body></html>").toString());
            res.setHeader("refresh", "1;url=./ModulDetails.jsp");
        } else
        {
            out.println("<html><body bgcolor=#eeeeee><center><br><br><br>Record NOT Inserted");
            out.println((new StringBuilder("<br>Due To This Exception")).append(message).append("</center></body></html>").toString());
            res.setHeader("refresh", "12;url=./ModulDetails.jsp");
        }
    }

    int i;
    String message;
}

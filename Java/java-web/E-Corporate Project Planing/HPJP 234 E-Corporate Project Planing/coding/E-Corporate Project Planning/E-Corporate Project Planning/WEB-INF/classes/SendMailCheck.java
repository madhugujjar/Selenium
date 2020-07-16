// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SendMailCheck.java

import beans.MailCheck;
import java.io.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SendMailCheck extends HttpServlet
{

    public SendMailCheck()
    {
    }

    public void init(ServletConfig servletconfig)
        throws ServletException
    {
    }

    public void service(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        try
        {
            MailCheck mc = new MailCheck();
            res.setContentType("text/html");
            PrintWriter out = res.getWriter();
            HttpSession session = req.getSession();
            String id = session.getAttribute("USER_ID").toString().substring(0, session.getAttribute("USER_ID").toString().indexOf('@'));
            mc.setMailid(id);
            i = mc.getResult();
            if(i == 1)
                session.setAttribute("TNAME_STATUE", "TRUE");
            else
                session.setAttribute("TNAME_STATUE", "FALSE");
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

    public void destroy()
    {
    }

    int i;
    String message;
}

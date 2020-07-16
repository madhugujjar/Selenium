// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LoginValidation.java

import java.io.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LoginValidation extends HttpServlet
{

    public LoginValidation()
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
        System.out.println(req.getParameter("rol"));
        HttpSession session = req.getSession();
        try
        {
            if(req.getParameter("rol").equalsIgnoreCase("ProjectManager"))
            {
                session.setAttribute("USER_ID", req.getParameter("userid"));
                res.sendRedirect("./HeadFrame.html");
            } else
            if(req.getParameter("rol").equalsIgnoreCase("ProjectLeader"))
            {
                session.setAttribute("USER_ID", req.getParameter("userid"));
                res.sendRedirect("./ProjectLeaderFrame.html");
            } else
            if(req.getParameter("rol").equalsIgnoreCase("TeamLeader"))
            {
                session.setAttribute("USER_ID", req.getParameter("userid"));
                res.sendRedirect("./TeamLeaderFrame.html");
            } else
            if(req.getParameter("rol").equalsIgnoreCase("Programmer"))
            {
                session.setAttribute("USER_ID", req.getParameter("userid"));
                res.sendRedirect("./ProgrammerForm.jsp");
            } else
            {
                out.println("<center><font color=black><h3><i><br><br>no Project Manager</i></h3></font></center>");
                res.setHeader("refresh", "4;url=./LoginForm.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
}

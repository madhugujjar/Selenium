// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SendMail.java

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

public class SendMail extends HttpServlet
{

    public SendMail()
    {
    }

    public void service(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        try
        {
            ServletContext sct = getServletConfig().getServletContext();
            RequestDispatcher disp = sct.getNamedDispatcher("Sendmailcheck");
            RequestDispatcher disp1 = sct.getRequestDispatcher("/EmployBean.jsp");
            disp.include(req, res);
            HttpSession session = req.getSession();
            String userid = session.getAttribute("USER_ID").toString();
            if(session.getAttribute("TNAME_STATUE").equals("TRUE"))
                res.sendRedirect((new StringBuilder("./EmployBean.jsp?mailid=")).append(userid).toString());
            else
            if(session.getAttribute("TNAME_STATUE").equals("FALSE"))
            {
                out.println("<br><br><br><center><font size=4 color=BLUE>Enter Correct Id</font></center>");
                res.setHeader("refresh", "2;url=./ProjectLEmpty.html");
            }
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
    }

    public void destroy()
    {
    }

    int i;
    String message;
}

// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MailAccess.java

package reportbean;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;

public class MailAccess
    implements Serializable
{

    public MailAccess()
    {
    }

    public void setSubject(String tname, String sub)
    {
        this.tname = tname;
        subject = sub;
        try
        {
            String query = (new StringBuilder("select *from ")).append(tname).append(" where subject='").append(sub).append("'").toString();Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
                pdate = rs.getString(1);
                subject = rs.getString(2);
                fromid = rs.getString(3);
                message = rs.getString(5);
            }
            con.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println((new StringBuilder("Mail Access")).append(e.getMessage()).toString());
        }
    }

    public String getPdate()
    {
        return pdate;
    }

    public String getSubject()
    {
        return subject;
    }

    public String getFromid()
    {
        return fromid;
    }

    public String getMessage()
    {
        return message;
    }

    private String pdate;
    private String tname;
    private String subject;
    private String fromid;
    private String message;
}

// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ClientReport.java

package bean;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;

public class ClientReport
    implements Serializable
{

    public ClientReport()
    {
    }

    public void setClientid(String cid)
    {
        this.cid = cid;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            st = con.createStatement();
            String query = (new StringBuilder("select clientname,phoneno,email,CLIENTREQUIREDPLATFORMS from client_details where clientid='")).append(cid).append("'").toString();
            rs = st.executeQuery(query);
            if(rs.next())
            {
                cname = rs.getString(1);
                phno = rs.getString(2);
                mailid = rs.getString(3);
                platform = rs.getString(4);
            }
            rs1 = st.executeQuery((new StringBuilder("select p_id from project_details where c_id='")).append(cid).append("'").toString());
            if(rs1.next())
                pid = rs1.getString(1);
            con.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println((new StringBuilder("client report exception   ")).append(e.getMessage()).toString());
        }
    }

    public String getCname()
    {
        return cname;
    }

    public String getPhno()
    {
        return phno;
    }

    public String getMailid()
    {
        return mailid;
    }

    public String getPlatform()
    {
        return platform;
    }

    public String getPid()
    {
        return pid;
    }

    private String cid;
    private String cname;
    private String phno;
    private String mailid;
    private String platform;
    private String pid;
    Connection con;
    Statement st;
    ResultSet rs;
    ResultSet rs1;
}

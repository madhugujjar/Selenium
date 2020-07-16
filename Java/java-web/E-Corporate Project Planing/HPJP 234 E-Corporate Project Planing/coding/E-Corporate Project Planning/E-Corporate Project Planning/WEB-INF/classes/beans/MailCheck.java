// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MailCheck.java

package beans;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;

public class MailCheck
    implements Serializable
{

    public MailCheck()
    {
        val = 0;
    }

    public void setMailid(String tname)
    {
        this.tname = tname;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            st = con.createStatement();
            for(rs = st.executeQuery("select *from tab"); rs.next();)
                if(tname.equalsIgnoreCase(rs.getString(1)))
                    val = 1;

            con.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

    public int getResult()
    {
        return val;
    }

    private String tname;
    private int val;
    Connection con;
    Statement st;
    ResultSet rs;
}

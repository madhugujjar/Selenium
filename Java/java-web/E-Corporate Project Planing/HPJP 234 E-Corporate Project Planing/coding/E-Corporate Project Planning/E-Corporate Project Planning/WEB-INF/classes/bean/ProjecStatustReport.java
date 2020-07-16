// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ProjecStatustReport.java

package bean;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;

public class ProjecStatustReport
    implements Serializable
{

    public ProjecStatustReport()
    {
    }

    public void setProjectId(String pid)
    {
        this.pid = pid;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            st = con.createStatement();
            String query = (new StringBuilder("select workstatus,c_id from project_status,project_details where(project_details.p_id=project_status.P_id and project_status.p_id='")).append(pid).append("')").toString();
            rs = st.executeQuery(query);
            if(rs.next())
            {
                work = rs.getString(1);
                cid = rs.getString(2);
            }
            con.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println((new StringBuilder("client report exception   ")).append(e.getMessage()).toString());
        }
    }

    public String getWork()
    {
        return work;
    }

    public String getCid()
    {
        return cid;
    }

    private String pid;
    private String work;
    private String cid;
    Connection con;
    Statement st;
    ResultSet rs;
}

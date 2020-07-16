// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ProjectReport.java

package bean;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;

public class ProjectReport
    implements Serializable
{

    public ProjectReport()
    {
    }

    public void setProjectid(String pid)
    {
        this.pid = pid;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            st = con.createStatement();
            String query = (new StringBuilder("select P_NAME,NO_MODULES,A_TEAMS,PL_FORM,C_ID from project_details where p_id='")).append(pid).append("'").toString();
            rs = st.executeQuery(query);
            if(rs.next())
            {
                pname = rs.getString(1);
                nom = rs.getString(2);
                ateam = rs.getString(3);
                flatform = rs.getString(4);
                cid = rs.getString(5);
            }
            con.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println((new StringBuilder("client report exception   ")).append(e.getMessage()).toString());
        }
    }

    public String getPname()
    {
        return pname;
    }

    public String getNom()
    {
        return nom;
    }

    public String getAteam()
    {
        return ateam;
    }

    public String getPlatform()
    {
        return flatform;
    }

    public String getCid()
    {
        return cid;
    }

    private String pname;
    private String nom;
    private String ateam;
    private String flatform;
    private String cid;
    private String pid;
    Connection con;
    Statement st;
    ResultSet rs;
    ResultSet rs1;
}

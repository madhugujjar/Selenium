// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PrimaryKeyGen.java

package bean;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;

public class PrimaryKeyGen
    implements Serializable
{

    public PrimaryKeyGen()
    {
    }

    public String getClientId()
    {
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            st = con.createStatement();
            rs = st.executeQuery("select max(clientid) from client_details");
            if(rs.next())
            {
                cid = rs.getString(1);
                if(cid == null)
                {
                    int n = 1;
                    cid = (new StringBuilder("CID_")).append(n).toString();
                } else
                {
                    int k = Integer.parseInt(cid.substring(4));
                    k++;
                    System.out.println((new StringBuilder("k==")).append(k).toString());
                    cid = (new StringBuilder("CID_")).append(k).toString();
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return cid;
    }

    public String getProjectId()
    {
        try
        {
            rspid = st.executeQuery("select max(p_id) from project_details");
            if(rspid.next())
            {
                pid = rspid.getString(1);
                if(pid == null)
                {
                    int n = 1;
                    pid = (new StringBuilder("PID_")).append(n).toString();
                } else
                {
                    int k = Integer.parseInt(pid.substring(4));
                    k++;
                    pid = (new StringBuilder("PID_")).append(k).toString();
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return pid;
    }

    private String cid;
    private String pid;
    Connection con;
    Statement st;
    ResultSet rs;
    ResultSet rspid;
}

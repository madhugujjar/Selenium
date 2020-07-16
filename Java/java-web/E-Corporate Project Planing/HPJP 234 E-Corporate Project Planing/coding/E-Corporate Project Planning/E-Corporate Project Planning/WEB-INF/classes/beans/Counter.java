// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Counter.java

package beans;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;
import java.util.Vector;

public class Counter
    implements Serializable
{

    public Counter()
    {
        v = new Vector();
    }

    public Vector getData()
    {
        return v;
    }

    public void setTname(String field, String tname)
    {
        this.tname = tname;
        this.field = field;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            st = con.createStatement();
            rs = st.executeQuery((new StringBuilder("select ")).append(field).append(" from ").append(tname).toString());
            v.clear();
            for(; rs.next(); v.addElement(rs.getString(1)));
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

    public String getClientId()
    {
        String cid = "";
        try
        {
            ResultSet rsclient = st.executeQuery("select max(clientid) from client_details");
            int n = 0;
            if(rs.next())
            {
                cid = rs.getString(1);
                n++;
                cid = (new StringBuilder("CID_")).append(n).toString();
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return cid;
    }

    int c;
    private String tname;
    private String field;
    Vector v;
    Connection con;
    Statement st;
    ResultSet rs;
}

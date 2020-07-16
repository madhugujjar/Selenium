// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Counter.java

package bean;

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
        {Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery((new StringBuilder("select ")).append(field).append(" from ").append(tname).toString());
            v.clear();
            for(; rs.next(); v.addElement(rs.getString(1)));
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

    int c;
    private String tname;
    private String field;
    Vector v;
}

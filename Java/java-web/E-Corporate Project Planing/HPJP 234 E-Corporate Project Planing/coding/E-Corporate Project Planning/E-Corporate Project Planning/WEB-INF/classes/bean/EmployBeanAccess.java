// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   EmployBeanAccess.java

package bean;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;
import java.util.Stack;
import java.util.Vector;

public class EmployBeanAccess
    implements Serializable
{

    public EmployBeanAccess()
    {
        i = 0;
        v = new Vector();
        s = new Stack();
    }

    public void setTname(String tname)
    {
        this.tname = tname;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            System.out.println(tname);
            st = con.createStatement();
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

    public int getCount()
    {
        try
        {
            i = 0;
            for(ResultSet rs1 = st.executeQuery((new StringBuilder("select *from ")).append(tname).toString()); rs1.next();)
                i++;

        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return i;
    }

    public Vector getSubject()
    {
        try
        {
            v.removeAllElements();
            for(ResultSet rs2 = st.executeQuery((new StringBuilder("select subject from ")).append(tname).toString()); rs2.next(); v.addElement(rs2.getString(1)));
        }
        catch(Exception e)
        {
            System.out.println((new StringBuilder("this is employbean access")).append(e.getMessage()).toString());
        }
        return v;
    }

    public Stack getDate()
    {
        try
        {
            for(ResultSet rs3 = st.executeQuery((new StringBuilder("select s_date from ")).append(tname).toString()); rs3.next(); s.addElement(rs3.getString(1)));
        }
        catch(Exception e)
        {
            System.out.println((new StringBuilder("this is employbean date access")).append(e.getMessage()).toString());
        }
        return s;
    }

    int i;
    private String tname;
    private String empno;
    Connection con;
    Statement st;
    Vector v;
    Stack s;
}

// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DataBaseCreation.java

package beans;

import java.io.Serializable;
import java.sql.*;

public class DataBaseCreation
    implements Serializable
{

    public DataBaseCreation()
    {
        i = 0;
    }

    public void createQuery(String to, String query)
    {
        this.to = to;
        this.query = query;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            Statement st = con.createStatement();
            for(ResultSet rs = st.executeQuery("select *from tab"); rs.next();)
                if(to.substring(0, to.indexOf('@')).equalsIgnoreCase(rs.getString(1)))
                    i = 1;

            if(i != 1)
            {
                b = st.execute((new StringBuilder("create table ")).append(to.substring(0, to.indexOf('@'))).append("(s_date date,subject varchar2(20),from_id varchar2(30),emp_id varchar2(10),message varchar2(300),Time varchar2(10))").toString());
                n = st.executeUpdate(query.replaceFirst(to, to.substring(0, to.indexOf('@'))));
            } else
            {
                n = st.executeUpdate(query.replaceFirst(to, to.substring(0, to.indexOf('@'))));
            }
            con.close();
            st.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public int getResult()
    {
        if(i != 1 && n == 1)
            return n;
        if(i == 0 || n == 1)
            return n;
        else
            return 0;
    }

    private String query;
    private String to;
    private boolean b;
    private int i;
    private int n;
}

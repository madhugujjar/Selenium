// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TimeDetailsBean.java

package bean;

import java.io.Serializable;
import java.sql.*;

public class TimeDetailsBean
    implements Serializable
{

    public TimeDetailsBean()
    {
    }

    public void setProjectId(String pid)
    {
        this.pid = pid;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            st = con.createStatement();
            String query = (new StringBuilder("select REGDATE,P_S_DATE,CLIENTREQUIREDDATE,clientid from client_details,project_details where(client_details.clientid=project_details.C_ID and project_details.p_id='")).append(pid).append("')").toString();
            rs = st.executeQuery(query);
            if(rs.next())
            {
                givendate = rs.getString(1);
                startdate = rs.getString(2);
                clireq = rs.getString(3);
                clientid = rs.getString(4);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public String getGivenDate()
    {
        return givendate;
    }

    public String getStartdate()
    {
        return startdate;
    }

    public String getRequired()
    {
        return clireq;
    }

    public String getClientid()
    {
        return clientid;
    }

    private String givendate;
    private String startdate;
    private String clireq;
    private String pid;
    private String clientid;
    Connection con;
    Statement st;
    ResultSet rs;
}

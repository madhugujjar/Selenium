// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TimeSheetReport.java

package bean;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;
import java.util.StringTokenizer;
import java.util.Vector;

public class TimeSheetReport
    implements Serializable
{

    public TimeSheetReport()
    {
        v = new Vector();
    }

    public void setProjectId(String pid)
    {
        this.pid = pid;
        try
        {Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            st = con.createStatement();
            String query = (new StringBuilder("select P_G_DATE,P_S_DATE,C_R_DATE,E_I_DATE From time_details where p_id='")).append(pid).append("'").toString();
            rs = st.executeQuery(query);
            if(rs.next())
            {
                pgdate = rs.getString(1);
                startdate = rs.getString(2);
                clireq = rs.getString(3);
                eidate = rs.getString(4);
            }
            rs1 = st.executeQuery((new StringBuilder("select c_id from project_details where p_id='")).append(pid).append("'").toString());
            if(rs1.next())
                clientid = rs1.getString(1);
            st.close();
            con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public String getGivendate()
    {
        date2 = pgdate;
        return pgdate;
    }

    public String getStartdate()
    {
        return startdate;
    }

    public String getRequired()
    {
        try
        {
            String creq = clireq;
            StringTokenizer token1 = new StringTokenizer(creq, "-");
            v.clear();
            for(; token1.hasMoreTokens(); v.add(token1.nextToken()));
            clireq = (new StringBuilder(String.valueOf(v.elementAt(2).toString()))).append("-").append(v.elementAt(1).toString()).append("-").append(v.elementAt(0).toString()).toString();
            date1 = clireq;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return clireq;
    }

    public String getEidate()
    {
        try
        {
            String edate = eidate;
            StringTokenizer token2 = new StringTokenizer(edate, "-");
            v.clear();
            for(; token2.hasMoreTokens(); v.add(token2.nextToken()));
            eidate = (new StringBuilder(String.valueOf(v.elementAt(2).toString()))).append("-").append(v.elementAt(1).toString()).append("-").append(v.elementAt(0).toString()).toString();
            date3 = eidate;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return eidate;
    }

    public String getClientid()
    {
        return clientid;
    }

    public String getPidate()
    {
        return clireq;
    }

    public String getPgrdate()
    {
        try
        {
            StringTokenizer dst1 = new StringTokenizer(date1, "-");
            v.clear();
            for(; dst1.hasMoreTokens(); v.add(new Integer(Integer.parseInt(dst1.nextToken()))));
            int y1 = (new Integer(v.elementAt(0).toString())).intValue();
            int m1 = (new Integer(v.elementAt(1).toString())).intValue();
            int d1 = (new Integer(v.elementAt(2).toString())).intValue();
            for(dst1 = new StringTokenizer(date2, "-"); dst1.hasMoreTokens(); v.add(new Integer(Integer.parseInt(dst1.nextToken()))));
            int y2 = (new Integer(v.elementAt(3).toString())).intValue();
            int m2 = (new Integer(v.elementAt(4).toString())).intValue();
            int d2 = (new Integer(v.elementAt(5).toString())).intValue();
            if(d1 <= 31 && d2 <= 31 && m1 <= 12 && m2 <= 12 && y1 > 1000)
            {
                if(d1 < d2)
                {
                    d1 = (d1 += 30) - d2;
                    m1--;
                } else
                {
                    d1 -= d2;
                }
                if(m1 < m2)
                {
                    m1 = (m1 += 12) - m2;
                    y1--;
                } else
                {
                    m1 -= m2;
                }
                if(y1 >= y2)
                    y1 -= y2;
                else
                    y1 = y2 - y1;
                if(y1 == 0 && m1 == 0 && d1 == 0)
                    System.out.println("Date is Equal so The Difference is zero");
                else
                    duration1 = (new StringBuilder(String.valueOf(y1))).append("-").append(m1).append("-").append(d1).toString();
            } else
            {
                System.out.println("Enter Correct Date");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return duration1;
    }

    public String getDuration2()
    {
        try
        {
            StringTokenizer dst2 = new StringTokenizer(date3, "-");
            v.clear();
            for(; dst2.hasMoreTokens(); v.add(new Integer(Integer.parseInt(dst2.nextToken()))));
            int y1 = (new Integer(v.elementAt(0).toString())).intValue();
            int m1 = (new Integer(v.elementAt(1).toString())).intValue();
            int d1 = (new Integer(v.elementAt(2).toString())).intValue();
            for(dst2 = new StringTokenizer(date1, "-"); dst2.hasMoreTokens(); v.add(new Integer(Integer.parseInt(dst2.nextToken()))));
            int y2 = (new Integer(v.elementAt(3).toString())).intValue();
            int m2 = (new Integer(v.elementAt(4).toString())).intValue();
            int d2 = (new Integer(v.elementAt(5).toString())).intValue();
            if(d1 <= 31 && d2 <= 31 && m1 <= 12 && m2 <= 12 && y1 > 1000)
            {
                if(d1 < d2)
                {
                    d1 = (d1 += 30) - d2;
                    m1--;
                } else
                {
                    d1 -= d2;
                }
                if(m1 < m2)
                {
                    m1 = (m1 += 12) - m2;
                    y1--;
                } else
                {
                    m1 -= m2;
                }
                if(y1 >= y2)
                    y1 -= y2;
                else
                    y1 = y2 - y1;
                if(y1 == 0 && m1 == 0 && d1 == 0)
                    System.out.println("Date is Equal so The Difference is zero");
                else
                    duration2 = (new StringBuilder(String.valueOf(y1))).append("-").append(m1).append("-").append(d1).toString();
            } else
            {
                System.out.println("Enter Correct Date");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return duration2;
    }

    private String pgdate;
    private String clireq;
    private String startdate;
    private String eidate;
    private String clientid;
    private String pid;
    private String date1;
    private String date2;
    private String date3;
    private String duration1;
    private String duration2;
    Connection con;
    Statement st;
    ResultSet rs;
    ResultSet rs1;
    Vector v;
}

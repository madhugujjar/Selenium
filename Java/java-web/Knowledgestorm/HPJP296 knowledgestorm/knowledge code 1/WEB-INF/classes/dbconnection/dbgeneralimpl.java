package dbconnection;
import java.sql.*;

    public class dbgeneralimpl implements DBConnection{
      public dbgeneralimpl(){
        System.out.println("in default");
		init();
       }
         public void init(){
		try{
          //Class.forName("oracle.jdbc.driver.OracleDriver");
          System.out.println("in init");
		}catch(Exception e){System.out.println("in init"+e);
}
         }
         Connection con;
       public Connection getConnection(){
         try{Class.forName("oracle.jdbc.driver.OracleDriver");con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","knowledge","knowledge");
        System.out.println("in connection");
          }catch(Exception e1){System.out.println("in connection"+e1);
		}
       return con;
         }
       public void close(){
          
           try{
System.out.println("in close");
         con.close();
          }catch(Exception e2){System.out.println("inclose"+e2);
}
       }

}
package dbconnection;

import java.sql.*;
public interface DBConnection{
       public void init();
       public Connection getConnection();
       public void close();
    
	}


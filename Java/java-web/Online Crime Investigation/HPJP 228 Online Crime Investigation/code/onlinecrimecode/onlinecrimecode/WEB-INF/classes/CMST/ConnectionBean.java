package CMST;
import java.sql.*;
public class ConnectionBean
{
private Connection connection;
private Statement statement;
private static final String driver="sun.jdbc.odbc.JdbcOdbcDriver";
private static final String  dbURL="jdbc:odbc:ocr";
private static final String login="ocr";
private static final String password="ocr";

public ConnectionBean()
{
try
{
	Class.forName(driver);
	connection=DriverManager.getConnection(dbURL,login,password);
	statement=connection.createStatement();
}
catch (ClassNotFoundException e)
{
	System.err.println("ConnectionBean: driver unavailable"+e);
	connection = null;
}
catch (SQLException e)
{
	System.err.println("ConnectionBean: driver not loaded"+e);
	connection = null;
}
catch (NullPointerException e)
{
	System.err.println("ConnectionBean: driver not loaded"+e);
	connection = null;
}
}
public Connection getConnection()
{
	return connection;
}
public void commit() throws SQLException
{
	connection.commit();
}
public void rollback() throws SQLException
{
	connection.rollback();
}

public void setAutoCommit(boolean autoCommit) throws SQLException
{
	connection.setAutoCommit(autoCommit );
}

public ResultSet executeQuery(String sql) throws SQLException
{
	return statement.executeQuery(sql);
}
public int executeUpdate(String sql) throws SQLException
{
	return statement.executeUpdate(sql);
}
public boolean execute(String sql) throws SQLException
{
         return statement.execute(sql);
}
protected void finalize()
{
try
{
	connection.close();
}
catch (SQLException e)
{
}
}
}
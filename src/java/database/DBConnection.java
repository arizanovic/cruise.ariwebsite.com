package database;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
 private Connection conn = null;
    private String url = "jdbc:mysql://127.0.0.1:3306/dudb";
    private String user = "retardinjo";
    private String password = "!S4MSUNG!";
    private static DBConnection instance = null;
    
    private DBConnection() throws SQLException {
 
     try {
         Class.forName("com.mysql.jdbc.Driver");
     } catch (ClassNotFoundException ex) {
         ex.printStackTrace();
     }
  

        conn = DriverManager.getConnection
        (url, user, password);
    }
    public static Connection getConn() 
            throws SQLException{
        if(instance==null)
            instance = new DBConnection();
        return instance.conn;
    }
}

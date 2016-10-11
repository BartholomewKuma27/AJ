package DBA;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Ika on 08.10.2016.
 */
public class Pool {
    private static Pool connectionPool;
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/barcs";

    static final String USER = "root";
    static final String PASS = "asakujaku12";

    private static Connection con = null;

    private Pool () throws  ClassNotFoundException, SQLException{
        Class.forName(JDBC_DRIVER);
        con = DriverManager.getConnection(DB_URL, USER, PASS);
    }

    public static Connection getConnection() throws SQLException, ClassNotFoundException{
        if (con == null){
            new Pool();
        }
        return con;
    }
}

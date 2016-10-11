/**
 * Created by Ika on 06.10.2016.
 */
import java.sql.*;

public class DBtest {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/test";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "asakujaku12";
    public static void main(String[] args) {
        Connection con = null;
        Statement stmt = null;

        try{

            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = con.createStatement();
            String sql;
            sql = "select id from test_data";
            ResultSet results = stmt.executeQuery(sql);
            results.next();
            int num = results.getInt("id");
            System.out.println("numia " + num);
        }
        catch (Exception e){
            e.printStackTrace();
        }

    }
}

package Controller;

import DBA.Database;
import DBA.Pool;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

/**
 * Created by Ika on 08.10.2016.
 */
public class LoginControl {
    public static HashMap<String, String> getLoginInfo(String username, String password)
            throws ClassNotFoundException, SQLException{
        Connection con = Pool.getConnection();
        Database db = new Database(con);
        HashMap<String,String> m = db.getUser(username, password);
        return m;
    }
}

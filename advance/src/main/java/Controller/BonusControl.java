package Controller;

import DBA.Database;
import DBA.Pool;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Ika on 10.10.2016.
 */
public class BonusControl {
    public static HashMap<String,Integer> getBonusForEmploy(String id) throws SQLException, ClassNotFoundException{
        Connection con = Pool.getConnection();
        Database db = new Database(con);
        return db.getBonusForEmploy(id);
    }

    public static HashMap<String, Object> getAllBonuses() throws SQLException, ClassNotFoundException{
        Connection con = Pool.getConnection();
        Database db = new Database(con);
        return db.getAllBonuses();
    }
}

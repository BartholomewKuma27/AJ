package Controller;

import DBA.Database;
import DBA.Pool;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by Ika on 09.10.2016.
 */
public class DepartmentControl {
    public static Object[] getAllDepartments() throws SQLException, ClassNotFoundException {
        Connection con = Pool.getConnection();
        Database db = new Database(con);
        Object[] arr = db.getAllDepartments();
        return arr;
    }

    public static void modifyDepartment(String id, String abr, String name, String dsc)  throws SQLException, ClassNotFoundException {
        Connection con = Pool.getConnection();
        Database db = new Database(con);
        db.modifyDepartment(id,abr ,name ,dsc);
    }

    public  static void removeDepartment(String id) throws SQLException, ClassNotFoundException{
        Connection con = Pool.getConnection();
        Database db = new Database(con);
        db.removeDepartment(id);
    }
}

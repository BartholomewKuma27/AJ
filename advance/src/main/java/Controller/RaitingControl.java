package Controller;

import DBA.Database;
import DBA.Pool;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

/**
 * Created by Ika on 11.10.2016.
 */
public class RaitingControl {
    private static double MAX_BONUS = 20;
    public static HashMap<String,Integer> getRaitings() throws SQLException, ClassNotFoundException {
        Connection con = Pool.getConnection();
        Database db = new Database(con);
        HashMap<String, Object> bonuses = db.getAllBonuses();
        HashMap<String, Integer> moneyMade = db.getMoneyMade();
        HashMap<String, Integer> raitings = new HashMap<String, Integer>();
        for(String employName : bonuses.keySet()){
            HashMap<String, Integer> tmp = (HashMap<String, Integer>) bonuses.get(employName);
            int bonusMoney = 0;
            for(String projectName : tmp.keySet()){
                bonusMoney += tmp.get(projectName);
            }
            int allMoney = moneyMade.get(employName);
            double bonusPercent = (double)bonusMoney*100 /allMoney;
            if(bonusPercent > MAX_BONUS){
                bonusPercent = MAX_BONUS;
            }
            int bonus = (int) (bonusPercent * 100/MAX_BONUS);
            raitings.put(employName, bonus);
            //System.out.println("bonusia" + bonus);
            //System.out.println("bonus fulia "+ bonusMoney);
            //System.out.println("mtelifulia " + allMoney);
            //System.out.println("bonus procentia "+ bonusPercent);
        }
        return raitings;
    }
}

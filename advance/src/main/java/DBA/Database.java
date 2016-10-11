package DBA;


import jdk.nashorn.internal.runtime.ECMAException;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/**
 * Created by Ika on 08.10.2016.
 */
public class Database {
    private Connection con;
    public Database(Connection con){
        this.con = con;
    }

    public HashMap<String, String> getUser(String username, String password){
        try{
            HashMap<String, String> m = new HashMap<String, String>();
            PreparedStatement stm = con.prepareStatement("select * from accounts where username=? and password=?");
            stm.setString(1,username);
            stm.setString(2,password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                String id = rs.getString("employee");
                String status = rs.getString("owner_status");
                m.put("id", id);
                m.put("status", status);
                return m;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public Object [] getAllDepartments(){
        try{
            int arrSize = countDepartments();
            Object [] arr  = new Object[arrSize];
            PreparedStatement stm = con.prepareStatement("select * from departments");
            ResultSet rs = stm.executeQuery();
            int i = 0;
            while (rs.next()){
                HashMap<String, String> m = new HashMap<String, String>();
                String id = rs.getString("id");
                m.put("id", id);
                String abr = rs.getString("abr");
                m.put("abr", abr);
                String name = rs.getString("name");
                m.put("name", name);
                String dsc = rs.getString("dsc");
                m.put("dsc", dsc);
                arr[i++] = m;
            }
            return arr;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    private int countDepartments(){
        try {
            int counter = 0;
            PreparedStatement stm = con.prepareStatement("select * from departments");
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                counter += 1;
            }
            return counter;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    public void modifyDepartment(String id,String abr, String name, String dsc){
        try{
            if(id.equals("")){
                PreparedStatement stm = con.prepareStatement("insert into departments (abr, name, dsc) values (?, ?, ?)");
                stm.setString(1, abr);
                stm.setString(2, name);
                stm.setString(3, dsc);
                stm.executeUpdate();
            }
            else{
                PreparedStatement stm = con.prepareStatement("update departments set abr=?, name=?, dsc=? where id=?");
                stm.setString(1, abr);
                stm.setString(2, name);
                stm.setString(3, dsc);
                stm.setInt(4, Integer.parseInt(id));
                stm.executeUpdate();
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public void removeDepartment(String id){
        try{
            PreparedStatement stm= con.prepareStatement("delete from departments where id=?");
            stm.setInt(1,Integer.parseInt(id));
            stm.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public HashMap<String,Integer> getBonusForEmploy(String id) {
        HashMap<String,Integer> returnMap = new HashMap<String, Integer>();
        try{
            PreparedStatement stm = con.prepareStatement("select * from problems where employee=? and status=?");
            stm.setInt(1,Integer.parseInt(id));
            stm.setString(2,"D");
            ResultSet rs = stm.executeQuery();
            HashMap<String, HashMap<String, Integer>> m = new HashMap<String, HashMap<String, Integer>>();
            ArrayList<int[]> used = new ArrayList<int[]>();
            while(rs.next()){
                int curProblemType = rs.getInt("problem_type");
                int projectId = rs.getInt("project");
                boolean wasThisTypeUsed = false;
                for(int i = 0; i < used.size(); i++){
                    int [] curTuple = used.get(i);
                    if (curTuple[0] == projectId && curTuple[1] == curProblemType){
                        wasThisTypeUsed = true;
                        break;
                    }
                }
                if(wasThisTypeUsed){
                    continue;
                }
                int [] tmp = new int[2];
                tmp[0] = projectId;
                tmp[1] = curProblemType;
                used.add(tmp);
                int hourSum = getFullHours(projectId, curProblemType);
                int myHours = getMyHours(projectId,curProblemType, id);
                int bonusPercent = getBonusPercent(projectId, curProblemType);
                int bonusMoney = getBonusMoney(projectId);

                int myPortion = bonusMoney*bonusPercent*myHours/(100*hourSum);

                String name = getProjectName(projectId);
                returnMap.put(name, myPortion);

                //System.out.println(myPortion);
                //System.out.println(hourSum);
                //System.out.println(myHours);
                //System.out.println(bonusMoney);
                //System.out.println(bonusMoney);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    private String getProjectName(int projectId) {
        String name = "";
        try{
            PreparedStatement stm = con.prepareStatement("select name from projects where id=?");
            stm.setInt(1,projectId);
            ResultSet rs = stm.executeQuery();
            rs.next();
            name = rs.getString("name");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return name;
    }

    private int getBonusMoney(int projectId) {
        int money = 0;
        try{
            PreparedStatement stm = con.prepareStatement("select bonus from projects where id=?");
            stm.setInt(1,projectId);
            ResultSet rs = stm.executeQuery();
            rs.next();
            money = rs.getInt("bonus");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return money;
    }

    private int getBonusPercent(int projectId, int problemType) {
        int percent = 0;
        try{
            PreparedStatement stm = con.prepareStatement("select bonus_percent from bonuses where project_id=? AND " +
                                                                "problem_type=?");
            stm.setInt(1,projectId);
            stm.setInt(2,problemType);
            ResultSet rs = stm.executeQuery();
            rs.next();
            percent = rs.getInt("bonus_percent");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return percent;
    }

    private int getMyHours(int projectId, int curProblemType, String id) {
        int sum = 0;
        try{
            PreparedStatement stm = con.prepareStatement("select sum(time_used) as sum_hours from problems" +
                    " where project=? and problem_type=? and employee=?");
            stm.setInt(1, projectId);
            stm.setInt(2,curProblemType);
            stm.setInt(3,Integer.parseInt(id));
            ResultSet rs = stm.executeQuery();
            rs.next();
            sum = rs.getInt("sum_hours");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return sum;
    }


    private int getFullHours(int projectId, int curProblemType) {
        int sum = 0;
        try{
            PreparedStatement stm = con.prepareStatement("select sum(time_used) as sum_hours from problems" +
                                                                " where project=? and problem_type=?");
            stm.setInt(1, projectId);
            stm.setInt(2,curProblemType);
            ResultSet rs = stm.executeQuery();
            rs.next();
            sum = rs.getInt("sum_hours");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return sum;
    }

    public HashMap<String, Object> getAllBonuses() {
        HashMap<String, Object>  m = new HashMap<String, Object>();
        try{
            PreparedStatement stm = con.prepareStatement("select id from employees e inner join accounts a" +
                    " on e.id=a.employee where a.owner_status=?");
            stm.setString(1,"E");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                String curId = Integer.toString(rs.getInt("id"));
                HashMap<String, Integer> curEmployMap = getBonusForEmploy(curId);
                String name = getEmployName(curId);
                m.put(name, curEmployMap);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return m;
    }

    private String getEmployName(String curId) {
        String name = "";
        try{
            PreparedStatement stm = con.prepareStatement("select name from employees where id=?");
            stm.setInt(1,Integer.parseInt(curId));
            ResultSet rs = stm.executeQuery();
            rs.next();
            name = rs.getString("name");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return name;
    }

    public HashMap<String,Integer> getMoneyMade() {
        HashMap<String,Integer> m = new HashMap<String, Integer>();
        try{
            PreparedStatement stm = con.prepareStatement("select name," +
                    " TIMESTAMPDIFF(MONTH, start_date, curdate()) * salary as  money from employees inner join accounts " +
                    "where accounts.owner_status='E'");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                String name = rs.getString("name");
                int money = rs.getInt("money");
                m.put(name,money);
            }
            /*
            for(String key : m.keySet()) {
                System.out.println(key);
                System.out.println(m.get(key));
            }
            */
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return m;
    }
}

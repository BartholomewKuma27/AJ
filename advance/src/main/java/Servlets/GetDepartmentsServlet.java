package Servlets;

import Controller.DepartmentControl;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

/**
 * Created by Ika on 09.10.2016.
 */
public class GetDepartmentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try{
            Object [] arr = DepartmentControl.getAllDepartments();
            HashMap<String, Object > responseMap = new HashMap<String, Object>();
            for (int i = 0; i < arr.length; i++){
                HashMap<String, String> m = (HashMap<String, String>) arr[i];
                responseMap.put("ind" + i, m);
            }
            PrintWriter out = resp.getWriter();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            out.print(new Gson().toJson(responseMap));
        }
        catch (Exception e){
            e.printStackTrace();
        }

    }
}

package Servlets;

import Controller.BonusControl;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

/**
 * Created by Ika on 10.10.2016.
 */
public class EmployBonusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try{
            HttpSession ses = req.getSession(false);
            String id = ses.getAttribute("id").toString();
            HashMap<String,Integer> m = BonusControl.getBonusForEmploy(id);
            PrintWriter out = resp.getWriter();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            out.print(new Gson().toJson(m));
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}

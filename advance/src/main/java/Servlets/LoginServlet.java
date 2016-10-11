package Servlets;

import Controller.LoginControl;
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
 * Created by Ika on 08.10.2016.
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try{

            String username = req.getParameter("username");
            String password = req.getParameter("password");
            HashMap<String, String> m = LoginControl.getLoginInfo(username, password);
            PrintWriter out = resp.getWriter();
            if (m != null) {
                m.put("ok", "ok");
                m.put("status", m.get("status"));
                saveSession(req, m.get("id"), m.get("status"));
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                out.print(new Gson().toJson(m));
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    private void saveSession(HttpServletRequest req, String id, String status) {
        HttpSession ses = req.getSession();
        ses.setAttribute("id", id);
        ses.setAttribute("status", status);
    }
}

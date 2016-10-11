import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Ika on 29.09.2016.
 */
public class Talker extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        String name = req.getParameter("name");
        System.out.println(name);
        PrintWriter out = resp.getWriter();
        String returnText = "WRONG NAME!!!";
        if(name.toLowerCase().equals("heisenberg")){
            returnText = "YOU ARE GOD DAMN RIGHT";
        }
        out.print(returnText);
    }
}

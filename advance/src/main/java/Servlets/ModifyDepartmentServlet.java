package Servlets;

import Controller.DepartmentControl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Ika on 10.10.2016.
 */
public class ModifyDepartmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
        try{
            String id =  req.getParameter("id");
            String abr =  req.getParameter("abr");
            String name =  req.getParameter("name");
            String dsc =  req.getParameter("dsc");
            DepartmentControl.modifyDepartment(id, abr, name, dsc);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}

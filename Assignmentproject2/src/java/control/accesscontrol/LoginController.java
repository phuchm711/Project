/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.accesscontrol;

import dal.UserDBContext;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author min
 */
public class LoginController extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        UserDBContext db = new UserDBContext();
        User account = db.get(username, password);
        
        if(account!=null)
        {
            req.getSession().setAttribute("account", account);
            
            resp.getWriter().println("login successful!");
        }
        else
        {
            resp.getWriter().println("login fail!");
        }
        
        String url = this.getInitParameter("url");
        resp.getWriter().println(url);
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Pre-processing: forward the user to the login page
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}

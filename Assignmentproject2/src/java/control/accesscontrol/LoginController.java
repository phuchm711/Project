package control.accesscontrol;

import dal.UserDBContext;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Login Controller
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDBContext db = new UserDBContext();
        User account = db.get(username, password);

        if (account != null) {
            // Set the user in session
            req.getSession().setAttribute("account", account);
            
            // Redirect to the dashboard page
            resp.sendRedirect("dashboard.jsp");
        } else {
            // If login fails, stay on the login page with an error message
            req.setAttribute("error", "Login failed! Please check your credentials.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward the user to the login page
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}

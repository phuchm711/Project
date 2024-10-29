package controller.employee ;
import entity.Department;
import entity.Employee;
import entity.User;
import control.accesscontrol.BaseRBACController;
import dal.DepartmentDBContext;
import dal.EmployeeDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
public class EmployeeCreateController extends BaseRBACController{
    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
//        DepartmentDBContext db = new DepartmentDBContext();
//        ArrayList<Department> depts = db.get("WS");
//
//        RoleDBContext rdb = new RoleDBContext();
//        ArrayList<Roles> roles = rdb.getRolesLimited();
//
//        req.setAttribute("depts", depts);
//        req.setAttribute("roles", roles);
//        req.getRequestDispatcher("../view/employee/create.jsp").forward(req, resp);
    }
    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String raw_name =req.getParameter("name");
        String raw_gender = req.getParameter("gender");
        String raw_dob = req.getParameter("dob");
        String raw_address = req.getParameter("address");
        String raw_did = req.getParameter("did");
        String raw_salary = req.getParameter("salary");       
        Employee e = new Employee();
        e.setEmployeeName(raw_name);
        e.setGender(raw_gender.equals("male"));
        e.setDob(Date.valueOf(raw_dob));
        //e.setEmployeeSalaryLevel(String.parseDouble(raw_salary));
        Department d = new Department();
        d.setId(Integer.parseInt(raw_did));
        e.setDept(d);    
       
        EmployeeDBContext db = new EmployeeDBContext();
        db.insert(e);
        resp.sendRedirect("filter");
    }
}

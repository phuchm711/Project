/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import control.accesscontrol.BaseRBACController;
import dal.DepartmentDBContext;
import dal.EmployeeDBContext;
import entity.Department;
import entity.Employee;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class EmployeeCreateController extends BaseRBACController {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        DepartmentDBContext db = new DepartmentDBContext();
        ArrayList<Department> depts = db.list();
        req.setAttribute("depts", depts);  
         req.getRequestDispatcher("../view/employee/create.jsp").forward(req, resp);
    }
    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
      String raw_name = req.getParameter("name");
      
        String raw_did = req.getParameter("DepartmentID");

// Khởi tạo đối tượng Employee
    Employee e = new Employee();
    e.setEmployeeName(raw_name);
   
    // Gán DepartmentID
    Department d = new Department();
    d.setId(Integer.parseInt(raw_did));
  e.setDept(d);
    
    // Gán người tạo
    e.setCreateBy(account.getUserName());

    // Lưu dữ liệu vào cơ sở dữ liệu
    EmployeeDBContext db = new EmployeeDBContext();
    db.insert(e);
    
    // Trả về kết quả cho người dùng
    resp.getWriter().println("Inserted Employee with ID: " + e.getEmployeeID());
}
}


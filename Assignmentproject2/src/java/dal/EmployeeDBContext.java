/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import entity.Role;
import entity.Department;
import entity.Employee;
import entity.Employee;
import entity.User;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class EmployeeDBContext extends DBContext<Employee> {

    public ArrayList<Employee> search(Integer EmployeeID, String EmployeeName, Boolean gender, Date from, Date to, Integer DepartmentID) {
        String sql = "SELECT \n"
                + "    e.EmployeeID, \n"
                + "    e.EmployeeName, \n"
                + "    e.gender, \n"
                + "    e.dob, \n"
                + "    d.DepartmentID, \n"
                + "    d.DepartmentName, \n"
                + "    r.RoleName \n"
                + "FROM \n"
                + "    Employee e \n"
                + "INNER JOIN \n"
                + "    Department d ON e.DepartmentID = d.DepartmentID \n"
                + "INNER JOIN \n"
                + "    Role r ON e.RoleID = r.RoleID \n"
                + "	WHERE \n"
                + "    1 = 1";
        ArrayList<Employee> emps = new ArrayList<>();
        ArrayList<Object> paramValues = new ArrayList<>();
        if (EmployeeID != null) {
            sql += " AND e.EmployeeID = ?";
            paramValues.add(EmployeeID);
        }
        if (EmployeeName != null) {
            sql += " AND e.EmployeeName LIKE '%' + ? + '%'";
            paramValues.add(EmployeeName);
        }
        if (gender != null) {
            sql += " AND e.gender = ?";
            paramValues.add(gender);
        }
        

        if (from != null) {
            sql += " AND e.dob >= ?";
            paramValues.add(from);
        }
        if (to != null) {
            sql += " AND e.dob = ?";
            paramValues.add(to);
        }
        if (DepartmentID != null && DepartmentID != -1) {
            sql += " AND d.DepartmentID  = ?";
            paramValues.add(DepartmentID);
        }
        

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            for (int i = 0; i < paramValues.size(); i++) {
                stm.setObject((i + 1), paramValues.get(i));
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setEmployeeID(rs.getInt("EmployeeID"));
                e.setEmployeeName(rs.getString("EmployeeName"));
                e.setGender(rs.getBoolean("gender"));
                e.setDob(rs.getDate("dob"));
                

                Department d = new Department();
                d.setName(rs.getString("DepartmentName"));
                e.setDept(d);

                Role r = new Role();
                r.setName(rs.getString("RoleName"));  // Lấy Role Name từ ResultSet
                e.setRoles(r);

                emps.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return emps;
    }

    @Override
    public void insert(Employee entity) {
        String sql_insert = "INSERT INTO [Employee] ([EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy])\n"
                + "     VALUES (?, ?, ?, ?, ?)";

        String sql_select = "SELECT @@IDENTITY as EmployeeID";

        PreparedStatement stm_insert = null;
        PreparedStatement stm_select = null;

        try {
            connection.setAutoCommit(false);
            stm_insert = connection.prepareStatement(sql_insert);
            stm_insert.setString(1, entity.getEmployeeName());
            stm_insert.setString(2, entity.getEmployeeSalaryLevel());
          //  stm_insert.setInt(3, entity.getRoleID());
            stm_insert.setInt(4, entity.getDept().getId());
            stm_insert.setString(5, entity.getCreateBy());
            stm_insert.executeUpdate();

            stm_select = connection.prepareStatement(sql_select);
            ResultSet rs = stm_select.executeQuery();
            if (rs.next()) {
                entity.setEmployeeID(rs.getInt("EmployeeID"));
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(Employee entity) {
        String sql_update = "UPDATE [Employee]\n"
                + "   SET [EmployeeName] = ?,\n"
                + "       [EmployeeSalaryLevel] = ?,\n"
                + "       [RoleID] = ?,\n"
                + "       [DepartmentID] = ?,\n"
                + "       [CreateBy] = ?\n"
                + " WHERE [EmployeeID] = ?";

        PreparedStatement stm_update = null;

        try {
            stm_update = connection.prepareStatement(sql_update);
            stm_update.setString(1, entity.getEmployeeName());
            stm_update.setString(2, entity.getEmployeeSalaryLevel());
           // stm_update.setInt(3, entity.getRoleID());
            stm_update.setInt(4, entity.getDept().getId());
            stm_update.setString(5, entity.getCreateBy());
            stm_update.setInt(6, entity.getEmployeeID());
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(Employee entity) {
        String sql_delete = "DELETE FROM [Employee] WHERE [EmployeeID] = ?";

        PreparedStatement stm_delete = null;

        try {
            stm_delete = connection.prepareStatement(sql_delete);
            stm_delete.setInt(1, entity.getEmployeeID());
            stm_delete.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

@Override
public ArrayList<Employee> list() {
    ArrayList<Employee> emps = new ArrayList<>();
    PreparedStatement command = null;
    try {
        String sql = "SELECT e.[EmployeeID], e.[EmployeeName], e.gender, r.[RoleName],e.dob, d.[DepartmentName] "
                + "FROM [Employee] e "
                + "INNER JOIN [Role] r ON e.[RoleID] = r.[RoleID] "
                + "INNER JOIN [department] d ON e.[DepartmentID] = d.[DepartmentID]";

        command = connection.prepareStatement(sql);
        ResultSet rs = command.executeQuery();
        while (rs.next()) {
            Employee e = new Employee();
            e.setEmployeeID(rs.getInt("EmployeeID"));
            e.setEmployeeName(rs.getString("EmployeeName"));
            e.setGender(rs.getBoolean("Gender"));
            e.setDob(rs.getDate("Dob"));
            Role r =new Role();
            Department d =new Department();
            d.setName(rs.getString("DepartmentName"));
            e.setDept(d);
            r.setName(rs.getString("RoleName")); // Gán roleName
           //e.setDepartment(rs.getString("DepartmentName")); // Gán departmentName
            e.setRoles(r);
            emps.add(e);
        }

    } catch (SQLException ex) {
        Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            if (command != null) {
                command.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return emps;
}

    @Override
    public Employee get(int id) {
        PreparedStatement command = null;
    try {
        String sql = "SELECT e.EmployeeID, e.EmployeeName, e.EmployeeSalaryLevel, e.RoleID, e.DepartmentID, e.CreateBy\n"
                   + "FROM Employee e\n"
                   + "WHERE e.EmployeeID = ?";

        command = connection.prepareStatement(sql);
        command.setInt(1, id);
        ResultSet rs = command.executeQuery();
        if (rs.next()) {
            Employee e = new Employee();
            e.setEmployeeID(rs.getInt("EmployeeID"));
            e.setEmployeeName(rs.getNString("EmployeeName"));
            e.setEmployeeSalaryLevel(rs.getNString("EmployeeSalaryLevel"));
           
           

            return e;
        }

    } catch (SQLException ex) {
        Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            if (command != null) {
                command.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return null;
    }

  
}

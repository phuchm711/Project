/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.accesscontrol;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Employee {
    // Thuộc tính
    private int employeeID;
    private String employeeName;
    private String employeeSalaryLevel;
    private int roleID;
    private int departmentID;
    private String createBy;
    private Role roles;
    private ArrayList<UserEmployee> uemps = new ArrayList<>();

    public Role getRoles() {
        return roles;
    }

    public void setRoles(Role roles) {
        this.roles = roles;
    }
    
    public ArrayList<UserEmployee> getUemps() {
        return uemps;
    }

    public void setUemps(ArrayList<UserEmployee> uemps) {
        this.uemps = uemps;
    }

    
    // Constructor không tham số
    public Employee() {
    }

    // Constructor với tham số
    public Employee(int employeeID, String employeeName, String employeeSalaryLevel, int roleID, int departmentID, String createBy) {
        this.employeeID = employeeID;
        this.employeeName = employeeName;
        this.employeeSalaryLevel = employeeSalaryLevel;
        this.roleID = roleID;
        this.departmentID = departmentID;
        this.createBy = createBy;
    }

    // Getter và Setter cho employeeID
    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    // Getter và Setter cho employeeName
    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    // Getter và Setter cho employeeSalaryLevel
    public String getEmployeeSalaryLevel() {
        return employeeSalaryLevel;
    }

    public void setEmployeeSalaryLevel(String employeeSalaryLevel) {
        this.employeeSalaryLevel = employeeSalaryLevel;
    }

    // Getter và Setter cho roleID
    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    // Getter và Setter cho departmentID
    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    // Getter và Setter cho createBy
    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    // Override phương thức toString để in thông tin Employee
    @Override
    public String toString() {
        return "Employee{" +
                "employeeID=" + employeeID +
                ", employeeName='" + employeeName + '\'' +
                ", employeeSalaryLevel='" + employeeSalaryLevel + '\'' +
                ", roleID=" + roleID +
                ", departmentID=" + departmentID +
                ", createBy='" + createBy + '\'' +
                '}';
    }
}

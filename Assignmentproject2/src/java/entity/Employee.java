/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class Employee {
    private Department dept;
  private int employeeID;
    private String employeeName;
    private String employeeSalaryLevel;
   private Date dob;
   private Boolean gender;
    //private String department ;
    private String createBy;
    private Role roles;
    private ArrayList<UserEmployee> uemps = new ArrayList<>();

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeSalaryLevel() {
        return employeeSalaryLevel;
    }

    public void setEmployeeSalaryLevel(String employeeSalaryLevel) {
        this.employeeSalaryLevel = employeeSalaryLevel;
    }

    

    

    
    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

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

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

}
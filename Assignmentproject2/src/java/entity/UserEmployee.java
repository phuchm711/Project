/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class UserEmployee {
     private User username;
    private Employee emps;
    private boolean is_active;

    public UserEmployee() {
    }

    public UserEmployee(User username, Employee emps, boolean is_active) {
        this.username = username;
        this.emps = emps;
        this.is_active = is_active;
    }

    public User getUsername() {
        return username;
    }

    public void setUsername(User username) {
        this.username = username;
    }

    public Employee getEmps() {
        return emps;
    }

    public void setEmps(Employee emps) {
        this.emps = emps;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }
    
}

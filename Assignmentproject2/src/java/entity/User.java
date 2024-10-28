/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class User {
    private String UserName ;
    private String Pass;
    private ArrayList<UserEmployee> uemps = new ArrayList<>();
   
    private ArrayList<Role> roles = new ArrayList<>();

    public ArrayList<UserEmployee> getUemps() {
        return uemps;
    }

    public void setUemps(ArrayList<UserEmployee> uemps) {
        this.uemps = uemps;
    }

    public ArrayList<Role> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
    }

    public User() {
    }

    public User(String UserName, String Pass) {
        this.UserName = UserName;
        this.Pass = Pass;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }
    
    
}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.accesscontrol;

import java.util.ArrayList;

/**
 *
 * @author sonnt-local
 */
public class User {
    private String username;
    private String pass;
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
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

  
    
}

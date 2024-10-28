/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Feature;
import entity.Role;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class UserDBContext extends DBContext<User> {
   

    public ArrayList<Role> getRoles(String username) {
        String sql = "SELECT r.RoleID,r.RoleName,f.FeatureID,f.FeatureName, f.url FROM [User] u \n"
                + "           INNER JOIN UserRole ur ON ur.username = u.username\n"
                + "              INNER JOIN [Role] r ON r.RoleID = ur.RoleID\n"
                + "               INNER JOIN RoleFeature rf ON r.RoleID = rf.RoleID\n"
                + "              INNER JOIN Feature f ON f.FeatureID = rf.FeatureID\n"
                + "                WHERE u.username = ?\n";

        PreparedStatement stm = null;
        ArrayList<Role> roles = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            Role c_role = new Role();
            c_role.setId(-1);
            while (rs.next()) {
                int rid = rs.getInt("RoleId");
                if (rid != c_role.getId()) {
                    c_role = new Role();
                    c_role.setId(rid);
                    c_role.setName(rs.getString("RoleName"));
                    roles.add(c_role);
                }

                Feature f = new Feature();
                f.setId(rs.getInt("FeatureID"));
                f.setName(rs.getString("FeatureName"));
                f.setUrl(rs.getString("url"));
                c_role.getFeatures().add(f);
                f.setRoles(roles);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return roles;
    }

    public User get(String username, String pass) {
        String sql = "SELECT username FROM [User] \n"
                + "WHERE username = ? AND [pass] = ?";
        PreparedStatement stm = null;
        User user = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setUserName(username);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }
    
    @Override
    public void insert(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public void update(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public void delete(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}

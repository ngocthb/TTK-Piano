/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ngocthb.model.Course;
import ngocthb.model.UserDTO;
import ngocthb.utils.DBUtils;

/**
 *
 * @author Lenovo
 */
public class UserDAO {

    private static final String LOGIN = "SELECT * FROM Users WHERE username=? AND password=?";
    private static final String UPDATE = "UPDATE [Users] SET firstname=?, lastname=?, email=?,  address=?, phone=?, avatar=? WHERE username=?";
    private static final String CREATE = "INSERT INTO [Users]  VALUES(?, ?, ?, ?,?, ?,?, ?, 0)";
    private static final String GETID = "SELECT max(id) 'idmax' FROM [Users]";
    private static final String CHECKUSERNAME = "SELECT id FROM [Users] WHERE username = ?";

//    public static final String DELETE = "DELETE [registration] WHERE userID=?";
//    public static final String CHECKID = "SELECT userName FROM [registration] WHERE userID = ?";
//    public static final String CREATE = "INSERT INTO [registration](userID, userName, password, isAdmin) VALUES(?,?,?,?)";
//    
    public UserDTO checkLogin(String username, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(LOGIN);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String email = rs.getString("email");
                    String avatar = rs.getString("avatar");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    boolean role = rs.getBoolean("isadmin");
                    user = new UserDTO(id, firstname, lastname, email, avatar, username, password, address, phone, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean updateUser(UserDTO userDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, userDTO.getFirstName());
                ptm.setString(2, userDTO.getLastName());
                ptm.setString(3, userDTO.getEmail());
                ptm.setString(4, userDTO.getAddress());
                ptm.setString(5, userDTO.getPhone());
                ptm.setString(6, userDTO.getAvatar());
                ptm.setString(7, userDTO.getUserName());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean createUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, user.getFirstName());
                ptm.setString(2, user.getLastName());
                ptm.setString(3, user.getEmail());
                ptm.setString(4, user.getAvatar());
                ptm.setString(5, user.getUserName());
                ptm.setString(6, user.getPassword());
                ptm.setString(7, user.getAddress());
                ptm.setString(8, user.getPhone());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String username) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHECKUSERNAME);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getMaxID() throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int id = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GETID);
                rs = stm.executeQuery();  // Execute the query
                if (rs.next()) {
                    id = rs.getInt("idmax") + 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return id;
    }

//    public boolean deleteUser(String userID) throws SQLException{
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if(conn!= null){
//                ptm= conn.prepareStatement(DELETE);
//                ptm.setString(1, userID);
//                check= ptm.executeUpdate()>0?true: false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }finally{
//            if(ptm!= null) ptm.close();
//            if(conn!=null) conn.close();
//        }  
//        return check;
//    }
//    public boolean updateUser(UserDTO user) throws SQLException{
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if(conn!= null){
//                ptm= conn.prepareStatement(UPDATE);
//                ptm.setString(1, user.getUserName());
//                ptm.setString(2, user.getPassword());
//                ptm.setBoolean(3, user.getAdmin());
//                ptm.setString(4, user.getUserID());
//                check= ptm.executeUpdate()>0?true: false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }finally{
//            if(ptm!= null) ptm.close();
//            if(conn!=null) conn.close();
//        }  
//        return check;
//    }
// 
// co trung tra ve true ko trung tra vef false    
//    public boolean checkDuplicate(String userID) throws SQLException{
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {         
//            conn = DBUtils.getConnection();
//            if(conn!=null){              
//                stm = conn.prepareStatement(CHECKID);
//                stm.setString(1, userID);
//                rs= stm.executeQuery();
//                if(rs.next()){                    
//                    check = true;                 
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        e.printStackTrace();
//        }finally{
//            if(rs!=null) rs.close();
//            if(stm!= null) stm.close();
//            if(conn!=null) conn.close();
//        }
//        return check;        
//    }
//    
//    public boolean createUser(UserDTO user) throws SQLException{
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if(conn!= null){
//                ptm= conn.prepareStatement(CREATE);
//                ptm.setString(1, user.getUserID());
//                ptm.setString(2, user.getUserName());
//                ptm.setString(3, user.getPassword());
//                ptm.setBoolean(4, user.getAdmin());  
//                check= ptm.executeUpdate()>0?true: false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }finally{
//            if(ptm!= null) ptm.close();
//            if(conn!=null) conn.close();
//        }  
//        return check;
//    }
}

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ngocthb.model.Course;
import ngocthb.model.Order;
import ngocthb.utils.DBUtils;

/**
 *
 * @author Lenovo
 */
public class CourseDAO {

    private static final String GET_CRS_ID = "SELECT * FROM [Course] WHERE id = ?";
    private static final String TOP = "SELECT TOP (20) * FROM [Course] WHERE [status] =1 AND quantity > 0 ORDER BY startdate DESC";
    private static final String SEARCH_BY_CATA = "SELECT co.*, ca.name FROM [Course] co, [Categories] ca WHERE co.categoryid = ca.id AND ca.name like ? AND co.coursename like ?";
    private static final String UPDATE_CRS = "UPDATE [Course] SET coursename=?, categoryid=?, description=?, images=?, startdate=?, enddate=?, price=?, status=?,quantity=?  WHERE id=?";
    private static final String CREATE_CRS = "INSERT INTO [Course] VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GETID = "SELECT max(id) 'idmax' FROM [Course]";
    private static final String FULL_CRS = "SELECT * FROM [Course] WHERE [status] =1 AND quantity > 0 ORDER BY startdate DESC";
    private static final String FULL_CRS_AD = "SELECT * FROM [Course] ORDER BY startdate DESC";

    public Course getCourseByID(int id) throws SQLException {
        Course crs = new Course();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CRS_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String coursename = rs.getString("coursename");
                    int categoryid = rs.getInt("categoryid");
                    String description = rs.getString("description");
                    String images = rs.getString("images");
                    Date startdate = rs.getDate("startdate");
                    Date enddate = rs.getDate("enddate");
                    double price = rs.getDouble("price");
                    Boolean status = rs.getBoolean("status");
                    int quantity = rs.getInt("quantity");
                    crs = new Course(id, coursename, categoryid, description, images, startdate, enddate, price, status, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return crs;
    }

    public List<Course> getTopCourse() throws SQLException {
        List<Course> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(TOP);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String coursename = rs.getString("coursename");
                    int categoryid = rs.getInt("categoryid");
                    String description = rs.getString("description");
                    String images = rs.getString("images");
                    Date startdate = rs.getDate("startdate");
                    Date enddate = rs.getDate("enddate");
                    double price = rs.getDouble("price");
                    Boolean status = rs.getBoolean("status");
                    int quantity = rs.getInt("quantity");
                    list.add(new Course(id, coursename, categoryid, description, images, startdate, enddate, price, status, quantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

     public List<Course> getFullCourse() throws SQLException {
        List<Course> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FULL_CRS);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String coursename = rs.getString("coursename");
                    int categoryid = rs.getInt("categoryid");
                    String description = rs.getString("description");
                    String images = rs.getString("images");
                    Date startdate = rs.getDate("startdate");
                    Date enddate = rs.getDate("enddate");
                    double price = rs.getDouble("price");
                    Boolean status = rs.getBoolean("status");
                    int quantity = rs.getInt("quantity");
                    list.add(new Course(id, coursename, categoryid, description, images, startdate, enddate, price, status, quantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public List<Course> searchBycata(String cata, String crs) throws SQLException {
//        HashMap<String, Course> hm = new HashMap<>();
        List<Course> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BY_CATA);
                ptm.setString(1, "%" + cata + "%");
                ptm.setString(2, "%" + crs + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String cataname = rs.getString("name");
                    int id = rs.getInt("id");
                    String coursename = rs.getString("coursename");
                    int categoryid = rs.getInt("categoryid");
                    String description = rs.getString("description");
                    String images = rs.getString("images");
                    Date startdate = rs.getDate("startdate");
                    Date enddate = rs.getDate("enddate");
                    double price = rs.getDouble("price");
                    Boolean status = rs.getBoolean("status");
                    int quantity = rs.getInt("quantity");
                    Course cs = new Course(id, coursename, categoryid, description, images, startdate, enddate, price, status, quantity);
//                    hm.put(cataname, cs);
                    list.add(cs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean updateCrs(Course crs) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_CRS);
                ptm.setString(1, crs.getCoursename());
                ptm.setInt(2, crs.getCategoryid());
                ptm.setString(3, crs.getDescription());
                ptm.setString(4, crs.getImages());
                ptm.setDate(5, crs.getStartdate());
                ptm.setDate(6, crs.getEnddate());
                ptm.setDouble(7, crs.getPrice());
                ptm.setBoolean(8, crs.isStatus());
                ptm.setInt(9, crs.getQuantity());
                ptm.setInt(10, crs.getId());
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

    public boolean createCrs(Course crs) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_CRS);
                ptm.setString(1, crs.getCoursename());
                ptm.setInt(2, crs.getCategoryid());
                ptm.setString(3, crs.getDescription());
                ptm.setString(4, crs.getImages());
                ptm.setDate(5, crs.getStartdate());
                ptm.setDate(6, crs.getEnddate());
                ptm.setDouble(7, crs.getPrice());
                ptm.setBoolean(8, crs.isStatus());
                ptm.setInt(9, crs.getQuantity());
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

     public List<Course> getFullCourseAd() throws SQLException {
        List<Course> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FULL_CRS_AD);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String coursename = rs.getString("coursename");
                    int categoryid = rs.getInt("categoryid");
                    String description = rs.getString("description");
                    String images = rs.getString("images");
                    Date startdate = rs.getDate("startdate");
                    Date enddate = rs.getDate("enddate");
                    double price = rs.getDouble("price");
                    Boolean status = rs.getBoolean("status");
                    int quantity = rs.getInt("quantity");
                    list.add(new Course(id, coursename, categoryid, description, images, startdate, enddate, price, status, quantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
}

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
public class OrderDAO {

    private static final String CREATE_ORD = "INSERT INTO [Orders] VALUES(?,?,?,?,?,?,?,?,?,?)";
    private static final String GETID = "SELECT max(id) 'idmax' FROM [Orders]";
    private static final String CREATE_ORD_ITEM = "INSERT INTO [OrderItem] VALUES(?,?,?)";
    private static final String GET_ORD = "SELECT ord.*, ordi.quantity 'ord_quantity', crs.id 'crs_id', "
            + "crs.coursename,crs.categoryid, crs.description, \n"
            + "crs.description, crs.images, crs.startdate, crs.enddate, crs.price, crs.status\n"
            + "FROM [Orders] ord, [OrderItem] ordi, [Course] crs\n"
            + "WHERE ord.id = ordi.order_id AND crs.id = ordi.course_id AND ord.id =? AND ord.username like ? ";

    public boolean createOrd(Order ord) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORD);
                ptm.setDate(1, ord.getOrderdate());
                ptm.setDouble(2, ord.getTotalprice());
                ptm.setInt(3, ord.getPaymentid());
                ptm.setString(4, ord.getFirstname());
                ptm.setString(5, ord.getLastname());
                ptm.setString(6, ord.getEmail());
                ptm.setString(7, ord.getAddress());
                ptm.setString(8, ord.getPhone());
                ptm.setString(9, ord.getUsername());
                ptm.setBoolean(10, ord.isStatus());
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

    public boolean createOrdItem(int ord_id, int crs_id, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORD_ITEM);
                ptm.setInt(1, quantity);
                ptm.setInt(2, crs_id);
                ptm.setInt(3, ord_id);
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

    public Map<Order, List<Course>> getOrd(int id, String username) throws SQLException {
        Map<Order, List<Course>> map = new HashMap<>();
        List<Course> list = new ArrayList<Course>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ORD);
                ptm.setInt(1, id);
                ptm.setString(2, "%" +username + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Date orderdate = rs.getDate("orderdate");
                    Double totalprice = rs.getDouble("totalprice");
                    int paymentid = rs.getInt("paymentid");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    Boolean status = rs.getBoolean("status");
                    Order ord = new Order(id, orderdate, totalprice, paymentid, firstname, lastname, username, email, address, phone, true);
                    int quantity = rs.getInt("ord_quantity");
                    int crs_id = rs.getInt("crs_id");
                    String coursename = rs.getString("coursename");
                    int categoryid = rs.getInt("categoryid");
                    String description = rs.getString("description");
                    String images = rs.getString("images");
                    Date startdate = rs.getDate("startdate");
                    Date enddate = rs.getDate("enddate");
                    double price = rs.getDouble("price");
                    list.add(new Course(crs_id, coursename, categoryid, description, images, startdate, enddate, price, status, quantity));
                    map.put(ord, list);
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
        return map;
    }
}

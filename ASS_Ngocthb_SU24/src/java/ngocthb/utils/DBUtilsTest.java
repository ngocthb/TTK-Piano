/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.utils;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class DBUtilsTest {
    public static void main(String[] args) {
        // Test case
        testGetConnection();
    }
    
    // Test case: Kiểm tra phương thức getConnection
    public static void testGetConnection() {
        try {
            Connection conn = DBUtils.getConnection();
            if (conn != null) {
                System.out.println("Test case: Kiểm tra phương thức getConnection - PASSED");
                conn.close(); // Đóng kết nối sau khi kiểm tra thành công
            } else {
                System.out.println("Test case: Kiểm tra phương thức getConnection - FAILED");
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Exception occurred: " + e.getMessage());
        }
    }
}

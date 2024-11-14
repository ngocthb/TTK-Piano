/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.dao;

/**
 *
 * @author Lenovo
 */
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ngocthb.model.Course;
import ngocthb.model.Order;
import ngocthb.model.UserDTO;

public class Main {
    public static void main(String[] args) throws SQLException {
//        Course courseDAO = new Course();
//        CourseDAO dao = new CourseDAO();
//        try {
//            List<Course> courses = dao.getListCourse("a");
//            System.out.println("1");
//            for (Course course : courses) {
//                
//                System.out.println("ID: " + course.getId());
//                System.out.println("Course Name: " + course.getCoursename());
//                System.out.println("Category ID: " + course.getCategoryid());
//                System.out.println("Description: " + course.getDescription());
//                System.out.println("Images: " + course.getImages());
//                System.out.println("Start Date: " + course.getStartdate());
//                System.out.println("End Date: " + course.getEnddate());
//                System.out.println("Price: " + course.getPrice());
//                System.out.println("Status: " + course.isStatus());
//                System.out.println("------------------------------");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
// UserDAO userDAO = new UserDAO();
//
//        UserDTO u = new UserDTO(1,"aaaa", "aaaaa", "john.doe@example.com", "avatar.png", "admin", "123", "123 Main St", "1234567", true);
//        try {
//            boolean result = userDAO.updateUser(u);
//            if (result) {
//                System.out.println("User updated successfully.");
//            } else {
//                System.out.println("Failed to update user.");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

//UserDAO userDAO = new UserDAO();
//         UserDTO u = new UserDTO(userDAO.getMaxID(),"John", "Doe", "john.doe@example.com", "View/Img/avt-us.jpg", "adminnn1", "123", null, null, true);
//
//        try {
//            boolean result = userDAO.createUser(u);
//            if (result) {
//                System.out.println("User created successfully.");
//            } else {
//                System.out.println("Failed to create user.");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }

//CourseDAO dao = new CourseDAO();
//List<HashMap<String, Course>> cs = dao.searchBycata("D","a");
//for(HashMap<String, Course> c: cs){
//    System.out.println(c);
//}
//CourseDAO courseDAO = new CourseDAO();
//        // Assuming the startdate and enddate are in the correct format
//        Date startDate = Date.valueOf("2024-01-01");
//        Date endDate = Date.valueOf("2024-06-01");
//        Course course = new Course(1, "Advanced Java", 2, "Advanced Java Programming", "java.png", startDate, endDate, 499.99, true, 30);
//
//        try {
//            boolean result = courseDAO.updateCrs(course);
//            if (result) {
//                System.out.println("Course updated successfully.");
//            } else {
//                System.out.println("Failed to update course.");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//

//CourseDAO courseDAO = new CourseDAO();
        // Assuming the startdate and enddate are in the correct format
//        CourseDAO dao = new CourseDAO();
////        System.out.println(dao.getMaxID());
//        Date startDate = Date.valueOf("2024-01-01");
//        Date endDate = Date.valueOf("2024-06-01");
//        Course course = new Course(dao.getMaxID(), "Advanced Java", 2, "Advanced Java Programming", "java.png", startDate, endDate, 499.99, true, 30);

//        try {
//            boolean result = dao.createCrs(course);
//            if (result) {
//                System.out.println("Course created successfully.");
//            } else {
//                System.out.println("Failed to create course.");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
// OrderDAO orderDAO = new OrderDAO(); // Replace with your DAO class
//        // Create an Order object with sample data
//        Date orderDate = new Date(System.currentTimeMillis()); // Use current date/time
//        double totalPrice = 99.99;
//        int paymentId = 1;
//        String firstName = "John";
//        String lastName = "Doe";
//        String email = "john.doe@example.com";
//        String address = "123 Main St, Anytown";
//        String phone = "123-456-7890";
//        boolean status = true;
//
//        Order order = new Order(1,orderDate, totalPrice, paymentId, firstName, lastName, email, address, phone, status);
//
//        try {
//            boolean result = orderDAO.createOrd(order);
//            if (result) {
//                System.out.println("Order created successfully.");
//            } else {
//                System.out.println("Failed to create order.");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
// OrderDAO orderDAO = new OrderDAO(); // Replace with your DAO class
//        int orderId = 4; // Sample order ID to fetch
//
//        try {
//            Map<Order, List<Course>> orderMap = orderDAO.getOrd(orderId,"a");
//            for (Map.Entry<Order, List<Course>> entry : orderMap.entrySet()) {
//                Order order = entry.getKey();
//                List<Course> courses = entry.getValue();
//                System.out.println("Order Details:");
//                System.out.println("ID: " + order.getId());
//                System.out.println("Order Date: " + order.getOrderdate());
//                System.out.println("Total Price: " + order.getTotalprice());
//                System.out.println("Payment ID: " + order.getPaymentid());
//                System.out.println("First Name: " + order.getFirstname());
//                System.out.println("Last Name: " + order.getLastname());
//                System.out.println("Email: " + order.getEmail());
//                System.out.println("Address: " + order.getAddress());
//                System.out.println("Phone: " + order.getPhone());
//                System.out.println("Status: " + order.isStatus());
//
//                System.out.println("Courses:");
//                for (Course course : courses) {
//                    System.out.println("  Course ID: " + course.getId());
//                    System.out.println("  Course Name: " + course.getCoursename());
//                    System.out.println("  Category ID: " + course.getCategoryid());
//                    System.out.println("  Description: " + course.getDescription());
//                    System.out.println("  Images: " + course.getImages());
//                    System.out.println("  Start Date: " + course.getStartdate());
//                    System.out.println("  End Date: " + course.getEnddate());
//                    System.out.println("  Price: " + course.getPrice());
//                    System.out.println("  Quantity: " + course.getQuantity());
//                    System.out.println("--------------");
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

// OrderDAO dao = new OrderDAO();
//    Order order = new Order();
//    
//    // Set order properties
//    order.setOrderdate(java.sql.Date.valueOf("2024-06-29"));
//    order.setTotalprice(100.50);
//    order.setPaymentid(1);
//    order.setFirstname("John");
//    order.setLastname("Doe");
//    order.setEmail("john.doe@example.com");
//    order.setAddress("123 Example St");
//    order.setPhone("1234567890");
//    order.setUsername("jonh");
//    order.setStatus(true);
//    
//    try {
//        boolean result = dao.createOrd(order);
//        System.out.println("Order creation result: " + result);
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }

//

 OrderDAO dao = new OrderDAO();
        try {
            // Replace these values with appropriate test values
            int testOrderId = 3;
            String testUsername = "";

            // Call the getOrd method
            Map<Order, List<Course>> orders = dao.getOrd(testOrderId, testUsername);

            // Print the results
            for (Map.Entry<Order, List<Course>> entry : orders.entrySet()) {
                Order order = entry.getKey();
                List<Course> courses = entry.getValue();

                System.out.println("Order Details:");
                System.out.println("Order ID: " + order.getId());
                System.out.println("Order Date: " + order.getOrderdate());
                System.out.println("Total Price: " + order.getTotalprice());
                System.out.println("Payment ID: " + order.getPaymentid());
                System.out.println("First Name: " + order.getFirstname());
                System.out.println("Last Name: " + order.getLastname());
                System.out.println("Email: " + order.getEmail());
                System.out.println("Address: " + order.getAddress());
                System.out.println("Phone: " + order.getPhone());
                System.out.println("Status: " + order.isStatus());
                System.out.println("Courses:");

                for (Course course : courses) {
                    System.out.println("\tCourse ID: " + course.getId());
                    System.out.println("\tCourse Name: " + course.getCoursename());
                    System.out.println("\tCategory ID: " + course.getCategoryid());
                    System.out.println("\tDescription: " + course.getDescription());
                    System.out.println("\tImages: " + course.getImages());
                    System.out.println("\tStart Date: " + course.getStartdate());
                    System.out.println("\tEnd Date: " + course.getEnddate());
                    System.out.println("\tPrice: " + course.getPrice());
                    System.out.println("\tQuantity: " + course.getQuantity());
                    System.out.println("\tStatus: " + course.isStatus());
                    System.out.println();
                }
                System.out.println("-----------------------------------");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    }   



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.main.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "home.jsp";
    private static final String NULL_CONTROLLER = "NullController";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String REMOVE_FROM_CART_CONTROLLER = "RemoveFromCartController";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String CREATE_ORDER_CONTROLLER = "CreateOrderController";
    private static final String SEARCH_ORDER_CONTROLLER = "SearchOrderController";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    
    private static final String AD_UPDATE_COURSE_CONTROLLER = "AdUpdateCrsController";
    private static final String AD_CREATE_COURSE_CONTROLLER = "AdCreateCrsController";
    private static final String AD_SEARCH_CONTROLLER = "AdSearchController";
    
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";

    private static final String CREATE = "Create";

    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";
    private static final String VIEW = "View";
    private static final String VIEW_CONTROLLER = "ViewController";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            String adaction = request.getParameter("adaction");
            if (action == null) {
                url = NULL_CONTROLLER;
            } else if (action.equals("Login")) {
                url = LOGIN_CONTROLLER;
            } else if (action.equals("Search")) {
                url = SEARCH_CONTROLLER;
            } else if (action.equals("Edit Profile")) {
                url = UPDATE_CONTROLLER;
            } else if (action.equals("Create")) {
                url = CREATE_CONTROLLER;
            } else if (action.equals("Add to cart")){
                url = ADD_TO_CART_CONTROLLER;
            } else if (action.equals("Remove from cart")){
                url = REMOVE_FROM_CART_CONTROLLER;
            } else if (action.equals("Update cart")){
                url = UPDATE_CART_CONTROLLER;
            } else if (action.equals("Order")){
                url = CREATE_ORDER_CONTROLLER;
            } else if (action.equals("Search Order")){
                url = SEARCH_ORDER_CONTROLLER;
            }else if (action.equals("Log out")){
                url = LOGOUT_CONTROLLER;
            }


//            } else if (DELETE.equals(action)) {
//                url = DELETE_CONTROLLER;
//            } else if (ADD.equals(action)) {
//                url = ADD_CONTROLLER;
//            } else if (VIEW.equals(action)) {
//                url = VIEW_CONTROLLER;
//            } else if (REMOVE.equals(action)) {
//                url = REMOVE_CONTROLLER;
//            }
            if (adaction.equals("Course Update")) {
                url = AD_UPDATE_COURSE_CONTROLLER;
            }else if (adaction.equals("Create course")){
                url = AD_CREATE_COURSE_CONTROLLER;
            }else if (adaction.equals("Search")){
                url = AD_SEARCH_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

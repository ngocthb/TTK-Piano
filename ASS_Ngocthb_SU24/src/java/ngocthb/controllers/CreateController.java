/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ngocthb.model.UserDTO;
import ngocthb.model.UserError;
import ngocthb.dao.UserDAO;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static String ERROR = "create.jsp";
    private static String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String avatar = "View/Img/avt-us.jpg";
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            UserError userError = new UserError();
            boolean check = true;
            UserDAO dao = new UserDAO();
            int id = dao.getMaxID();
            boolean checkDuplicate = dao.checkDuplicate(username);
            if (checkDuplicate) {
                userError.setUsername("Username is exist");
                check = false;
            } else if (username.length() < 5 || username.length() > 15) {
                userError.setUsername("Username length >5 and <15");
                check = false;
            }
            if(password.length()< 6  || password.length() >15){
                userError.setPassword("Password length >6 and <15");
                check = false;
            }else if (!confirm.equals(password)) {
                userError.setConfirm("Password not valid");
                check = false;
            }
            if (check) {
                UserDTO user = new UserDTO(id, firstname, lastname, email, avatar, username, password, address, phone, false);
                boolean checkCreate = dao.createUser(user);
                if (checkCreate) {
                    url = SUCCESS;

                }
            } else {

                userError.setErrorMess("Error");
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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

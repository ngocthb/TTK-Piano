/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.controllers.ad;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ngocthb.dao.CourseDAO;
import ngocthb.dao.UserDAO;
import ngocthb.model.Course;
import ngocthb.model.UserDTO;

/**
 *
 * @author Lenovo
 */
public class AdUpdateCrsController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "home_ad.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {   
            int id = Integer.parseInt(request.getParameter("id"));
              String coursename = request.getParameter("coursename");
            int categoryid = Integer.parseInt(request.getParameter("categoryid"));
            String description = request.getParameter("description");
            String images = request.getParameter("images");
            Date startdate= Date.valueOf(request.getParameter("startdate"));
            Date enddate=Date.valueOf(request.getParameter("enddate"));
            Double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            boolean st = false;
            if(status==null) st = true;
            CourseDAO dao = new CourseDAO();
            Course crs = new Course(id, coursename, categoryid, description, images, startdate, enddate, price, st, quantity);
            boolean check= dao.updateCrs(crs);
            if(check){
                url = SUCCESS;
                request.setAttribute("MESSAGE", "Update thanh cong");
            }
            else{
                request.setAttribute("MESSAGE", "Update that bai");
            }
        } catch (Exception e) {
            log("Error at UpdateController: "+e.toString());
        }finally{
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

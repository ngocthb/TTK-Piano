package ngocthb.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ngocthb.model.UserDTO;
import ngocthb.dao.UserDAO;

@WebServlet(name = "NullController", urlPatterns = {"/NullController"})
public class NullController extends HttpServlet {

    private static final String HOMEPAGE = "home.jsp";
    private static final String LOGINPAGE = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOMEPAGE;
        try {
            UserDAO dao = new UserDAO();
            Cookie[] cookies = request.getCookies();
            String username = null;
            String password = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("userC")) {
                        username = cookie.getValue();
                    }
                    if (cookie.getName().equals("passC")) {
                        password = cookie.getValue();
                    }
                }

            }
            UserDTO user = dao.checkLogin(username, password);
            HttpSession session = request.getSession();
            session.setAttribute("LOGIN_USER", user);
            if (user != null) {
                url = LOGINPAGE;
            }
        } catch (Exception e) {
            log("Error at NullController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            log("SQL Error at NullController: " + ex.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            log("SQL Error at NullController: " + ex.toString());
        }
    }

    @Override
    public String getServletInfo() {
        return "NullController handles user authentication based on cookies.";
    }
}

package com.vehicle.parts.servlet.member1;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vehicle.parts.dao.UserDAO;
import com.vehicle.parts.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            UserDAO dao = new UserDAO();
            User user = dao.loginUser(username, password);

            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUsername()); 

                if ("admin".equalsIgnoreCase(user.getRole())) {
                    res.sendRedirect("viewUsers");
                } else {
                    res.sendRedirect("customer_homepage.jsp");
                }
            } else {
                res.getWriter().println("Invalid username or password");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}

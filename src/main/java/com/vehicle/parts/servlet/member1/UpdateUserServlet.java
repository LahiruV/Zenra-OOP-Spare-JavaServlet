package com.vehicle.parts.servlet.member1;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vehicle.parts.dao.UserDAO;
import com.vehicle.parts.model.User;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String role = req.getParameter("role");

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setRole(role);

        try {
            UserDAO dao = new UserDAO();
            if (dao.updateUser(user)) {
                res.sendRedirect("user_dashboard.jsp");
            } else {
                res.getWriter().println("Update failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}

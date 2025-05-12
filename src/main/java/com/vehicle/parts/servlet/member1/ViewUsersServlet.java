package com.vehicle.parts.servlet.member1;

import com.vehicle.parts.dao.UserDAO;
import com.vehicle.parts.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewUsers")
public class ViewUsersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            UserDAO dao = new UserDAO();
            List<User> users = dao.getAllUsers();
            req.setAttribute("users", users);
            req.getRequestDispatcher("user_dashboard.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Failed to load users: " + e.getMessage());
        }
    }
}

package com.vehicle.parts.servlet.member1;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vehicle.parts.dao.UserDAO;
import com.vehicle.parts.model.User;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        delete(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        delete(req, res);
    }

    private void delete(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String username = req.getParameter("username");

        try {
            UserDAO dao = new UserDAO();
            if (dao.deleteUser(username)) {
                res.sendRedirect("viewUsers"); // forward back to dashboard
            } else {
                res.getWriter().println("Delete failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}


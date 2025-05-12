package com.vehicle.parts.servlet.member4;

import com.vehicle.parts.dao.OrderDAO;
import com.vehicle.parts.model.Order;
import com.vehicle.parts.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewOrders")
public class ViewOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession(false);
            User user = (User) session.getAttribute("user");

            if (user == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            OrderDAO dao = new OrderDAO();
            List<Order> orders;

            // If admin, show all orders
            if ("admin".equalsIgnoreCase(user.getRole())) {
                orders = dao.getAllOrders();
            } else {
                // Otherwise, show only user's orders
                orders = dao.getOrdersByCustomerName(user.getUsername());
            }

            req.setAttribute("orders", orders);
            req.getRequestDispatcher("myOrders.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error loading orders: " + e.getMessage());
        }
    }
}

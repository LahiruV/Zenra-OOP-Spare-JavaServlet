package com.vehicle.parts.servlet.member4;

import com.vehicle.parts.dao.OrderDAO;
import com.vehicle.parts.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewAllOrders") 
public class ViewAllOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            List<Order> orders = new OrderDAO().getAllOrders();
            req.setAttribute("orders", orders);
            req.getRequestDispatcher("viewOrders.jsp").forward(req, res); // Ensure this JSP exists
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error loading orders: " + e.getMessage());
        }
    }
}

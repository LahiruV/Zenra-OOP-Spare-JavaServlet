package com.vehicle.parts.servlet.member4;

import com.vehicle.parts.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateOrder")
public class UpdateOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(req.getParameter("id"));
            String newAddress = req.getParameter("address");

            OrderDAO dao = new OrderDAO();
            boolean success = dao.updateOrderAddress(orderId, newAddress);

            if (success) {
                res.sendRedirect("viewAllOrders");
            } else {
                req.setAttribute("error", "Failed to update order.");
                req.getRequestDispatcher("edit_order.jsp?id=" + orderId).forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error updating order: " + e.getMessage());
        }
    }
}

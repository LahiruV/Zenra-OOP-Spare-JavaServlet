package com.vehicle.parts.servlet.member4;

import com.vehicle.parts.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteOrder")
public class DeleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(req.getParameter("id"));
            OrderDAO dao = new OrderDAO();
            dao.deleteOrder(orderId);
            res.sendRedirect("viewAllOrders");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Failed to delete order.");
        }
    }
}

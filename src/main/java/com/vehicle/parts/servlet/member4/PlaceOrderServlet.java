package com.vehicle.parts.servlet.member4;

import com.vehicle.parts.dao.OrderDAO;
import com.vehicle.parts.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String partIdStr = req.getParameter("part_id");
            String quantityStr = req.getParameter("quantity");
            String totalPriceStr = req.getParameter("total_price");
            String customerName = req.getParameter("customer_name");
            String address = req.getParameter("address");

            if (partIdStr == null || quantityStr == null || totalPriceStr == null ||
                customerName == null || address == null || customerName.trim().isEmpty() || address.trim().isEmpty()) {
                req.setAttribute("error", "All fields are required.");
                req.getRequestDispatcher("placeOrder.jsp").forward(req, res);
                return;
            }

            int partId = Integer.parseInt(partIdStr);
            int quantity = Integer.parseInt(quantityStr);
            double totalPrice = Double.parseDouble(totalPriceStr);

            Order order = new Order();
            order.setPartId(partId);
            order.setQuantity(quantity);
            order.setTotalPrice(totalPrice);
            order.setCustomerName(customerName.trim());
            order.setAddress(address.trim());
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));

            OrderDAO dao = new OrderDAO();
            boolean success = dao.addOrder(order);

            if (success) {
                req.getSession().removeAttribute("cart"); 
                res.sendRedirect("viewOrders"); // redirecting to viewOrders servlet
            } else {
                req.setAttribute("error", "Failed to place order.");
                req.getRequestDispatcher("placeOrder.jsp").forward(req, res);
            }
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid numeric input.");
            req.getRequestDispatcher("placeOrder.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error placing order: " + e.getMessage());
        }
    }
}

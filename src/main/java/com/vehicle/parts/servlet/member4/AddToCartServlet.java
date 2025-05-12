package com.vehicle.parts.servlet.member4;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.vehicle.parts.dao.PartDAO;
import com.vehicle.parts.model.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int partId = Integer.parseInt(req.getParameter("part_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        try {
            Part part = new PartDAO().getPartById(partId);

            boolean exists = false;
            for (CartItem item : cart) {
                if (item.getPart().getId() == partId) {
                    item.setQuantity(item.getQuantity() + quantity);
                    exists = true;
                    break;
                }
            }
            if (!exists) {
                cart.add(new CartItem(part, quantity));
            }

            session.setAttribute("cart", cart);
            res.sendRedirect("viewCart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Failed to add to cart.");
        }
    }
}

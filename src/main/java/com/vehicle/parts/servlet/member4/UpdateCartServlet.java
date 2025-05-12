package com.vehicle.parts.servlet.member4;

import com.vehicle.parts.model.CartItem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int partId = Integer.parseInt(req.getParameter("part_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart) {
                if (item.getPart().getId() == partId) {
                    item.setQuantity(quantity);
                    break;
                }
            }
        }

        res.sendRedirect("viewCart.jsp");
    }
}

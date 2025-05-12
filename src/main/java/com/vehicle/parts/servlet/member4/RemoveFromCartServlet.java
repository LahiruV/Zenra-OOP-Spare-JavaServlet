package com.vehicle.parts.servlet.member4;

import com.vehicle.parts.model.CartItem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int partId = Integer.parseInt(req.getParameter("part_id"));

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(item -> item.getPart().getId() == partId);
        }

        res.sendRedirect("viewCart.jsp");
    }
}

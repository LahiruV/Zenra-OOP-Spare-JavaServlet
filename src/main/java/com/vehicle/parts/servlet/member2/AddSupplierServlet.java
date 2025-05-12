package com.vehicle.parts.servlet.member2;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vehicle.parts.dao.SupplierDAO;
import com.vehicle.parts.model.Supplier;

@WebServlet("/addSupplier")
public class AddSupplierServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            Supplier s = new Supplier();
            s.setName(req.getParameter("name"));
            s.setEmail(req.getParameter("email"));
            s.setContactNo(req.getParameter("contact_no"));
            s.setRating(Integer.parseInt(req.getParameter("rating")));
            s.setCategory(req.getParameter("category"));

            new SupplierDAO().addSupplier(s);
            res.sendRedirect("viewSuppliers");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Add failed: " + e.getMessage());
        }
    }
}

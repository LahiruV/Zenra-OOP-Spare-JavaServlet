package com.vehicle.parts.servlet.member2;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vehicle.parts.dao.SupplierDAO;
import com.vehicle.parts.model.Supplier;

@WebServlet("/deleteSupplier")
public class DeleteSupplierServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            new SupplierDAO().deleteSupplier(id);
            res.sendRedirect("viewSuppliers");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

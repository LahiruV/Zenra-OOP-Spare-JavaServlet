package com.vehicle.parts.servlet.member2;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vehicle.parts.dao.SupplierDAO;
import com.vehicle.parts.model.Supplier;

@WebServlet("/viewSuppliers")
public class ViewSuppliersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            List<Supplier> list = new SupplierDAO().getAllSuppliers();
            req.setAttribute("suppliers", list);
            req.getRequestDispatcher("supplier_dashboard.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


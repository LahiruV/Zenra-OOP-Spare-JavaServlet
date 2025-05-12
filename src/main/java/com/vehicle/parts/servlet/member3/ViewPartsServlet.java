package com.vehicle.parts.servlet.member3;

import com.vehicle.parts.dao.PartDAO;
import com.vehicle.parts.model.Part;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewParts")
public class ViewPartsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            PartDAO dao = new PartDAO();
            List<Part> parts = dao.getAllParts();
            req.setAttribute("parts", parts);
            req.getRequestDispatcher("viewParts.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error loading parts: " + e.getMessage());
        }
    }
}

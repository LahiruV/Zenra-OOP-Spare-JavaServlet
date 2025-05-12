package com.vehicle.parts.servlet.member3;

import com.vehicle.parts.dao.PartDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deletePart")
public class DeletePartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            PartDAO dao = new PartDAO();
            if (dao.deletePart(id)) {
                res.sendRedirect("viewParts");
            } else {
                res.getWriter().println("Delete failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}

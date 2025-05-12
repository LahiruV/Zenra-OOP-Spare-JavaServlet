package com.vehicle.parts.servlet.member3;

import com.vehicle.parts.dao.PartDAO;
import com.vehicle.parts.model.Part;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet("/addPart")
@MultipartConfig
public class AddPartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("price"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            int supplierId = Integer.parseInt(req.getParameter("supplier_id"));

            javax.servlet.http.Part filePart = req.getPart("image");
            String base64Image = null;

            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream inputStream = filePart.getInputStream()) {
                    byte[] imageBytes = inputStream.readAllBytes();
                    base64Image = Base64.getEncoder().encodeToString(imageBytes);
                }
            }

            Part part = new Part();
            part.setName(name);
            part.setDescription(description);
            part.setPrice(price);
            part.setQuantity(quantity);
            part.setSupplierId(supplierId);
            part.setImage(base64Image);

            PartDAO dao = new PartDAO();
            if (dao.addPart(part)) {
                res.sendRedirect("viewParts");
            } else {
                res.getWriter().println("Failed to add part.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}

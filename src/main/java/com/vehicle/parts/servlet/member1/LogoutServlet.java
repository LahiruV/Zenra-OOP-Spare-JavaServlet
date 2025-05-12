package com.vehicle.parts.servlet.member1;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession(false); // Don't create if it doesn't exist
        if (session != null) {
            session.invalidate(); // Destroy session
        }
        res.sendRedirect("login.jsp"); // Redirect to login page
    }
}

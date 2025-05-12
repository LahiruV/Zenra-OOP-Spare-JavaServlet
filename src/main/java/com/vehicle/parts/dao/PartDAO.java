package com.vehicle.parts.dao;

import com.vehicle.parts.model.Part;
import java.sql.*;
import java.util.*;

public class PartDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/spareparts";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "root";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Part> getAllParts() throws Exception {
        List<Part> parts = new ArrayList<>();
        String sql = "SELECT p.*, s.name AS supplier_name FROM parts p JOIN suppliers s ON p.supplier_id = s.id";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Part p = new Part();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setSupplierId(rs.getInt("supplier_id"));
                p.setSupplierName(rs.getString("supplier_name"));
                p.setImage(rs.getString("image"));
                parts.add(p);
            }
        }
        return parts;
    }

    public boolean addPart(Part part) throws Exception {
        String sql = "INSERT INTO parts (name, description, price, quantity, supplier_id, image) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, part.getName());
            ps.setString(2, part.getDescription());
            ps.setDouble(3, part.getPrice());
            ps.setInt(4, part.getQuantity());
            ps.setInt(5, part.getSupplierId());
            ps.setString(6, part.getImage());
            return ps.executeUpdate() > 0;
        }
    }

    public Part getPartById(int id) throws Exception {
        String sql = "SELECT * FROM parts WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Part p = new Part();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setSupplierId(rs.getInt("supplier_id"));
                p.setImage(rs.getString("image"));
                return p;
            }
        }
        return null;
    }

    public boolean updatePart(Part part) throws Exception {
        String sql = "UPDATE parts SET name=?, description=?, price=?, quantity=?, supplier_id=?, image=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, part.getName());
            ps.setString(2, part.getDescription());
            ps.setDouble(3, part.getPrice());
            ps.setInt(4, part.getQuantity());
            ps.setInt(5, part.getSupplierId());
            ps.setString(6, part.getImage());
            ps.setInt(7, part.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deletePart(int id) throws Exception {
        String sql = "DELETE FROM parts WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}

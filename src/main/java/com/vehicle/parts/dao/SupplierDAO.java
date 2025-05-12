package com.vehicle.parts.dao;

import com.vehicle.parts.model.Supplier;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/spareparts";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "root";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean addSupplier(Supplier s) throws Exception {
        String sql = "INSERT INTO suppliers (name, email, contact_no, rating, category) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getContactNo());
            ps.setInt(4, s.getRating());
            ps.setString(5, s.getCategory());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateSupplier(Supplier s) throws Exception {
        String sql = "UPDATE suppliers SET name=?, email=?, contact_no=?, rating=?, category=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getContactNo());
            ps.setInt(4, s.getRating());
            ps.setString(5, s.getCategory());
            ps.setInt(6, s.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteSupplier(int id) throws Exception {
        String sql = "DELETE FROM suppliers WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public Supplier getSupplierById(int id) throws Exception {
        String sql = "SELECT * FROM suppliers WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setContactNo(rs.getString("contact_no"));
                s.setRating(rs.getInt("rating"));
                s.setCategory(rs.getString("category"));
                return s;
            }
            return null;
        }
    }

    public List<Supplier> getAllSuppliers() throws Exception {
        List<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM suppliers";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setContactNo(rs.getString("contact_no"));
                s.setRating(rs.getInt("rating"));
                s.setCategory(rs.getString("category"));
                list.add(s);
            }
        }
        return list;
    }
}

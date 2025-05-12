package com.vehicle.parts.dao;

import com.vehicle.parts.model.Order;

import java.sql.*;
import java.util.*;

public class OrderDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/spareparts";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "root";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean addOrder(Order order) throws Exception {
        String sql = "INSERT INTO orders (part_id, customer_name, address, quantity, total_price, order_date) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, order.getPartId());
            ps.setString(2, order.getCustomerName());
            ps.setString(3, order.getAddress());
            ps.setInt(4, order.getQuantity());
            ps.setDouble(5, order.getTotalPrice());
            ps.setTimestamp(6, order.getOrderDate());
            return ps.executeUpdate() > 0;
        }
    }

    public List<Order> getAllOrders() throws Exception {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY order_date DESC";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setPartId(rs.getInt("part_id"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setAddress(rs.getString("address"));
                o.setQuantity(rs.getInt("quantity"));
                o.setTotalPrice(rs.getDouble("total_price"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                orders.add(o);
            }
        }
        return orders;
    }

    public boolean deleteOrder(int id) throws Exception {
        String sql = "DELETE FROM orders WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public Order getOrderById(int id) throws Exception {
        String sql = "SELECT * FROM orders WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setPartId(rs.getInt("part_id"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setAddress(rs.getString("address"));
                o.setQuantity(rs.getInt("quantity"));
                o.setTotalPrice(rs.getDouble("total_price"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                return o;
            }
        }
        return null;
    }
    
    public boolean updateOrder(Order order) throws Exception {
        String sql = "UPDATE orders SET part_id=?, customer_name=?, address=?, quantity=?, total_price=?, order_date=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, order.getPartId());
            ps.setString(2, order.getCustomerName());
            ps.setString(3, order.getAddress());
            ps.setInt(4, order.getQuantity());
            ps.setDouble(5, order.getTotalPrice());
            ps.setTimestamp(6, order.getOrderDate());
            ps.setInt(7, order.getId());
            return ps.executeUpdate() > 0;
        }
    }
    
    public boolean updateOrderAddress(int id, String newAddress) throws Exception {
        String sql = "UPDATE orders SET address=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newAddress);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        }
    }
    
    public List<Order> getOrdersByCustomerName(String customerName) throws Exception {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE customer_name = ? ORDER BY order_date DESC";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, customerName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setPartId(rs.getInt("part_id"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setAddress(rs.getString("address"));
                o.setQuantity(rs.getInt("quantity"));
                o.setTotalPrice(rs.getDouble("total_price"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                orders.add(o);
            }
        }
        return orders;
    }



}

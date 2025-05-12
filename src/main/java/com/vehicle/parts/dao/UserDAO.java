package com.vehicle.parts.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.vehicle.parts.model.User;

public class UserDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/spareparts";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "root";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // CREATE: Register new user
    public boolean registerUser(User user) throws Exception {
        String sql = "INSERT INTO users (username, email, password, phone, role) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getRole());
            return ps.executeUpdate() > 0;
        }
    }

    // READ: Login user
    public User loginUser(String username, String password) throws Exception {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                return u;
            }
            return null;
        }
    }

    // UPDATE: Update existing user
    public boolean updateUser(User user) throws Exception {
        String sql = "UPDATE users SET email=?, password=?, phone=?, role=? WHERE username=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getRole());
            ps.setString(5, user.getUsername());
            return ps.executeUpdate() > 0;
        }
    }

    // DELETE: Delete user by username
    public boolean deleteUser(String username) throws Exception {
        String sql = "DELETE FROM users WHERE username=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            return ps.executeUpdate() > 0;
        }
    }

    // READ ALL: Return list of all registered users
    public List<User> getAllUsers() throws Exception {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setPassword(rs.getString("password")); // Optional: can be excluded for privacy
                u.setRole(rs.getString("role"));
                users.add(u);
            }
        }
        return users;
    }
    
 // READ: Get single user by username
    public User getUserByUsername(String username) throws Exception {
        String sql = "SELECT * FROM users WHERE username=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                return u;
            }
            return null;
        }
    }

}

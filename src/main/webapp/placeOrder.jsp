<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Place Order</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="bg-gray-100 text-gray-800">

<!-- Navbar -->
<header class="bg-white shadow fixed w-full z-50">
    <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
        <h1 class="text-2xl font-bold text-blue-700">Zenra Spare Parts</h1>
        <div class="flex items-center space-x-6">
            <nav class="space-x-6">
                <a href="customer_homepage.jsp" class="hover:text-blue-600 font-medium">Home</a>
                <a href="customerViewParts" class="hover:text-blue-600 font-medium">Spare Parts</a>
                <a href="viewOrders" class="hover:text-blue-600 font-medium">My Orders</a>
            </nav>
            <form action="logout" method="post">
                <button class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded text-sm font-semibold">Logout</button>
            </form>
        </div>
    </div>
</header>

<!-- Spacer -->
<div class="h-24"></div>

<!-- Order Form -->
<main class="flex items-center justify-center min-h-[80vh] px-4">
    <div class="bg-white p-6 rounded shadow w-full max-w-md">
        <h2 class="text-2xl font-bold mb-4 text-center text-blue-700">Confirm Your Order</h2>

        <% if (request.getAttribute("error") != null) { %>
            <p class="text-red-600 text-sm mb-4"><%= request.getAttribute("error") %></p>
        <% } %>

        <form action="placeOrder" method="post" class="space-y-4">
            <input type="hidden" name="part_id" value="<%= request.getParameter("part_id") %>" />
            <input type="hidden" name="total_price" value="<%= request.getParameter("total_price") %>" />
            <input type="hidden" name="quantity" value="<%= request.getParameter("quantity") %>" />

            <% String username = (String) session.getAttribute("username"); %>
            <input type="text" name="customer_name" value="<%= username %>" readonly 
                   class="w-full border px-4 py-2 rounded bg-gray-100 text-gray-700" />

            <input type="text" name="address" placeholder="Delivery Address" required 
                   class="w-full border px-4 py-2 rounded" />

            <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">
                Place Order
            </button>
        </form>
    </div>
</main>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12 mt-[100px]">
    <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-6">
        <div>
            <h3 class="text-xl font-bold mb-3">Zenra Spare Parts</h3>
            <p>Your one-stop shop for genuine auto components.</p>
        </div>
        <div>
            <h4 class="font-semibold mb-2">Quick Links</h4>
            <ul class="space-y-1">
                <li><a href="customerViewParts" class="hover:underline">Spare Parts</a></li>
                <li><a href="viewOrders" class="hover:underline">My Orders</a></li>
                <li><a href="contact.jsp" class="hover:underline">Contact Us</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-semibold mb-2">Support</h4>
            <ul class="space-y-1">
                <li>Email: support@zenraspares.com</li>
                <li>Phone: +94 77 123 4567</li>
            </ul>
        </div>
        <div>
            <h4 class="font-semibold mb-2">Location</h4>
            <p>Colombo, Sri Lanka</p>
        </div>
    </div>
    <div class="text-center text-sm mt-10 text-gray-400">&copy; 2025 Zenra Spare Parts. All rights reserved.</div>
</footer>

</body>
</html>

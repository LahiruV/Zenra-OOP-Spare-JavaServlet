<%@ page import="java.util.*, com.vehicle.parts.model.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Orders - Zenra Spare Parts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="bg-white text-gray-800">

<!-- Navbar -->
<header class="bg-white shadow fixed w-full z-50">
    <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
        <h1 class="text-2xl font-bold text-blue-700">Zenra Spare Parts</h1>
        <div class="flex items-center space-x-6">
            <nav class="space-x-6">
                <a href="customer_homepage.jsp" class="hover:text-blue-600 font-medium">Home</a>
                <a href="customerViewParts" class="hover:text-blue-600 font-medium">Spare Parts</a>
                <a href="viewOrders" class="text-blue-600 font-semibold border-b-2 border-blue-600 pb-1">My Orders</a>
            </nav>
            <form action="logout" method="post">
                <button class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded text-sm font-semibold">Logout</button>
            </form>
        </div>
    </div>
</header>

<!-- Spacer -->
<div class="h-24"></div>

<!-- Orders Table -->
<section class="py-12 bg-gray-50">
    <div class="max-w-6xl mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-10">My Orders</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="py-3 px-4 text-left text-sm text-gray-600">Order ID</th>
                        <th class="py-3 px-4 text-left text-sm text-gray-600">Part ID</th>
                        <th class="py-3 px-4 text-left text-sm text-gray-600">Customer</th>
                        <th class="py-3 px-4 text-left text-sm text-gray-600">Address</th>
                        <th class="py-3 px-4 text-left text-sm text-gray-600">Quantity</th>
                        <th class="py-3 px-4 text-left text-sm text-gray-600">Total (Rs)</th>
                        <th class="py-3 px-4 text-left text-sm text-gray-600">Order Date</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (orders != null && !orders.isEmpty()) {
                        for (Order o : orders) {
                %>
                    <tr class="border-b">
                        <td class="py-2 px-4"><%= o.getId() %></td>
                        <td class="py-2 px-4"><%= o.getPartId() %></td>
                        <td class="py-2 px-4"><%= o.getCustomerName() %></td>
                        <td class="py-2 px-4"><%= o.getAddress() %></td>
                        <td class="py-2 px-4"><%= o.getQuantity() %></td>
                        <td class="py-2 px-4">Rs. <%= o.getTotalPrice() %></td>
                        <td class="py-2 px-4"><%= o.getOrderDate() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="7" class="text-center py-6 text-gray-500">You have no orders.</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12 mt-[150px]">
    <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-6">
        <div>
            <h3 class="text-xl font-bold mb-3">Zenra Spare Parts</h3>
            <p>Your one-stop shop for genuine auto components.</p>
        </div>
        <div>
            <h4 class="font-semibold mb-2">Quick Links</h4>
            <ul class="space-y-1">
                <li><a href="customerViewParts" class="hover:underline">Spare Parts</a></li>
                <li><a href="myOrders.jsp" class="hover:underline">My Orders</a></li>
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

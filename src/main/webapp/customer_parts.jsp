<%@ page import="java.util.*, com.vehicle.parts.model.Part" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Part> parts = (List<Part>) request.getAttribute("parts");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Zenra Spare Parts - Shop</title>
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
                <a href="customerViewParts" class="text-blue-600 font-semibold border-b-2 border-blue-600 pb-1">Spare Parts</a>
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

<!-- Spare Parts List -->
<section class="py-12 bg-gray-50">
    <div class="max-w-7xl mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-10">Explore Our Spare Parts</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <% if (parts != null) {
                for (Part p : parts) { %>
                <div class="bg-white rounded-xl shadow hover:shadow-lg overflow-hidden">
                    <img src="data:image/jpeg;base64,<%= p.getImage() %>" alt="Part Image" class="h-56 w-full object-cover">
                    <div class="p-5 space-y-2">
                        <h3 class="text-xl font-bold text-gray-800"><%= p.getName() %></h3>
                        <p class="text-sm text-gray-500"><%= p.getDescription() %></p>
                        <div class="text-blue-600 font-semibold text-lg">Rs. <%= p.getPrice() %></div>
                        <form action="addToCart" method="post">
                            <input type="hidden" name="part_id" value="<%= p.getId() %>"/>
                            <input type="hidden" name="quantity" value="1"/>
                            <button type="submit"
                                    class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 mt-2 rounded text-sm font-semibold">
                                Add to Cart
                            </button>
                        </form>
                    </div>
                </div>
            <% }} else { %>
                <div class="col-span-full text-center text-gray-500">No parts available.</div>
            <% } %>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12">
    <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-6">
        <div>
            <h3 class="text-xl font-bold mb-3">Zenra Spare Parts</h3>
            <p>Your one-stop shop for genuine auto components.</p>
        </div>
        <div>
            <h4 class="font-semibold mb-2">Quick Links</h4>
            <ul class="space-y-1">
                <li><a href="#" class="hover:underline">Spare Parts</a></li>
                <li><a href="#" class="hover:underline">My Orders</a></li>
                <li><a href="#" class="hover:underline">Contact Us</a></li>
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

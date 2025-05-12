<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.vehicle.parts.model.CartItem" %>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart - Zenra</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
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

<div class="max-w-5xl mx-auto mt-12 p-6 bg-white rounded shadow">
    <h2 class="text-2xl font-bold mb-6">🛒 Your Cart</h2>

    <form action="clearCart" method="post" class="mb-6 text-right">
        <button type="submit" class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded text-sm">Clear Cart</button>
    </form>

    <table class="w-full table-auto mb-6">
        <thead>
            <tr class="text-left bg-gray-100">
                <th class="p-2">Part</th>
                <th class="p-2">Price</th>
                <th class="p-2">Quantity</th>
                <th class="p-2">Total</th>
                <th class="p-2">Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            double grandTotal = 0;
            int totalQuantity = 0;
            int partId = 0;
            if (cart != null && !cart.isEmpty()) {
                for (CartItem item : cart) {
                    grandTotal += item.getTotalPrice();
                    totalQuantity += item.getQuantity();
                    partId = item.getPart().getId(); // For hidden fields
        %>
            <tr class="border-b">
                <td class="p-2"><%= item.getPart().getName() %></td>
                <td class="p-2">Rs. <%= item.getPart().getPrice() %></td>
                <td class="p-2">
                    <form action="updateCart" method="post" class="flex items-center space-x-2">
                        <input type="hidden" name="part_id" value="<%= item.getPart().getId() %>"/>
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="w-20 px-2 py-1 border rounded"/>
                        <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-2 py-1 rounded text-sm">Update</button>
                    </form>
                </td>
                <td class="p-2">Rs. <%= item.getTotalPrice() %></td>
                <td class="p-2">
                    <form action="removeFromCart" method="post">
                        <input type="hidden" name="part_id" value="<%= item.getPart().getId() %>"/>
                        <button type="submit" class="bg-gray-300 hover:bg-gray-400 px-3 py-1 text-sm rounded">Remove</button>
                    </form>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="text-center text-gray-500 py-6">No items in cart</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <% if (cart != null && !cart.isEmpty()) { %>
        <form action="placeOrder.jsp" method="get" class="text-right">
            <input type="hidden" name="part_id" value="<%= partId %>"/>
            <input type="hidden" name="quantity" value="<%= totalQuantity %>"/>
            <input type="hidden" name="total_price" value="<%= grandTotal %>"/>
            <div class="text-lg font-semibold mb-4">Grand Total: Rs. <%= grandTotal %></div>
            <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded">
                Place Order
            </button>
        </form>
    <% } %>
</div>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12 mt-12">
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

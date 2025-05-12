<%@ page import="com.vehicle.parts.model.Order, com.vehicle.parts.dao.OrderDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Order order = new OrderDAO().getOrderById(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Order</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="flex h-screen bg-gray-100">

<!-- Sidebar -->
<aside class="w-64 bg-gray-900 text-white flex flex-col">
    <div class="p-6 font-bold text-xl border-b border-gray-700">Zenra Spare Parts</div>
    <nav class="flex-1 p-4 space-y-2">
        <a href="viewUsers" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
            <span class="material-icons mr-2">group</span> User Dashboard
        </a>
        <a href="viewSuppliers" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
            <span class="material-icons mr-2">business</span> Supplier Dashboard
        </a>
        <a href="viewParts" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
            <span class="material-icons mr-2">build</span> Spare Part Dashboard
        </a>
        <a href="viewAllOrders" class="flex items-center px-3 py-2 rounded bg-gray-800">
            <span class="material-icons mr-2">receipt_long</span> Order Dashboard
        </a>
    </nav>
    <div class="p-4 border-t border-gray-700">
        <form action="logout" method="post">
            <button type="submit" class="w-full bg-red-600 hover:bg-red-700 text-white py-2 rounded">Logout</button>
        </form>
    </div>
</aside>

<!-- Main Content -->
<div class="flex-1 flex flex-col">
    <!-- Header -->
    <header class="bg-white shadow px-6 py-4">
        <h1 class="text-xl font-bold">Edit Order - Address</h1>
    </header>

    <!-- Form Content -->
    <main class="p-6 overflow-auto flex justify-center items-start">
        <div class="bg-white p-6 rounded shadow w-full max-w-md">
            <form action="updateOrder" method="post" class="space-y-4">
                <input type="hidden" name="id" value="<%= order.getId() %>" />

                <div>
                    <label class="block text-sm font-medium text-gray-700">Order ID</label>
                    <input type="text" value="<%= order.getId() %>" readonly class="w-full border px-4 py-2 rounded bg-gray-100" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Part ID</label>
                    <input type="text" value="<%= order.getPartId() %>" readonly class="w-full border px-4 py-2 rounded bg-gray-100" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Customer Name</label>
                    <input type="text" value="<%= order.getCustomerName() %>" readonly class="w-full border px-4 py-2 rounded bg-gray-100" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Delivery Address</label>
                    <textarea name="address" required class="w-full border px-4 py-2 rounded"><%= order.getAddress() %></textarea>
                </div>

                <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded">
                    Update Address
                </button>
            </form>
        </div>
    </main>
</div>
</body>
</html>

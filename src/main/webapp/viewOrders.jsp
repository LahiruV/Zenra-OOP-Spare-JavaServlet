<%@ page import="java.util.*, com.vehicle.parts.model.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Order Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="flex h-screen bg-gray-100">

<!-- Sidebar -->
<aside class="w-64 bg-gray-900 text-white flex flex-col">
    <div class="p-6 font-bold text-xl border-b border-gray-700">Zenra Technologies</div>
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
            <button class="w-full bg-red-600 hover:bg-red-700 text-white py-2 rounded">Logout</button>
        </form>
    </div>
</aside>

<!-- Main Content -->
<div class="flex-1 flex flex-col">
    <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
        <h1 class="text-xl font-bold">Order Dashboard</h1>
    </header>

    <main class="p-6 overflow-auto">
        <div class="bg-white shadow rounded-lg p-4">
            <h2 class="text-lg font-semibold mb-4">Customer Orders</h2>
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50 text-left text-sm text-gray-500">
                    <tr>
                        <th class="px-4 py-2">Order ID</th>
                        <th class="px-4 py-2">Part ID</th>
                        <th class="px-4 py-2">Customer</th>
                        <th class="px-4 py-2">Address</th>
                        <th class="px-4 py-2">Quantity</th>
                        <th class="px-4 py-2">Total Price</th>
                        <th class="px-4 py-2">Order Date</th>
                        <th class="px-4 py-2 text-right">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%
                        if (orders != null && !orders.isEmpty()) {
                            for (Order o : orders) {
                    %>
                    <tr>
                        <td class="px-4 py-2"><%= o.getId() %></td>
                        <td class="px-4 py-2"><%= o.getPartId() %></td>
                        <td class="px-4 py-2"><%= o.getCustomerName() %></td>
                        <td class="px-4 py-2"><%= o.getAddress() %></td>
                        <td class="px-4 py-2"><%= o.getQuantity() %></td>
                        <td class="px-4 py-2">Rs. <%= o.getTotalPrice() %></td>
                        <td class="px-4 py-2"><%= o.getOrderDate() %></td>
                        <td class="px-4 py-2 text-right flex justify-end space-x-2">
                            <a href="edit_order.jsp?id=<%= o.getId() %>" class="inline-flex items-center px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700">
                                <span class="material-icons text-sm mr-1">edit</span>Edit
                            </a>
                            <form action="deleteOrder" method="post" onsubmit="return confirm('Are you sure to delete this order?');">
                                <input type="hidden" name="id" value="<%= o.getId() %>" />
                                <button type="submit" class="inline-flex items-center px-3 py-1 bg-red-600 text-white text-sm rounded hover:bg-red-700">
                                    <span class="material-icons text-sm mr-1">delete</span>Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center text-gray-500 py-4">No orders found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>

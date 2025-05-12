<%@ page import="java.util.*, com.vehicle.parts.model.Part" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spare Part Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="flex h-screen bg-gray-100">

<!-- Sidebar -->
<aside class="w-64 bg-gray-900 text-white flex flex-col">
    <!-- same sidebar -->
    <div class="p-6 font-bold text-xl border-b border-gray-700">Zenra Spare Parts</div>
    <nav class="flex-1 p-4 space-y-2">
        <a href="viewUsers" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
            <span class="material-icons mr-2">group</span> User Dashboard
        </a>
        <a href="viewSuppliers" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
            <span class="material-icons mr-2">business</span> Supplier Dashboard
        </a>
        <a href="viewParts" class="flex items-center px-3 py-2 rounded bg-gray-800">
            <span class="material-icons mr-2">build</span> Spare Part Dashboard
        </a>
        <a href="viewAllOrders" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
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
    <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
        <h1 class="text-xl font-bold">Spare Part Dashboard</h1>
        <a href="add_part.jsp" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded text-sm">
            + Add Spare Part
        </a>
    </header>

    <main class="p-6 overflow-auto">
        <div class="bg-white shadow rounded-lg p-4">
            <h2 class="text-lg font-semibold mb-4">Spare Parts Inventory</h2>
            <table class="min-w-full divide-y divide-gray-200">
                <thead>
                <tr class="bg-gray-50 text-left text-sm text-gray-500">
                    <th class="px-4 py-2">Name</th>
                    <th class="px-4 py-2">Description</th>
                    <th class="px-4 py-2">Price</th>
                    <th class="px-4 py-2">Quantity</th>
                    <th class="px-4 py-2">Supplier</th>
                    <th class="px-4 py-2">Image</th>
                    <th class="px-4 py-2 text-right">Actions</th>
                </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                <%
                    List<Part> parts = (List<Part>) request.getAttribute("parts");
                    for (Part p : parts) {
                %>
                <tr>
                    <td class="px-4 py-2"><%= p.getName() %></td>
                    <td class="px-4 py-2"><%= p.getDescription() %></td>
                    <td class="px-4 py-2">$<%= p.getPrice() %></td>
                    <td class="px-4 py-2"><%= p.getQuantity() %></td>
                    <td class="px-4 py-2"><%= p.getSupplierName() %></td>
                    <td class="px-4 py-2">
                        <img src="data:image/jpeg;base64,<%= p.getImage() %>" width="60" class="rounded" />
                    </td>
                    <td class="px-4 py-2 text-right space-x-2 flex justify-end">
                        <a href="edit_part.jsp?id=<%= p.getId() %>" class="inline-flex items-center px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700">
                            <span class="material-icons text-sm mr-1">edit</span>Edit
                        </a>
                        <form action="deletePart" method="post" onsubmit="return confirm('Delete this part?');" class="inline">
                            <input type="hidden" name="id" value="<%= p.getId() %>" />
                            <button type="submit" class="inline-flex items-center px-3 py-1 bg-red-600 text-white text-sm rounded hover:bg-red-700">
                                <span class="material-icons text-sm mr-1">delete</span>Delete
                            </button>
                        </form>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>

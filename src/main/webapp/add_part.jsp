<%@ page import="java.util.*, com.vehicle.parts.dao.SupplierDAO, com.vehicle.parts.model.Supplier" %>
<%
    List<Supplier> suppliers = new SupplierDAO().getAllSuppliers();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Spare Part</title>
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
        <a href="viewParts" class="flex items-center px-3 py-2 rounded bg-gray-800">
            <span class="material-icons mr-2">build</span> Spare Part Dashboard
        </a>
        <a href="viewOrders" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
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
    <header class="bg-white shadow px-6 py-4">
        <h1 class="text-xl font-bold">Add Spare Part</h1>
    </header>
    <main class="p-6 flex justify-center items-start">
        <div class="bg-white p-8 rounded shadow-lg w-full max-w-lg">
            <form action="addPart" method="post" enctype="multipart/form-data" class="space-y-4">
                <input type="text" name="name" placeholder="Part Name" required class="w-full border px-4 py-2 rounded" />
                <textarea name="description" placeholder="Description" class="w-full border px-4 py-2 rounded"></textarea>
                <input type="number" step="0.01" name="price" placeholder="Price" required class="w-full border px-4 py-2 rounded" />
                <input type="number" name="quantity" placeholder="Quantity" required class="w-full border px-4 py-2 rounded" />
                <select name="supplier_id" required class="w-full border px-4 py-2 rounded">
                    <option disabled selected>Select Supplier</option>
                    <% for (Supplier s : suppliers) { %>
                        <option value="<%= s.getId() %>"><%= s.getName() %></option>
                    <% } %>
                </select>
                <input type="file" name="image" accept="image/*" required class="w-full border px-4 py-2 rounded" />
                 <button type="submit" class="w-full bg-green-600 text-white py-2 rounded hover:bg-green-700">Add Spare Part</button>
            </form>
        </div>
    </main>
</div>
</body>
</html>

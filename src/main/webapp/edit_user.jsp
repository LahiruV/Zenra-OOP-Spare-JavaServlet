<%@ page import="com.vehicle.parts.dao.UserDAO, com.vehicle.parts.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    User user = new UserDAO().getUserByUsername(username);
    if (user == null) {
        response.getWriter().println("User not found");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit User - Vehicle Spare Parts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="flex h-screen bg-gray-100">

<!-- Sidebar -->
<aside class="w-64 bg-gray-900 text-white flex flex-col">
    <div class="p-6 font-bold text-xl border-b border-gray-700">Zenra Technologies</div>
    <nav class="flex-1 p-4 space-y-2">
        <a href="viewUsers" class="flex items-center px-3 py-2 rounded bg-gray-800">
            <span class="material-icons mr-2">group</span> User Dashboard
        </a>
        <a href="viewSuppliers" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
            <span class="material-icons mr-2">business</span> Supplier Dashboard
        </a>
        <a href="viewParts" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
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
    <!-- Header -->
    <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
        <h1 class="text-xl font-bold">Edit User</h1>
        <div class="flex items-center gap-4">
            <span class="material-icons text-gray-600">account_circle</span>
        </div>
    </header>

    <!-- Form Section -->
    <main class="flex justify-center items-start p-6">
        <div class="bg-white shadow-xl p-8 rounded-lg w-full max-w-md">
            <form action="updateUser" method="post" class="space-y-4">
                <input type="hidden" name="username" value="<%= user.getUsername() %>" />

                <div>
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" name="email" value="<%= user.getEmail() %>" required
                           class="w-full px-4 py-2 border rounded-md" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Phone</label>
                    <input type="text" name="phone" value="<%= user.getPhone() %>" required
                           class="w-full px-4 py-2 border rounded-md" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" name="password" value="<%= user.getPassword() %>" required
                           class="w-full px-4 py-2 border rounded-md" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Role</label>
                    <select name="role" required
                            class="w-full px-4 py-2 border rounded-md">
                        <option value="admin" <%= user.getRole().equals("admin") ? "selected" : "" %>>Admin</option>
                        <option value="customer" <%= user.getRole().equals("customer") ? "selected" : "" %>>Customer</option>
                    </select>
                </div>

                <div>
                     <button type="submit" class="w-full bg-green-600 text-white py-2 rounded hover:bg-green-700">
                        Update User
                    </button>
                </div>
            </form>
        </div>
    </main>
</div>

</body>
</html>

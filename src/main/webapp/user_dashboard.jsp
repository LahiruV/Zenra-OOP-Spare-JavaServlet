<%@ page import="java.util.*, com.vehicle.parts.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
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
                <button type="submit" class="w-full bg-red-600 hover:bg-red-700 text-white py-2 rounded">
                    Logout
                </button>
            </form>
        </div>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col">
        <!-- Header -->
        <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
            <h1 class="text-xl font-bold">User Dashboard</h1>
            <div class="flex items-center gap-4">
                <span class="material-icons text-gray-600">notifications</span>
                <span class="material-icons text-gray-600">group</span>
                 <span class="material-icons text-gray-600">account_circle</span>
            </div>
        </header>

        <!-- User Table -->
        <main class="p-6 overflow-auto">
            <div class="bg-white shadow rounded-lg p-4">
                <h2 class="text-lg font-semibold mb-4">Registered Users</h2>
                <table class="min-w-full divide-y divide-gray-200">
                    <thead>
                        <tr class="bg-gray-50">
                            <th class="px-4 py-2 text-left text-sm font-medium text-gray-500">Username</th>
                            <th class="px-4 py-2 text-left text-sm font-medium text-gray-500">Email</th>
                            <th class="px-4 py-2 text-left text-sm font-medium text-gray-500">Phone</th>
                            <th class="px-4 py-2 text-left text-sm font-medium text-gray-500">Role</th>
                            <th class="px-4 py-2 text-right text-sm font-medium text-gray-500">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                    <%
                        List<User> users = (List<User>) request.getAttribute("users");
                        if (users != null) {
                            for (User u : users) {
                    %>
                        <tr>
                            <td class="px-4 py-2"><%= u.getUsername() %></td>
                            <td class="px-4 py-2"><%= u.getEmail() %></td>
                            <td class="px-4 py-2"><%= u.getPhone() %></td>
                            <td class="px-4 py-2"><%= u.getRole() %></td>
                            <td class="px-4 py-2 text-right space-x-2 flex justify-end">

    <a href="edit_user.jsp?username=<%= u.getUsername() %>"
       class="inline-flex items-center px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
        <span class="material-icons text-sm mr-1">edit</span>Edit
    </a>

    <form action="deleteUser" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');" class="inline">
        <input type="hidden" name="username" value="<%= u.getUsername() %>" />
        <button type="submit"
                class="inline-flex items-center px-3 py-1 bg-red-600 text-white text-sm rounded hover:bg-red-700 transition">
            <span class="material-icons text-sm mr-1">delete</span>Delete
        </button>
    </form>
</td>
                        </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

</body>
</html>

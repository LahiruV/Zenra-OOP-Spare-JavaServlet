<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Zenra Spare Parts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen flex">

    <!-- Left: Image + Quote -->
    <div class="hidden md:flex w-1/2 bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1727413433599-496949ef8196?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
        <div class="absolute inset-0 bg-opacity-60 flex items-center justify-center">
            <div class="text-white text-center px-6">
                <h2 class="text-2xl font-bold">"The way to get started is to quit talking and begin doing."</h2>
                <p class="mt-2">Walt Disney</p>
            </div>
        </div>
    </div>

    <!-- Right: Form -->
    <div class="w-full md:w-1/2 flex items-center justify-center bg-gradient-to-r from-white to-purple-50">
        <div class="w-full max-w-md px-8 py-10 bg-white shadow-lg rounded-xl">
            <h2 class="text-3xl font-bold mb-6 text-green-700">Login</h2>
            <form action="login" method="post" class="space-y-6">
                <div>
                    <label class="block mb-1 text-sm font-medium text-gray-700">Username</label>
                    <input type="text" name="username" required
                           class="w-full border px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600" />
                </div>
                <div>
                    <label class="block mb-1 text-sm font-medium text-gray-700">Password</label>
                    <input type="password" name="password" required
                           class="w-full border px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600" />
                </div>
                <button type="submit"
                        class="w-full bg-green-600 text-white py-2 rounded-md hover:bg-green-700 transition duration-200">
                    LOGIN
                </button>
            </form>
            <p class="text-sm text-center text-gray-600 mt-4">
                Don’t have an account? <a href="register.jsp" class="text-green-600 hover:underline">Register</a>
            </p>
            <p class="text-xs text-center mt-6 text-gray-400">Powered by © Zenra Spare Parts</p>
        </div>
    </div>

</body>
</html>

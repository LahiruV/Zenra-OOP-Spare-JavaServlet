<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Vehicle Spare Parts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen flex">

    <!-- Left Side -->
    <div class="hidden md:flex w-1/2 bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1546522072-96134aefbd24?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
        <div class="absolute inset-0 flex items-center justify-center">
            <div class="text-white text-center px-6">
                <h2 class="text-2xl font-bold">"The way to get started is to quit talking and begin doing."</h2>
                <p class="mt-2">Walt Disney</p>
            </div>
        </div>
    </div>

    <!-- Right Side -->
    <div class="w-full md:w-1/2 flex items-center justify-center bg-gradient-to-r from-white to-purple-50">
        <div class="w-full max-w-md px-8 py-10 bg-white shadow-lg rounded-xl">
            <h2 class="text-3xl font-bold mb-6 text-green-700">Register</h2>

            <form action="register" method="post" class="space-y-5" autocomplete="off">
                <!-- Username -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">User Name</label>
                    <input type="text" name="username" required
                           class="w-full border px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600" />
                </div>
                <!-- Email -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" name="email" required
                           class="w-full border px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600" />
                </div>

                <!-- Password -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" name="password" required
                           class="w-full border px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600" />
                </div>

                <!-- Phone Number -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Phone Number</label>
                    <input type="text" name="phone" pattern="[0-9]{10}" required
                           class="w-full border px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600" />
                </div>

                <!-- Role -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Role</label>
                    <select name="role" required
                            class="w-full border px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600">
                        <option value="" disabled selected>Select Role</option>
                        <option value="admin">Admin</option>
                        <option value="customer">Customer</option>
                    </select>
                </div>

                <!-- Submit -->
                <div>
                    <button type="submit"
                            class="w-full bg-green-600 text-white py-2 rounded-md hover:bg-green-700 transition duration-200">
                        REGISTER
                    </button>
                </div>
            </form>

            <p class="text-sm text-center text-gray-600 mt-4">
                Already have an account? <a href="login.jsp" class="text-green-600 hover:underline">Login</a>
            </p>
            <p class="text-xs text-center mt-6 text-gray-400">Powered by © Zenra Spare Parts</p>
        </div>
    </div>

</body>
</html>

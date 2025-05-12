<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Zenra Spare Parts - Home</title>
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
                <a href="customer_homepage.jsp" class="text-blue-600 font-semibold border-b-2 border-blue-600 pb-1">Home</a>
                <a href="customerViewParts" class="hover:text-blue-600 font-medium">Spare Parts</a>
                <a href="viewOrders" class="hover:text-blue-600 font-medium">My Orders</a>
            </nav>
            <form action="logout" method="post">
                <button class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded text-sm font-semibold">Logout</button>
            </form>
        </div>
    </div>
</header>


<!-- Hero -->
<section class="h-[90vh] bg-cover bg-center flex items-center justify-center text-white relative"
         style="background-image: url('https://plus.unsplash.com/premium_photo-1661964291917-b20c2648fac6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
    <div class="absolute inset-0 bg-black bg-opacity-60"></div>
    <div class="relative z-10 text-center max-w-2xl px-6">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">Premium Spare Parts For Every Ride</h1>
        <p class="text-lg mb-6">Browse a wide range of genuine parts for cars, bikes, and heavy vehicles.</p>
        <a href="customerViewParts" class="bg-blue-600 hover:bg-blue-700 px-6 py-3 rounded-full font-semibold text-white">Shop Now</a>
    </div>
</section>

<!-- Categories -->
<section id="categories" class="py-16 bg-gray-100">
    <div class="max-w-7xl mx-auto px-6">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-10">Spare Parts Categories</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            <div class="bg-white p-6 rounded-lg shadow text-center hover:shadow-lg transition">
                <span class="material-icons text-4xl text-blue-600">build_circle</span>
                <h3 class="mt-4 font-semibold text-lg">Engine Parts</h3>
            </div>
            <div class="bg-white p-6 rounded-lg shadow text-center hover:shadow-lg transition">
                <span class="material-icons text-4xl text-green-600">car_repair</span>
                <h3 class="mt-4 font-semibold text-lg">Body Parts</h3>
            </div>
            <div class="bg-white p-6 rounded-lg shadow text-center hover:shadow-lg transition">
                <span class="material-icons text-4xl text-yellow-600">electrical_services</span>
                <h3 class="mt-4 font-semibold text-lg">Electrical</h3>
            </div>
            <div class="bg-white p-6 rounded-lg shadow text-center hover:shadow-lg transition">
                <span class="material-icons text-4xl text-red-600">settings</span>
                <h3 class="mt-4 font-semibold text-lg">Accessories</h3>
            </div>
        </div>
    </div>
</section>

<!-- Popular Parts -->
<section class="py-16">
    <div class="max-w-7xl mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-10">Popular Spare Parts</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            <div class="bg-white p-4 rounded shadow text-center hover:shadow-lg">
                <img src="https://images.unsplash.com/photo-1663642775693-6628f65358be?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="h-40 object-cover mx-auto rounded mb-3" />
                <h3 class="font-semibold">Alternator</h3>
                <p class="text-sm text-gray-600">Genuine alternators for all vehicle models.</p>
            </div>
            <div class="bg-white p-4 rounded shadow text-center hover:shadow-lg">
                <img src="https://images.unsplash.com/photo-1637087867441-564a2bbc0e7c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="h-40 object-cover mx-auto rounded mb-3" />
                <h3 class="font-semibold">Brake Disc</h3>
                <p class="text-sm text-gray-600">Reliable and long-lasting brake systems.</p>
            </div>
            <div class="bg-white p-4 rounded shadow text-center hover:shadow-lg">
                <img src="https://images.unsplash.com/photo-1701836924325-3bdbfc2e8689?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="h-40 object-cover mx-auto rounded mb-3" />
                <h3 class="font-semibold">Shock Absorber</h3>
                <p class="text-sm text-gray-600">Ride smoother with premium shocks.</p>
            </div>
            <div class="bg-white p-4 rounded shadow text-center hover:shadow-lg">
                <img src="https://images.unsplash.com/photo-1640556795357-71d4078d6228?q=80&w=3214&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="h-40 object-cover mx-auto rounded mb-3" />
                <h3 class="font-semibold">Starter Motor</h3>
                <p class="text-sm text-gray-600">Powerful start for your engine every time.</p>
            </div>
        </div>
    </div>
</section>

<!-- Why Choose Us -->
<section class="bg-gray-100 py-16">
    <div class="max-w-7xl mx-auto px-6 text-center">
        <h2 class="text-3xl font-bold mb-6">Why Choose Zenra?</h2>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
            <div class="bg-white p-6 rounded shadow hover:shadow-lg transition">
                <span class="material-icons text-4xl text-blue-600">verified</span>
                <h4 class="mt-4 font-semibold">Genuine Parts</h4>
                <p class="text-sm text-gray-600">Certified OEM products only.</p>
            </div>
            <div class="bg-white p-6 rounded shadow hover:shadow-lg transition">
                <span class="material-icons text-4xl text-green-600">local_shipping</span>
                <h4 class="mt-4 font-semibold">Fast Delivery</h4>
                <p class="text-sm text-gray-600">Island-wide delivery in 3 days.</p>
            </div>
            <div class="bg-white p-6 rounded shadow hover:shadow-lg transition">
                <span class="material-icons text-4xl text-yellow-600">support_agent</span>
                <h4 class="mt-4 font-semibold">24/7 Support</h4>
                <p class="text-sm text-gray-600">Dedicated hotline anytime.</p>
            </div>
            <div class="bg-white p-6 rounded shadow hover:shadow-lg transition">
                <span class="material-icons text-4xl text-purple-600">credit_score</span>
                <h4 class="mt-4 font-semibold">Secure Payments</h4>
                <p class="text-sm text-gray-600">SSL encrypted transactions.</p>
            </div>
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

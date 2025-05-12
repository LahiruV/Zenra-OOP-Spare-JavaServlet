<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Supplier</title>
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
        <a href="viewSuppliers" class="flex items-center px-3 py-2 rounded bg-gray-800">
            <span class="material-icons mr-2">business</span> Supplier Dashboard
        </a>
        <a href="viewParts" class="flex items-center px-3 py-2 rounded hover:bg-gray-700">
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
        <h1 class="text-xl font-bold">Add Supplier</h1>
    </header>

    <main class="flex justify-center items-start p-6">
        <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
            <form action="addSupplier" method="post" class="space-y-4">
                <input type="text" name="name" placeholder="Name" required class="w-full border px-4 py-2 rounded" />
                <input type="email" name="email" placeholder="Email" required class="w-full border px-4 py-2 rounded" />
                <input type="text" name="contact_no" placeholder="Contact Number" required class="w-full border px-4 py-2 rounded" />

              <label class="block text-sm font-medium text-gray-700">Rating</label>
<div id="star-rating" class="flex space-x-1">
    <!-- Stars will be added by JS -->
</div>
<input type="hidden" name="rating" id="rating" value="0">
<script>
    const container = document.getElementById('star-rating');
    const hiddenInput = document.getElementById('rating');

    for (let i = 1; i <= 5; i++) {
        const label = document.createElement('label');
        label.className = "cursor-pointer text-2xl";
        label.innerHTML = "&#9733;";
        label.dataset.value = i;

        label.addEventListener('click', function () {
            hiddenInput.value = this.dataset.value;
            updateStars(this.dataset.value);
        });

        container.appendChild(label);
    }

    function updateStars(value) {
        const labels = container.querySelectorAll('label');
        labels.forEach((label, idx) => {
            label.classList.toggle('text-yellow-400', idx < value);
            label.classList.toggle('text-gray-300', idx >= value);
        });
    }

    // Initial render
    updateStars(hiddenInput.value);
</script>

                <select name="category" required class="w-full border px-4 py-2 rounded">
                    <option disabled selected>Select Category</option>
                    <option value="Local Supplier">Local Supplier</option>
                    <option value="Foreign Supplier">Foreign Supplier</option>
                </select>

                <button type="submit" class="w-full bg-green-600 text-white py-2 rounded hover:bg-green-700">Add Supplier</button>
            </form>
        </div>
    </main>
</div>
</body>
</html>


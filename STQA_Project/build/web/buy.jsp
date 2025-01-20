<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Product Order Form</title>
    <link rel="stylesheet" href="buy.css"> <!-- Link to your CSS file -->
</head>
<body>
    <div class="container">
        <h2>Place Your Order</h2>
        <form action="ProductOrderServlet" method="post" onsubmit="return validateForm()">
            <!-- First Name -->
            <label for="fname">
                First Name <span class="required">*</span>
            </label>
            <input type="text" id="fname" name="fname" required>
            <br>

            <!-- Last Name -->
            <label for="lname">
                Last Name <span class="required">*</span>
            </label>
            <input type="text" id="lname" name="lname" required>
            <br>

            <!-- Country -->
            <label for="country">
                Country <span class="required">*</span>
            </label>
            <select id="country" name="selection" required>
                <option value="select">Select a country...</option>
                <option value="IND">India</option>
                <option value="PAK">Pakistan</option>
                <option value="USA">United States</option>
                <option value="CAN">Canada</option>
                <option value="UK">United Kingdom</option>
            </select>
            <br>

            <!-- Street Address -->
            <label for="street">
                Street Address <span class="required">*</span>
            </label>
            <input type="text" id="street" name="houseadd" placeholder="Street Address" required>
            <br>

            <!-- City -->
            <label for="city">
                City <span class="required">*</span>
            </label>
            <input type="text" id="city" name="city" required>
            <br>

            <!-- Phone Number -->
            <label for="phoneNumber">
                Phone Number <span class="required">*</span>
            </label>
            <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" required>
            <br>

            <!-- Email -->
            <label for="email">
                Email Address <span class="required">*</span>
            </label>
            <input type="email" id="email" name="email" required>
            <br>

            <!-- Submit Button -->
            <button type="submit">Place Order</button>
        </form>
    </div>

    <script>
        // Simple form validation function
        function validateForm() {
            const phoneNumber = document.getElementById("phoneNumber").value;
            const phonePattern = /^\d{10}$/;

            if (!phonePattern.test(phoneNumber)) {
                alert("Phone Number must be a valid 10-digit number.");
                return false;
            }

            return true; // Form can be submitted
        }
    </script>
</body>
</html>

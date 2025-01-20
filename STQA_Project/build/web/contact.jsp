<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact us</title>
    <link rel="stylesheet" href="contactus.css">
</head>
<body>
    <form action="ContactUsServlet" method="POST" class="container" onsubmit="return validateForm()">
        <div class="contact_us_2">
            <div class="responsive-container-block big-container">
                <div class="blueBG"></div>
                <div class="responsive-container-block container">
                    <div class="form-box">
                        <div class="container-block form-wrapper">
                            <p class="text-blk contactus-head">
                                Get in Touch
                            </p>
                            <div class="form-grid">
                                <div class="form-input">
                                    <label for="FirstName" class="input-title">FIRST NAME</label>
                                    <input class="input" id="FirstName" name="FirstName" placeholder="Please enter first name..." required>
                                </div>
                                <div class="form-input">
                                    <label for="LastName" class="input-title">LAST NAME</label>
                                    <input class="input" id="LastName" name="LastName" placeholder="Please enter last name..." required>
                                </div>
                                <div class="form-input">
                                    <label for="Email" class="input-title">EMAIL</label>
                                    <input class="input" id="Email" name="Email" placeholder="Please enter email..." required>
                                </div>
                                <div class="form-input">
                                    <label for="PhoneNumber" class="input-title">PHONE NUMBER (xxx-xxx-xxxx)</label>
                                    <input class="input" id="PhoneNumber" name="PhoneNumber" placeholder="Please enter phone number..." required>
                                </div>
                                <div class="form-input full-width">
                                    <label for="Query" class="input-title">WHAT DO YOU HAVE IN MIND</label>
                                    <textarea class="textinput" id="Query" name="Query" placeholder="Please enter query..." required></textarea>
                                </div>
                            </div>
                            <button class="submit-btn" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function validateForm() {
            var firstName = document.getElementById("FirstName").value;
            var lastName = document.getElementById("LastName").value;
            var email = document.getElementById("Email").value;
            var phoneNumber = document.getElementById("PhoneNumber").value;
            var query = document.getElementById("Query").value;

            // Check if first name, last name, and email are not empty
            if (firstName === "" || lastName === "" || email === "") {
                alert("First Name, Last Name, and Email are required fields");
                return false; // Prevent form submission
            }

            // Check if the email is in a valid format (basic validation)
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Invalid email format");
                return false; // Prevent form submission
            }

            // Check if phone number is in a valid format (xxx-xxx-xxxx)
            var phoneNumberPattern = /^\d{3}\d{3}\d{4}$/;
            if (!phoneNumberPattern.test(phoneNumber)) {
                alert("Phone Number must be in format xxx-xxx-xxxx");
                return false; // Prevent form submission
            }

            return true; 
        }
    </script>
</body>
</html>

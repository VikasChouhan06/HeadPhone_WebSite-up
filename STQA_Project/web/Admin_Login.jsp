<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        /* General reset */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
            font-family: 'Arial', sans-serif;
            background-color: #0d1b2a;
        }

        /* Background Image */
        .bg-img {
            background-image: url("https://static.vecteezy.com/system/resources/previews/001/987/748/non_2x/abstract-template-blue-geometric-diagonal-overlap-layer-on-dark-blue-background-free-vector.jpg");
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }

        /* Container Styling */
        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #1a2a3a;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            text-align: center;
            color: #00b0ff;
            margin-bottom: 20px;
            font-size: 2.5rem;
        }

        label {
            font-size: 16px;
            color: #ddd;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #444;
            border-radius: 5px;
            background-color: #2a3a4a;
            color: #fff;
            font-size: 16px;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #00b0ff;
            background-color: #3a4b6a;
            outline: none;
        }

        .btn {
            background-color: #00b0ff;
            color: white;
            padding: 16px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0086c3;
        }

        /* Error Message Styling */
        .error {
            color: #ff4d4d;
            font-size: 14px;
            text-align: center;
            margin-bottom: 15px;
        }

        /* Footer Styling */
        .footer {
            text-align: center;
            margin-top: 15px;
            color: #00b0ff;
        }

        .footer a {
            color: #00b0ff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Responsive Styling */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            .btn {
                font-size: 16px;
            }

            h1 {
                font-size: 2rem;
            }
        }

        @media (max-width: 400px) {
            h1 {
                font-size: 1.8rem;
            }

            .btn {
                font-size: 14px;
                padding: 12px;
            }

            .error {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="bg-img">
        <div class="container">
            <h1>Admin Login</h1>
            <form id="loginForm" action="Admin.jsp" method="POST">
                <div id="error-message" class="error"></div>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter Username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter Password" required>

                <button type="submit" class="btn">Login</button>
            </form>

            <div class="footer">
                <p>&copy; 2024 Admin Portal</p>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault();
            
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const errorMessage = document.getElementById('error-message');
            
            // Default username and password
            const defaultUsername = 'Admin';
            const defaultPassword = 'Ad123';
            
            // Error Handling
            if (username !== defaultUsername || password !== defaultPassword) {
                errorMessage.textContent = 'Incorrect Username or Password. Please try again.';
            } else {
                errorMessage.textContent = ''; // Clear error if login is successful
                // Allow form submission to proceed to Admin.jsp
                document.getElementById('loginForm').submit();
            }
        });
    </script>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
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
    }

    .bg-img {
      background-image: url("https://static.vecteezy.com/system/resources/previews/001/987/748/non_2x/abstract-template-blue-geometric-diagonal-overlap-layer-on-dark-blue-background-free-vector.jpg");
      height: 100%;
      background-position: center;
      background-repeat: no-repeat;
      background-size: cover;
      position: relative;
    }

    .container {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background: linear-gradient(145deg, #1a1d4e, #283060);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.4);
      max-width: 400px;
      width: 100%;
    }

    h1 {
      text-align: center;
      color: #fff;
      margin-bottom: 20px;
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
      border: 1px solid #555;
      border-radius: 5px;
      background-color: #3a456b; /* Lightened background */
      font-size: 16px;
      color: #fff;
    }

    input[type="text"]:focus, input[type="password"]:focus {
      border-color: #3498db;
      background-color: #4a5680; /* Slightly lighter on focus */
      outline: none;
    }

    .btn {
      background: linear-gradient(145deg, #3b5998, #4a70cc);
      color: white;
      padding: 16px;
      border: none;
      border-radius: 30px;
      cursor: pointer;
      width: 100%;
      font-size: 18px;
      transition: background 0.3s ease, transform 0.2s;
    }

    .btn:hover {
      background: linear-gradient(145deg, #2c4e91, #3a61b8);
      transform: translateY(-3px);
    }

    .footer {
      text-align: center;
      margin-top: 15px;
    }

    .footer a {
      color: #3498db;
      text-decoration: none;
    }

    .footer a:hover {
      text-decoration: underline;
    }

    @media (max-width: 600px) {
      .container {
        padding: 20px;
      }

      .btn {
        font-size: 16px;
      }
    }
  </style>
</head>
<body>
 <div class="bg-img">
    <form action="SignupServlet" class="container" method="POST" onsubmit="return validateForm()">
      <h1>Sign Up</h1>

      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Enter your name" name="name" id="name" required>

      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter your email" name="email" id="email" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

      <label for="psw-repeat"><b>Confirm Password</b></label>
      <input type="password" placeholder="Confirm Password" name="psw-repeat" id="psw-repeat" required>

      <button type="submit" class="btn">Sign Up</button>

      <div class="footer">
        <p>Already have an account? <a href="login.jsp">Login</a></p>
      </div>
    </form>
  </div>

  <script>
    function validateForm() {
      var name = document.getElementById("name").value;
      var email = document.getElementById("email").value;
      var password = document.getElementById("psw").value;
      var confirmPassword = document.getElementById("psw-repeat").value;
      
      // Validate name (cannot be empty)
      if (name == "") {
        alert("Name must be filled out");
        return false;
      }

      // Validate email format
      var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailPattern.test(email)) {
        alert("Invalid email format");
        return false; 
      }

      // Validate password length (at least 6 characters)
      if (password.length < 6) {
        alert("Password must be at least 6 characters long");
        return false;
      }

      // Check if passwords match
      if (password !== confirmPassword) {
        alert("Passwords do not match");
        return false;
      }

      return true; // If all validations pass
    }
  </script>


</body>
</html>

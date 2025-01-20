<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login</title>
  <style>
    /* General reset */
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    html,
    body {
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
      width: 90%;
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

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 15px;
      margin-bottom: 20px;
      border: 1px solid #555;
      border-radius: 5px;
      background-color: #3a456b;
      font-size: 16px;
      color: #fff;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
      border-color: #3498db;
      background-color: #4a5680;
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

    /* Media Queries for Responsiveness */
    @media (max-width: 600px) {
      .container {
        padding: 20px;
      }

      .btn {
        font-size: 16px;
      }

      h1 {
        font-size: 1.5rem;
      }

      label,
      input[type="text"],
      input[type="password"] {
        font-size: 14px;
      }
    }

    @media (max-width: 400px) {
      .container {
        padding: 15px;
      }

      h1 {
        font-size: 1.2rem;
      }
    }
  </style>
</head>

<body>
  <div class="bg-img">
    <form action="LoginServlet" method="POST" class="container" onsubmit="return validateForm()">
      <h1>Login</h1>

      <label for="email">Email</label>
      <input type="text" placeholder="Enter Email" name="email" id="email" required>

      <label for="psw">Password</label>
      <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

      <button type="submit" class="btn">Login</button>

      <div class="footer">
        <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
        <p><a href="#">Forgot Password?</a></p>
      </div>
    </form>
  </div>

  <%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (errorMessage != null) {
        out.println("<script>alert('" + errorMessage + "');</script>");
        session.removeAttribute("errorMessage");
    }
  %>

  <script>
    // Function to validate email and password
    function validateForm() {
        var email = document.getElementById("email").value.trim();
        var password = document.getElementById("psw").value.trim();
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailPattern.test(email)) {
            alert("Invalid email format");
            return false; 
        }

        if (password.length < 6) {
            alert("Password must be at least 6 characters long");
            return false; 
        }

        return true; 
    }
  </script>
</body>

</html>

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:derby://localhost:1527/newD";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123";
    private static final String DB_DRIVER = "org.apache.derby.jdbc.ClientDriver";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("psw"); // Ensure the form's input name matches this

        // Validate input
        if (name == null || email == null || password == null || name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            return;
        }

        Connection connection = null;
        PreparedStatement ps = null;

        try {
            // Load Derby JDBC Driver
            Class.forName(DB_DRIVER);
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check if email already exists
            String checkSql = "SELECT COUNT(*) FROM Users WHERE email = ?";
            ps = connection.prepareStatement(checkSql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                request.setAttribute("errorMessage", "Email is already registered.");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
                return;
            }
            ps.close();

            // Insert new user into the database
            String insertSql = "INSERT INTO Users (name, email, password) VALUES (?, ?, ?)";
            ps = connection.prepareStatement(insertSql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);

            int result = ps.executeUpdate();
            if (result > 0) {
                // Redirect to login page upon successful registration
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to register user. Please try again.");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle database or other exceptions
            request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again later.");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (ps != null) ps.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

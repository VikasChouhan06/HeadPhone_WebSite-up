import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
    
    // Database connection details
    private static final String DB_URL = "jdbc:derby://localhost:1527/newD";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123";
    private static final String DB_DRIVER = "org.apache.derby.jdbc.ClientDriver";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get data from form
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String email = request.getParameter("Email");
        String phoneNumber = request.getParameter("PhoneNumber");
        String query = request.getParameter("Query");

        // Database connection and insert data
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load the database driver
            Class.forName(DB_DRIVER);

            // Connect to the database
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert data
            String sql = "INSERT INTO ContactUs (first_name, last_name, email, phone_number, query) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);

            // Set the values from the form
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, phoneNumber);
            stmt.setString(5, query);

            // Execute the insert
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.getWriter().write("Thank you for contacting us!");
            } else {
                response.getWriter().write("Failed to submit your query. Please try again.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database connection error. Please try again later.");
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

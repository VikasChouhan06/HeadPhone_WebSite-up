import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductOrderServlet")
public class ProductOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Derby database connection URL and credentials
    private static final String DB_URL = "jdbc:derby://localhost:1527/newD";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123";
   // private static final String DB_DRIVER = "org.apache.derby.jdbc.ClientDriver";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String country = request.getParameter("selection");
        String streetAddress = request.getParameter("houseadd");
        String city = request.getParameter("city");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the Derby JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Establish database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL Insert query
            String sql = "INSERT INTO ProductOrder (first_name, last_name, country, street_address, city, phone_number, email) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);

            // Set parameter values
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, country);
            pstmt.setString(4, streetAddress);
            pstmt.setString(5, city);
            pstmt.setString(6, phoneNumber);
            pstmt.setString(7, email);

            // Execute update
            int rowsInserted = pstmt.executeUpdate();

            // Display result
            if (rowsInserted > 0) {
                out.println("<h3>Order placed successfully!</h3>");
            } else {
                out.println("<h3>Failed to place the order. Please try again.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

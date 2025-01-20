import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.net.URLEncoder; // Add this import
import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("psw");

        Connection conn = null;
        PreparedStatement psCheckEmail = null;
        PreparedStatement psCheckPassword = null;
        PreparedStatement psInsertLogin = null;
        ResultSet rsEmail = null;
        ResultSet rsPassword = null;

        try {
            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/newD", "root", "123");

            // Check if email exists in the database
            String checkEmailQuery = "SELECT * FROM Users WHERE email = ?";
            psCheckEmail = conn.prepareStatement(checkEmailQuery);
            psCheckEmail.setString(1, email);
            rsEmail = psCheckEmail.executeQuery();

            if (rsEmail.next()) {
                // Check if the password matches for the given email
                String checkPasswordQuery = "SELECT * FROM Users WHERE email = ? AND password = ?";
                psCheckPassword = conn.prepareStatement(checkPasswordQuery);
                psCheckPassword.setString(1, email);
                psCheckPassword.setString(2, password);
                rsPassword = psCheckPassword.executeQuery();

                if (rsPassword.next()) {
                    // Insert login data into the Login table
                    String insertLoginQuery = "INSERT INTO Login (email, login_time) VALUES (?, CURRENT_TIMESTAMP)";
                    psInsertLogin = conn.prepareStatement(insertLoginQuery);
                    psInsertLogin.setString(1, email);
                    psInsertLogin.executeUpdate();

                    // Set session attribute and redirect to home page
                    HttpSession session = request.getSession();
                    session.setAttribute("userEmail", email);
                    response.sendRedirect("index.jsp");
                } else {
                    // Password is incorrect
                    request.getSession().setAttribute("errorMessage", "Incorrect password. Please try again.");
                    response.sendRedirect("login.jsp");
                }
            } else {
                // Email does not exist
                request.getSession().setAttribute("errorMessage", "Invalid email. Please check your email and try again.");
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection error");
        } finally {
            try {
                if (rsEmail != null) rsEmail.close();
                if (rsPassword != null) rsPassword.close();
                if (psCheckEmail != null) psCheckEmail.close();
                if (psCheckPassword != null) psCheckPassword.close();
                if (psInsertLogin != null) psInsertLogin.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

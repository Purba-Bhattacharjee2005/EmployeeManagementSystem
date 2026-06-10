<%@ page import="java.sql.*" %>
<%@ page import="com.ems.DBConnection" %>
<%
    String message = "";
    
    // Process the form if it was submitted
    if(request.getMethod().equalsIgnoreCase("POST")) {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String confirmPass = request.getParameter("confirm_password");
        
        if (!pass.equals(confirmPass)) {
            message = "<h3 style='color:red;'>Passwords do not match!</h3>";
        } else {
            try {
                Connection con = DBConnection.getConnection();
                
                // First, check if the username already exists
                PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM users WHERE username = ?");
                checkStmt.setString(1, user);
                ResultSet rs = checkStmt.executeQuery();
                
                if (rs.next()) {
                    message = "<h3 style='color:red;'>Username already taken. Please choose another.</h3>";
                } else {
                    // Insert the new user with the default 'EMPLOYEE' role
                    PreparedStatement insertStmt = con.prepareStatement("INSERT INTO users (username, password, role) VALUES (?, ?, 'EMPLOYEE')");
                    insertStmt.setString(1, user);
                    insertStmt.setString(2, pass);
                    
                    int rows = insertStmt.executeUpdate();
                    if (rows > 0) {
                        // Registration successful! Redirect them to the login page.
                        response.sendRedirect("login.jsp?registered=true");
                        return; // Stop processing this page
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "<h3 style='color:red;'>An error occurred during registration.</h3>";
            }
        }
    }
%>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h2>Create an Account</h2>
        
        <%= message %>
        
        <form method="post" action="signup.jsp">
            <label>Choose a Username:</label>
            <input type="text" name="username" required>
            
            <label>Create Password:</label>
            <input type="password" name="password" required>
            
            <label>Confirm Password:</label>
            <input type="password" name="confirm_password" required>
            
            <input type="submit" value="Sign Up">
        </form>
        
        <div class="button-container">
            <p style="font-size: 18px;">Already have an account? <a href="login.jsp" style="color: #1565c0; text-decoration: none; font-weight: bold;">Login here</a></p>
        </div>
    </div>
</body>
</html>
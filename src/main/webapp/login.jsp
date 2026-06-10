<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h2>System Login</h2>
        
        <% if ("true".equals(request.getParameter("registered"))) { %>
            <h3 style="color: green;">Registration successful! You can now log in.</h3>
        <% } %>

        <form action="LoginCheck.jsp" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>
            
            <label>Password:</label>
            <input type="password" name="password" required>
            
            <input type="submit" value="Login">
        </form>
        
        <div class="button-container">
            <p style="font-size: 18px;">Don't have an account? <a href="signup.jsp" style="color: #1565c0; text-decoration: none; font-weight: bold;">Sign Up here</a></p>
        </div>
        
    </div>
</body>
</html>
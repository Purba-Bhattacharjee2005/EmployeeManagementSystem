<%
String role = (String)session.getAttribute("role");
if(role == null) {
    response.sendRedirect("login.jsp");
}
%>
<html>
<head>
    <title>Employee Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="navbar">Employee Management System</div>
    <div class="container">
        <div class="card">
            <h1>Employee Dashboard</h1>
            <h2>Welcome Employee</h2>
            <div class="user-box">
                Welcome <%= session.getAttribute("user") %>
            </div>
            
            <div class="button-container">
                <a href="EmployeeDashboard.jsp" class="btn home">Home</a>
                <a href="ChangePassword.jsp" class="btn password">Change Password</a>
                <a href="Logout.jsp" class="btn logout">Logout</a>
            </div>
        </div>
    </div>
</body>
</html>
<%@ page import="com.ems.dao.EmployeeDAO" %>
<%@ page import="com.ems.model.Employee" %>
<html>
<head>
    <title>Add Employee</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h1>Employee Dashboard</h1>
        <div class="user-box">
            Logged in as: <strong><%= session.getAttribute("user") %></strong>
        </div>

        <div class="button-container">
            <a href="EmployeeDashboard.jsp" class="btn home">Home</a>
            <a href="ChangePassword.jsp" class="btn password">Change Password</a>
            <a href="Logout.jsp" class="btn logout">Logout</a>
        </div>

        <br><hr><br>

        <h2>Add New Employee</h2>
        <form method="post">
            <label>Name:</label>
            <input type="text" name="name" required>
            
            <label>Email:</label>
            <input type="text" name="email" required>
            
            <label>Department:</label>
            <input type="text" name="department" required>
            
            <input type="submit" value="Add Employee">
        </form>

        <%
        if(request.getMethod().equalsIgnoreCase("POST")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String department = request.getParameter("department");

            Employee emp = new Employee(0, name, email, department);
            EmployeeDAO dao = new EmployeeDAO();
            boolean status = dao.addEmployee(emp);

            if(status) {
                out.println("<h3>Employee Added Successfully!</h3>");
                
                // --- THIS IS THE NEW EMAIL TRIGGER ---
                String subject = "Welcome to the Company!";
                String body = "Hello " + name + ",\n\nYour employee profile has been successfully created.\nDepartment: " + department;
                com.ems.util.EmailUtil.sendEmail(email, subject, body);
                // -------------------------------------
                
            } else {
                out.println("<h3 style='color:red;'>Failed to Add Employee!</h3>");
            }
        }
        %>
    </div>
</body>
</html>
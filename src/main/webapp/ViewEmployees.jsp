<%@ page import="java.util.*" %>
<%@ page import="com.ems.dao.EmployeeDAO" %>
<%@ page import="com.ems.model.Employee" %>
<html>
<head>
    <title>View Employees</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h2>Employee List</h2>
        
        <form action="SearchEmployee.jsp" style="display:inline-block; padding:15px; box-shadow:none;">
            <input type="text" name="keyword" placeholder="Search by name..." style="width:200px; display:inline-block; margin:0;" required>
            <input type="submit" value="Search" style="width:auto; display:inline-block; margin-left:10px;">
        </form>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
            EmployeeDAO dao = new EmployeeDAO();
            List<Employee> list = dao.getAllEmployees();
            for(Employee e : list) {
            %>
            <tr>
                <td><%= e.getId() %></td>
                <td><%= e.getName() %></td>
                <td><%= e.getEmail() %></td>
                <td><%= e.getDepartment() %></td>
                <td><a href="EditEmployee.jsp?id=<%=e.getId()%>">Update</a></td>
                <td><a href="DeleteEmployee.jsp?id=<%= e.getId() %>" onclick="return confirm('Are you sure?')">Delete</a></td>
            </tr>
            <% } %>
        </table>

        <div class="button-container">
             <a href="AdminDashboard.jsp" class="btn home">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
<%@ page import="java.sql.*" %>
<%@ page import="com.ems.DBConnection" %>
<%
/*
String role = (String)session.getAttribute("role");
if(role == null || !role.equals("ADMIN")) {
    response.sendRedirect("login.jsp");
}
*/
%>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <%
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select count(*) from employee");
        ResultSet rs = ps.executeQuery();
        int totalEmployees = 0;
        if(rs.next()) {
            totalEmployees = rs.getInt(1);
        }
        %>

        <div class="navbar">Employee Management System</div>
        <h1>Admin Dashboard</h1>
        <h3>Welcome Admin</h3>
        <div class="user-box">
            Logged in as: <strong><%= session.getAttribute("user") %></strong>
        </div>

        <div class="card">
            <h3>Total Employees: <%= totalEmployees %></h3>
            <h3>Department Statistics</h3>
            <table>
                <tr>
                    <th>Department</th>
                    <th>Total Employees</th>
                </tr>
                <%
                PreparedStatement psDept = con.prepareStatement("select department, count(*) from employee group by department");
                ResultSet rsDept = psDept.executeQuery();
                while(rsDept.next()) {
                %>
                <tr>
                    <td><%= rsDept.getString(1) %></td>
                    <td><%= rsDept.getInt(2) %></td>
                </tr>
                <% } %>
            </table>
        </div>

        <div class="button-container">
            <a href="AdminDashboard.jsp" class="btn home">Home</a>
            <a href="AddEmployee.jsp" class="btn home">Add Employee</a>
            <a href="ViewEmployees.jsp" class="btn password">View Employees</a>
            <a href="ChangePassword.jsp" class="btn password">Change Password</a>
            <a href="Logout.jsp" class="btn logout">Logout</a>
        </div>
    </div>
</body>
</html>
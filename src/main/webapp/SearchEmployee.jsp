<%@ page import="java.sql.*" %>
<%@ page import="com.ems.DBConnection" %>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h2>Search Results</h2>
        
        <div class="button-container">
             <a href="ViewEmployees.jsp" class="btn home">Back to List</a>
        </div>
        <br>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
            </tr>
            <%
            String keyword = request.getParameter("keyword");
            Connection con = DBConnection.getConnection();
            String sql = "select * from employee where name like ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("department") %></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
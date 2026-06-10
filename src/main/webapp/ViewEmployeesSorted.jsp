<%@ page import="java.sql.*" %>
<%@ page import="com.ems.DBConnection" %>
<%
String sort = request.getParameter("sort");
if(sort == null) {
    sort = "id";
}
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from employee order by " + sort);
%>
<html>
<head>
    <title>Sorted Employees</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h2>Sorted Employee List</h2>

        <div class="button-container" style="margin-bottom: 20px;">
            <a href="ViewEmployeesSorted.jsp?sort=name" class="btn home">Sort by Name</a>
            <a href="ViewEmployeesSorted.jsp?sort=department" class="btn password">Sort by Dept</a>
            <a href="ViewEmployeesSorted.jsp?sort=id" class="btn logout">Sort by ID</a>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
            </tr>
            <% while(rs.next()) { %>
            <tr>
                <td><%=rs.getInt("id")%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("department")%></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
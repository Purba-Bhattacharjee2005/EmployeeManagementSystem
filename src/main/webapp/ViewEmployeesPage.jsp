<%@ page import="java.util.*" %>
<%@ page import="com.ems.dao.EmployeeDAO" %>
<%@ page import="com.ems.model.Employee" %>
<%
int pageid = 0;
String p = request.getParameter("page");
if(p != null) {
    pageid = Integer.parseInt(p);
}
int total = 3;
EmployeeDAO dao = new EmployeeDAO();
List<Employee> list = dao.getEmployeesByPage(pageid,total);
%>
<html>
<head>
    <title>Employee Pagination</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h2>Employee List (Paged)</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
            </tr>
            <% for(Employee e:list) { %>
            <tr>
                <td><%=e.getId()%></td>
                <td><%=e.getName()%></td>
                <td><%=e.getEmail()%></td>
                <td><%=e.getDepartment()%></td>
            </tr>
            <% } %>
        </table>

        <div class="button-container">
            <a href="ViewEmployeesPage.jsp?page=0" class="btn home">Page 1</a>
            <a href="ViewEmployeesPage.jsp?page=3" class="btn home">Page 2</a>
            <a href="ViewEmployeesPage.jsp?page=6" class="btn home">Page 3</a>
        </div>
    </div>
</body>
</html>
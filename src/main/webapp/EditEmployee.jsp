<%@ page import="com.ems.dao.EmployeeDAO"%>
<%@ page import="com.ems.model.Employee"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
EmployeeDAO dao = new EmployeeDAO();
Employee emp = dao.getEmployeeById(id);
%>
<html>
<head>
    <title>Update Employee</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h2>Update Employee</h2>
        
        <form action="UpdateEmployee.jsp">
            <input type="hidden" name="id" value="<%=emp.getId()%>">
            
            <label>Name:</label>
            <input type="text" name="name" value="<%=emp.getName()%>" required>
            
            <label>Email:</label>
            <input type="text" name="email" value="<%=emp.getEmail()%>" required>
            
            <label>Department:</label>
            <input type="text" name="department" value="<%=emp.getDepartment()%>" required>
            
            <input type="submit" value="Update Employee">
        </form>

        <div class="button-container">
             <a href="ViewEmployees.jsp" class="btn home">Cancel</a>
        </div>
    </div>
</body>
</html>
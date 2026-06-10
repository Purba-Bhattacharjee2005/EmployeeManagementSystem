<%@ page import="java.util.*" %>
<%@ page import="com.ems.dao.EmployeeDAO" %>
<%@ page import="com.ems.model.Employee" %>

<html>
<head>
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
    background:#dbe4ef;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    width:100%;
    text-align:center;
}

.navbar{
    font-size:72px;
    font-weight:800;
    color:#1f3b68;
    margin-bottom:50px;
}

h1{
    font-size:70px;
    font-weight:800;
    color:#1f3b68;
    margin-bottom:40px;
}

h2{
    font-size:42px;
    color:#2d4059;
    margin-bottom:25px;
}

.user-box{
    font-size:22px;
    font-weight:600;
    color:#000;
    margin-bottom:60px;
}

.button-container{
    display:flex;
    justify-content:center;
    gap:40px;
    flex-wrap:wrap;
}

.btn{
    text-decoration:none;
    color:white;
    font-size:20px;
    font-weight:700;
    padding:18px 45px;
    border-radius:50px;
    transition:0.3s;
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
}

.btn:hover{
    transform:translateY(-5px);
    box-shadow:0 12px 25px rgba(0,0,0,0.25);
}

.home{
    background:linear-gradient(135deg,#42a5f5,#00c6ff);
}

.password{
    background:linear-gradient(135deg,#a18cd1,#fbc2eb);
}

.logout{
    background:linear-gradient(135deg,#ff758c,#ff7eb3);
}
</style>
<title>View Employees</title>
</head>

<body>


<br>

<h2>Employee List</h2>
<form action="SearchEmployee.jsp">
    Search Employee:
    <input type="text" name="keyword">

    <input type="submit" value="Search">
</form>

<table border="1">

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Department</th>
<th>Update</th>
<th>Delete</th>
</tr>

<%

EmployeeDAO dao =
        new EmployeeDAO();

List<Employee> list =
        dao.getAllEmployees();

for(Employee e : list)
{

%>

<tr>

<td><%= e.getId() %></td>
<td><%= e.getName() %></td>
<td><%= e.getEmail() %></td>
<td><%= e.getDepartment() %></td>

<td>
<a href="EditEmployee.jsp?id=<%=e.getId()%>">
Update
</a>
</td>

<td>
<a href="DeleteEmployee.jsp?id=<%= e.getId() %>"
onclick="return confirm('Are you sure?')">
Delete
</a>
</td>
</tr>

<%

}

%>

</table>

</body>
</html>
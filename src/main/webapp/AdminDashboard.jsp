<%@ page import="java.sql.*" %>
<%@ page import="com.ems.DBConnection" %>
<%
/*
String role =
(String)session.getAttribute("role");

if(role==null || !role.equals("ADMIN"))
{
    response.sendRedirect("login.jsp");
}
*/%>


<html>

<head>
<title>Employee Management System</title>

<style>
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

</head>
<div class="container">
<body>
<%
Connection con = DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(
"select count(*) from employee"
);

ResultSet rs =
ps.executeQuery();

int totalEmployees = 0;

if(rs.next())
{
    totalEmployees = rs.getInt(1);
}
%>

    <div class="navbar">
        Employee Management System
    </div>

    <h1>Admin Dashboard</h1>
    
<h3>Welcome Admin</h3>
    <div class="user-box">
        Logged in as:
        <strong>Welcome<%= session.getAttribute("user") %></strong>
    </div>



<h3>
Total Employees: <%= totalEmployees %>
</h3>

<h3>Department Statistics</h3>

<table border="1">
<tr>
    <th>Department</th>
    <th>Total Employees</th>
</tr>

<%
PreparedStatement psDept =
con.prepareStatement(
"select department, count(*) from employee group by department"
);

ResultSet rsDept =
psDept.executeQuery();

while(rsDept.next())
{
%>

<tr>
    <td><%= rsDept.getString(1) %></td>
    <td><%= rsDept.getInt(2) %></td>
</tr>

<%
}
%>

</table>
<div class="button-container">

    <a href="AdminDashboard.jsp" class="btn home">
        Home
    </a>

    <a href="AddEmployee.jsp" class="btn home">
        Add Employee
    </a>

    <a href="ViewEmployees.jsp" class="btn password">
        View Employees
    </a>

    <a href="ChangePassword.jsp" class="btn password">
        Change Password
    </a>

    <a href="Logout.jsp" class="btn logout">
        Logout
    </a>

</div>

</body>
</html>
<%@ page import="com.ems.dao.EmployeeDAO"%>
<%@ page import="com.ems.model.Employee"%>

<%

int id =
Integer.parseInt(
request.getParameter("id"));

EmployeeDAO dao =
new EmployeeDAO();

Employee emp =
dao.getEmployeeById(id);

%>

<html><head>
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
</style></head>
<body>

<h2>Update Employee</h2>

<form action="UpdateEmployee.jsp">

<input type="hidden"
name="id"
value="<%=emp.getId()%>">

Name:

<input type="text"
name="name"
value="<%=emp.getName()%>">

<br><br>

Email:

<input type="text"
name="email"
value="<%=emp.getEmail()%>">

<br><br>

Department:

<input type="text"
name="department"
value="<%=emp.getDepartment()%>">

<br><br>

<input type="submit"
value="Update Employee">

</form>

</body>
</html>
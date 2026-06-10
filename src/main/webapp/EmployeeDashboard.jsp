<%
String role =
(String)session.getAttribute("role");

if(role==null)
{
    response.sendRedirect("login.jsp");
}
%>
<html>
<head><style>
body{
    margin:0;
    font-family:'Segoe UI',sans-serif;
    background:#eaf2fb;
    text-align:center;
}

.dashboard{
    width:80%;
    margin:50px auto;
}
    margin:0;
    font-family:'Segoe UI',sans-serif;
    background:linear-gradient(135deg,#e3f2fd,#f5f7fa);
    min-height:100vh;
}

.container{
    width:85%;
    margin:auto;
    padding:30px;
}

h1{
    color:#1e3a5f;
    font-size:60px;
    margin-bottom:30px;
}

h2{
    font-size:35px;
    color:#2c3e50;
}

p{
    font-size:25px;
}

.dashboard-card{
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,0.15);
    margin-bottom:25px;
}

.stats{
    font-size:24px;
    font-weight:bold;
    color:#1565c0;
}

table{
    width:60%;
    border-collapse:collapse;
    background:white;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

table th{
    background:linear-gradient(90deg,#2196f3,#1565c0);
    color:white;
    padding:12px;
}

table td{
    padding:10px;
}

table tr:nth-child(even){
    background:#f5f5f5;
}

table tr:hover{
    background:#e3f2fd;
}

.btn{
    display:inline-block;
    padding:15px 35px;
    margin:15px;
    border-radius:50px;   /* Makes ellipse shape */
    text-decoration:none;
    color:white;
    font-size:18px;
    font-weight:bold;
    transition:0.3s;
    box-shadow:0 4px 10px rgba(0,0,0,0.2);
}

.home{
    background:linear-gradient(135deg,#4facfe,#00c6fb);
}

.password{
    background:linear-gradient(135deg,#a18cd1,#fbc2eb);
}

.logout{
    background:linear-gradient(135deg,#ff758c,#ff7eb3);
}

.btn:hover{
    transform:translateY(-3px);
    box-shadow:0 8px 15px rgba(0,0,0,0.3);
}

.btn-add{
    background:linear-gradient(90deg,#43a047,#2e7d32);
}

.btn-view{
    background:linear-gradient(90deg,#1e88e5,#1565c0);
}

.btn-password{
    background:linear-gradient(90deg,#8e24aa,#6a1b9a);
}

.btn-logout{
    background:linear-gradient(90deg,#e53935,#c62828);
}

.btn:hover{
    transform:translateY(-3px);
    box-shadow:0 5px 15px rgba(0,0,0,0.2);
}

.footer{
    text-align:center;
    margin-top:40px;
    color:#555;
}
.button-container{
    margin-top:50px;
}
.navbar{
    text-align:center;
    font-size:32px;
    font-weight:700;
    color:#1e3a5f;
    margin-bottom:40px;
}

</style></head>

<body>

<div class="navbar">
   <h1>Employee Management System</h1>
</div>

<div class="container">

    <div class="card">

        <h1>Employee Dashboard</h1>

        <h2>Welcome Employee</h2>

       <h3><div class="user">
            Welcome <%= session.getAttribute("user") %>
        </div></h3>

        <div class="button-container">

            <a href="EmployeeDashboard.jsp" class="btn home">
                Home
            </a>

            <a href="ChangePassword.jsp" class="btn password">
                Change Password
            </a>

            <a href="Logout.jsp" class="btn logout">
                Logout
            </a>

        </div>

    </div>

</div>

</body>
</html>
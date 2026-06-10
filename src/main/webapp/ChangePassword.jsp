<%@ page import="java.sql.*" %>
<%@ page import="com.ems.DBConnection" %>
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
<h2>Change Password</h2>

<form action="ChangePassword.jsp" method="post">

Current Password:
<input type="password" name="oldPassword">

<br><br>

New Password:
<input type="password" name="newPassword">

<br><br>

<input type="submit" value="Change Password">

</form>
<%
String username =
(String)session.getAttribute("user");
%>
<%
if(request.getParameter("oldPassword") != null)
{
String oldPassword =
request.getParameter("oldPassword");

String newPassword =
request.getParameter("newPassword");
Connection con =
DBConnection.getConnection();

String sql =
"select * from users where username=? and password=?";

PreparedStatement ps =
con.prepareStatement(sql);

ps.setString(1, username);
ps.setString(2, oldPassword);

ResultSet rs =
ps.executeQuery();
if(rs.next())
{PreparedStatement updatePs =
con.prepareStatement(
"update users set password=? where username=?"
);

updatePs.setString(1, newPassword);
updatePs.setString(2, username);

updatePs.executeUpdate();

out.println(
"<h3>Password Changed Successfully!</h3>"
);
}
else
{
out.println(
"<h3>Wrong Current Password!</h3>"
);
}
}
%>
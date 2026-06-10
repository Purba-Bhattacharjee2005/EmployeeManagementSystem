<%@ page import="java.sql.*" %>
<%@ page import="com.ems.DBConnection" %>
<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="navbar">Employee Management System</div>
        <h2>Change Password</h2>
        <form action="ChangePassword.jsp" method="post">
            <label>Current Password:</label>
            <input type="password" name="oldPassword" required>
            
            <label>New Password:</label>
            <input type="password" name="newPassword" required>
            
            <input type="submit" value="Change Password">
        </form>

        <div class="button-container">
             <a href="javascript:history.back()" class="btn home">Go Back</a>
        </div>

        <%
        String username = (String)session.getAttribute("user");
        if(request.getParameter("oldPassword") != null) {
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            
            Connection con = DBConnection.getConnection();
            String sql = "select * from users where username=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, oldPassword);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                PreparedStatement updatePs = con.prepareStatement("update users set password=? where username=?");
                updatePs.setString(1, newPassword);
                updatePs.setString(2, username);
                updatePs.executeUpdate();
                out.println("<h3>Password Changed Successfully!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Wrong Current Password!</h3>");
            }
        }
        %>
    </div>
</body>
</html>
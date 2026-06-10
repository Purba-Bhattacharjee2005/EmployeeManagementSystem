<%@ page import="com.ems.dao.UserDAO" %>
<%@ page import="com.ems.model.User" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

UserDAO dao = new UserDAO();

User user = dao.login(username,password);

if(user!=null)
{
    session.setAttribute(
        "user",
        user.getUsername()
    );

    session.setAttribute(
        "role",
        user.getRole()
    );

    if(user.getRole().equals("ADMIN"))
    {
        response.sendRedirect("AdminDashboard.jsp");
    }
    else
    {
        response.sendRedirect("EmployeeDashboard.jsp");
    }
}
else
{
    out.println("<h2>Invalid Username or Password</h2>");
}
%>
<%@ page import="java.sql.*" %>

<%
try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/employee_db",
        "root",
        "root@123"
    );

    out.println("<h2>Database Connected Successfully!</h2>");

    con.close();

} catch(Exception e) {
    out.println(e);
}
%>
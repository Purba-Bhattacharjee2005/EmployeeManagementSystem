<%@ page import="java.sql.*,com.ems.DBConnection" %>

<html>
<head>
<title>Database Test</title>
</head>
<body>

<%
try {

    Connection con = DBConnection.getConnection();

    if(con != null) {
        out.println("<h2>Database Connected Successfully!</h2>");
    } else {
        out.println("<h2>Connection Failed!</h2>");
    }

} catch(Exception e) {
    out.println(e);
}
%>

</body>
</html>
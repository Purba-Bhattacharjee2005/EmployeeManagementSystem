<%@ page import="com.ems.dao.EmployeeDAO" %>

<%

int id =
Integer.parseInt(
request.getParameter("id"));

EmployeeDAO dao =
new EmployeeDAO();

boolean status =
dao.deleteEmployee(id);

response.sendRedirect(
"ViewEmployees.jsp");

%>
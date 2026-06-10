<%@ page import="com.ems.dao.EmployeeDAO"%>
<%@ page import="com.ems.model.Employee"%>

<%

int id =
Integer.parseInt(
request.getParameter("id"));

String name =
request.getParameter("name");

String email =
request.getParameter("email");

String department =
request.getParameter("department");

Employee emp =
new Employee(id,name,email,department);

EmployeeDAO dao =
new EmployeeDAO();

dao.updateEmployee(emp);

response.sendRedirect(
"ViewEmployees.jsp");

%>
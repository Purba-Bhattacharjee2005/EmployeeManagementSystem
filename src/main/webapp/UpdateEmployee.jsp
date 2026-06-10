<%@ page import="com.ems.dao.EmployeeDAO"%>
<%@ page import="com.ems.model.Employee"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
String email = request.getParameter("email");
String department = request.getParameter("department");

Employee emp = new Employee(id, name, email, department);
EmployeeDAO dao = new EmployeeDAO();
dao.updateEmployee(emp);

// --- THIS IS THE NEW EMAIL TRIGGER ---
String subject = "Profile Update Notification";
String body = "Hello " + name + ",\n\nYour employee profile has been updated by an Administrator.\nNew Department: " + department;
com.ems.util.EmailUtil.sendEmail(email, subject, body);
// -------------------------------------

response.sendRedirect("ViewEmployees.jsp");
%>
package com.ems.dao;
import java.util.ArrayList;
import com.ems.util.EmailUtil;
import java.util.List;
import java.sql.Statement;
import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ems.DBConnection;
import com.ems.model.Employee;

public class EmployeeDAO {

    public boolean addEmployee(Employee emp) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "insert into employee(name,email,department) values(?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());

            int row = ps.executeUpdate();

            if(row > 0)
            {
                status = true;

                /*EmailUtil.sendEmail(
                        emp.getEmail(),
                        "Employee Record Created",
                        "Hello " + emp.getName()
                        + ", your employee record has been created successfully.");*/
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public List<Employee> getAllEmployees()
    {
        List<Employee> list =
                new ArrayList<Employee>();

        try
        {
            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "select * from employee";

            Statement st =
                    con.createStatement();

            ResultSet rs =
                    st.executeQuery(sql);

            while(rs.next())
            {
                Employee emp =
                        new Employee();

                emp.setId(rs.getInt("id"));
                emp.setName(rs.getString("name"));
                emp.setEmail(rs.getString("email"));
                emp.setDepartment(rs.getString("department"));

                list.add(emp);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return list;
    }
    public boolean deleteEmployee(int id)
    {
        boolean status = false;

        try
        {
            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "delete from employee where id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1,id);

            int row =
                    ps.executeUpdate();

            if(row > 0)
            {
                status = true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return status;
    }
    public boolean updateEmployee(Employee emp)
    {
        boolean status = false;

        try
        {
            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "update employee set name=?,email=?,department=? where id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());
            ps.setInt(4, emp.getId());

            int row = ps.executeUpdate();

            if(row > 0)
            {
                status = true;

                /*EmailUtil.sendEmail(
                        emp.getEmail(),
                        "Employee Record Updated",
                        "Hello " + emp.getName()
                        + ", your employee details have been updated.");*/
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return status;
    }
    public Employee getEmployeeById(int id)
    {
        Employee emp = null;

        try
        {
            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "select * from employee where id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1,id);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next())
            {
                emp = new Employee();

                emp.setId(rs.getInt("id"));
                emp.setName(rs.getString("name"));
                emp.setEmail(rs.getString("email"));
                emp.setDepartment(rs.getString("department"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return emp;
    }
    public List<Employee> getEmployeesByPage(int start,
            int total)
{
List<Employee> list =
new ArrayList<Employee>();

try
{
Connection con =
DBConnection.getConnection();

String sql =
"select * from employee limit ?,?";

PreparedStatement ps =
con.prepareStatement(sql);

ps.setInt(1,start);
ps.setInt(2,total);

ResultSet rs =
ps.executeQuery();

while(rs.next())
{
Employee emp =
new Employee();

emp.setId(
rs.getInt("id"));

emp.setName(
rs.getString("name"));

emp.setEmail(
rs.getString("email"));

emp.setDepartment(
rs.getString("department"));

list.add(emp);
}
}
catch(Exception e)
{
e.printStackTrace();
}

return list;
}
}
package com.ems.dao;

import java.sql.*;

import com.ems.DBConnection;
import com.ems.model.User;

public class UserDAO
{
    public User login(String username,
                      String password)
    {
        User user = null;

        try
        {
            Connection con =
                    DBConnection.getConnection();

            String sql =
            "select * from users where username=? and password=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next())
            {
                user = new User();

                user.setUsername(
                rs.getString("username"));

                user.setPassword(
                rs.getString("password"));

                user.setRole(
                rs.getString("role"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return user;
    }
}
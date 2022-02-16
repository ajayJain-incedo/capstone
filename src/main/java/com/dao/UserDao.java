package com.dao;
import com.model.User;

import java.sql.*;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // Method to insert the details of user to the db

    public boolean insertUser(User user){
        boolean isQueryExecuted = false;
        try{

            String query = "insert into user(first_name, last_name, email, pass, mobile, address, usertype) values(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getMobile());
            ps.setString(6, user.getAddress());
            ps.setString(7, String.valueOf(user.getUserType()));
            ps.executeUpdate();
            isQueryExecuted=true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return isQueryExecuted;
    }

    // Get user by email and password

    public User getUserByEmailAndPassword(String email, String password){
        User user = null;

        try{
            String query = "select * from users where email =? and pass =?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet result = ps.executeQuery();
            if(result.next()){
                user = new User();

                String firstName = result.getString("first_name"); // getting data from db
                user.setFirstName(firstName); // setting data to user object
                String lastName = result.getString("last_name");
                user.setLastName(lastName);
                user.setId(result.getInt("uid"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("pass"));
                user.setMobile(result.getString("mobile"));
                user.setUserType(result.getString("usertype").charAt(0));
                user.setAddress(result.getString("address"));
                user.setCreatedAt(result.getTimestamp("created_at"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
}

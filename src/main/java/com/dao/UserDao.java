package com.dao;
import com.model.User;
import com.mysql.cj.jdbc.exceptions.MysqlDataTruncation;

import java.sql.*;
import java.util.Base64;

public class UserDao {
    private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // Method to insert the details of user to the db
    public String insertUser(User user, String password2){
        if(!user.getPassword().equals(password2))
            return "passwordNotMatching";

        try{
            String query = "insert into users(first_name, last_name, email, pass, mobile, address) values(?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setLong(5, Long.parseLong(user.getMobile()));
            ps.setString(6, user.getAddress());
            ps.executeUpdate();

        }catch (NumberFormatException ne){
            return "wrongMobile";
        }
        catch (SQLIntegrityConstraintViolationException si){
            System.out.println(si.getMessage());
            return "emailDuplicate";
        }
        catch (MysqlDataTruncation e){
            System.out.println(e.getMessage());
            return "tooLong";
        }
        catch (Exception e){
            e.printStackTrace();
            return "exception";
        }
        return "allFine";
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
    public User getUserByEmail(String email){
        User user = null;
        try{
            String query = "select * from users where email =?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, email);
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
    public boolean updatePasswordByEmail(String email, String password){
        boolean test = false;
        Base64.Encoder encoder = Base64.getEncoder();
        password = encoder.encodeToString(password.getBytes());
        try{
            String query="update users set pass=? where email=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
            test=true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return test;
    }
    public String updateUserDetails(User user){
        try{
            String query= "update users set first_name =?, last_name =?, email =?, mobile =?, address =? where uid =?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getMobile());
            ps.setString(5, user.getAddress());
            ps.setInt(6, user.getId());
            ps.executeUpdate();
            return "success";
        }
        catch (SQLIntegrityConstraintViolationException e){
            System.out.println(e);
           return "emailAlreadyExist";
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return "error";
    }

    public boolean deleteUserById(String id){
        boolean isExecuted = false;
        try{
            String query ="delete from users where uid =?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
            isExecuted=true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return isExecuted;
    }

}

package com.service;
import com.mysql.jdbc.Driver;

import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            if(con == null){
                // loading driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Creating a connection


                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "3.1415926");


            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }
}

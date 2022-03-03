package com.service;
import com.mysql.jdbc.Driver;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import java.sql.*;
public class ConnectionProvider {
    static Logger log = Logger.getLogger(ConnectionProvider.class.getName());
    private static Connection con;
    public static Connection getConnection(){
        BasicConfigurator.configure();
        try{
            if(con == null){
                // loading driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Creating a connection

                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "root");

                log.info("Getting connection..");

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }
}

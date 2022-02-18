package com.servlets;

import com.dao.UserDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.model.User;
import com.service.ConnectionProvider;

public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        PrintWriter out = res.getWriter();
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");

        // creating user object and setting these fields to it.
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setAddress(address);
        user.setPassword(password1);
        user.setMobile(mobile);

        // creating a user dao object
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        if(dao.insertUser(user).equals("allFine")){
            out.println("done");
        }else if(dao.insertUser(user).equals("wrongMobile")){
            out.println("mobileError");
        }
        else{
            out.println("error");
        }
    }

}

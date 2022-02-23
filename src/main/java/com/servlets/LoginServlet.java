package com.servlets;
import com.dao.UserDao;
import com.model.User;
import com.service.ConnectionProvider;
import com.service.StoreUser;

import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;

public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        PrintWriter out = res.getWriter();
        String userEmail = req.getParameter("email");

        String userPassword = req.getParameter("password");
        Base64.Encoder encoder = Base64.getEncoder();
        userPassword = encoder.encodeToString(userPassword.getBytes());
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
        if(user == null){
            //login failed
            out.println("Invalid details, try again.");

        }
        else{
            // creating a cookie
            Cookie cookie = new Cookie("userType", String.valueOf(user.getUserType()));
            Cookie cookie1 = new Cookie("userEmail", user.getEmail());
            res.addCookie(cookie);
            res.addCookie(cookie1);
            // login success
            if(user.getUserType() == 'C'){
                StoreUser.storeUser(user);
            out.println("customer");
            }else{
                StoreUser.storeUser(user);
                out.println("admin");
            }

        }

    }
}

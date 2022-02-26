package com.servlets;

import com.dao.UserDao;
import com.model.User;
import com.service.ConnectionProvider;
import com.service.StoreUser;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UpdateUserInfo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");

        String address = req.getParameter("address");
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String mobile =req.getParameter("mobile");
        User user = new User();
        PrintWriter out= resp.getWriter();
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User newUser = dao.getUserByEmail(email);
        if(newUser!=null) {
            if (newUser.getEmail().equals(email) && newUser.getAddress().equals(address) && newUser.getFirstName().equals(firstName) && newUser.getLastName().equals(lastName) && newUser.getMobile().equals(mobile)) {
                out.println("noChange");
                return;
            }
        }
        User current_user = StoreUser.getUser();
        user.setId(current_user.getId());
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setAddress(address);

        String msg = dao.updateUserDetails(user);

        if(msg.equals("success")){

            Cookie[] cookies = req.getCookies();
            for(Cookie cookie: cookies){

                if(cookie.getName().equals("userEmail")){

                    cookie.setValue(email);
                    resp.addCookie(cookie);
                    User updatedUser = dao.getUserByEmail(email);
                    StoreUser.storeUser(updatedUser);
                }
            }

            out.println("updated successfully");
        }
        else if(msg.equals("emailAlreadyExist")){

            out.println("emailAlreadyExist");
        }
        else {

            out.println("error");
        }
    }
}

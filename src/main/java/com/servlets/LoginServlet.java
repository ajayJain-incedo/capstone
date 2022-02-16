package com.servlets;

import com.dao.UserDao;
import com.model.User;
import com.service.ConnectionProvider;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PrintWriter out = res.getWriter();
        String userEmail = req.getParameter("email");

        String userPassword = req.getParameter("password");

        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
        System.out.println(user.getEmail());
        System.out.println(user.getPassword());
        if(user == null){
            //login failed
            out.println("Invalid details, try again.");
        }
        else{
            // login success
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);
            if(user.getUserType() == 'C'){
            res.sendRedirect("views/demo.jsp");
            }else{
                res.sendRedirect("views/error_pages/error_page1.jsp");
            }
        }
    }
}

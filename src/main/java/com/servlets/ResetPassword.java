package com.servlets;

import com.dao.UserDao;
import com.service.ConnectionProvider;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class ResetPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pass1 = req.getParameter("password1");
        String pass2 = req.getParameter("password2");
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");
        PrintWriter out = resp.getWriter();
        if(pass1.equals(pass2)){

            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            if(dao.updatePasswordByEmail(email, pass1)){
            out.println("done");

            }else{
                out.println("sqlerror");
            }
        }else{

            out.println("wrong password");
        }
    }
}

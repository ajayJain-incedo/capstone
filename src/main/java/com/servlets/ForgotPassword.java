package com.servlets;

import com.dao.UserDao;
import com.model.User;
import com.service.ConnectionProvider;
import com.service.EmailUtility;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;


public class ForgotPassword extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        PrintWriter out = res.getWriter();
        String email = req.getParameter("email");
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User user=dao.getUserByEmail(email);
        if(user==null){
            out.println("invalid user");
            return;
        }
        Random random = new Random();
        int otp = random.nextInt(100000) +99999;

        EmailUtility eu = new EmailUtility();


        try {
            boolean tst = eu.sendMail(email, otp);
            if (tst){
                HttpSession session = req.getSession();
                session.setAttribute("otp", otp);
                session.setAttribute("email", email);
                out.println("done");

            }else {
                out.println("error");

            }
        } catch (Exception ex) {
            ex.printStackTrace();

        }


    }
}

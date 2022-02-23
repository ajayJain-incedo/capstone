package com.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class VerifyOtp extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();
        int otpInt = (int) session.getAttribute("otp");

        String otp = String.valueOf(otpInt);

        String userTypedOtp = req.getParameter("otp");


        if(userTypedOtp.equals(otp)){
            out.println("done");
        }else
        {
            out.println("wrong");
        }
    }
}

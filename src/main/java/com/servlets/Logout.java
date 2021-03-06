package com.servlets;


import com.service.ConnectionProvider;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



public class Logout extends HttpServlet {
    static Logger log = Logger.getLogger(ConnectionProvider.class.getName());
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BasicConfigurator.configure();

        Cookie[] cookies = request.getCookies();
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", -1);
        response.setHeader("Expires", "0");

        if(cookies!=null){
            for(Cookie cookie: cookies){
                cookie.setValue("");
                cookie.setPath("/Capstone");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

        }
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("/Capstone");
        log.info("Logged out");
    }
}

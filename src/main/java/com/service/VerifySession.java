package com.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VerifySession {
    public static boolean verifySession(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Cookie[] cookies = req.getCookies();
        if(cookies==null ||cookies.length == 1 || cookies.length == 0){
            resp.sendRedirect("/capstone");
            return true;
        }
        return false;
    }

    public static boolean verifySessionForAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Cookie[] cookies = req.getCookies();
        if(cookies!=null){
            if(cookies.length==1 || cookies.length==0){
                resp.sendRedirect("/capstone");
                return true;
            }
        for(Cookie c: cookies){
            if(c.getValue().charAt(0)=='C' || c.getValue().charAt(0)==0 ||c.getValue().charAt(0)==' '){
                resp.sendRedirect("/capstone");
                return true;
            }

        }
        }else {
            resp.sendRedirect("/capstone");
            return true;
        }
        return false;
    }
}

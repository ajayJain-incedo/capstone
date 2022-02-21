package com.servlets;

import com.model.User;
import com.service.StoreUser;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String pid = req.getParameter("pid");


        StoreUser store= new StoreUser();
        User user = store.getUser();
        out.println(user.getId());
//        req.setAttribute("list", products);
//        req.getRequestDispatcher("views/user/userHome.jsp").forward(req, resp);

    }
}

package com.servlets;

import com.dao.UserDao;
import com.service.ConnectionProvider;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class DeleteUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        PrintWriter out = resp.getWriter();
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        boolean isSuccess = dao.deleteUserById(id);
        if(isSuccess){
            out.println("success");
            resp.sendRedirect("Logout");
        }else {
            resp.sendRedirect("views/user/my_profile.jsp?msg=errorDeleteUser");
        }
    }
}

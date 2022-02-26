package com.servlets;

import com.dao.CartDao;
import com.model.Cart;
import com.model.User;
import com.service.ConnectionProvider;
import com.service.StoreUser;
import com.service.VerifySession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class RemoveFromCartServlet extends HttpServlet {

    Connection con = ConnectionProvider.getConnection();
    public final CartDao dao = new CartDao(con);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(VerifySession.verifySession(req, resp)){
            return;
        }
        int pid = Integer.parseInt(req.getParameter("pid"));
        StoreUser store= new StoreUser();
        User user = store.getUser();
        try {
            dao.Remove(user.getId(),pid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getHeader("referer"));
    }
}

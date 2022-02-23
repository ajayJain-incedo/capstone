package com.servlets;

import com.dao.CartDao;
import com.dao.ProductDao;
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
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;


public class AddToCartServlet extends HttpServlet {

    Connection con = ConnectionProvider.getConnection();
    public final CartDao dao = new CartDao(con);


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        if(VerifySession.verifySession(req, resp)){
            return;
        }
        int pid = Integer.parseInt(req.getParameter("pid"));
        Double price = Double.valueOf(req.getParameter("price"));


        StoreUser store= new StoreUser();
        User user = store.getUser();
        out.println(user.getId());
        Cart cart=new Cart(user.getId(), pid, price);
        try {
            dao.AddItem(cart);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("DisplayProduct");
//        req.setAttribute("list", products);
//        req.getRequestDispatcher("views/user/userHome.jsp").forward(req, resp);

    }
}

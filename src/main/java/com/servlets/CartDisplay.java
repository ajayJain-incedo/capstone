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
import java.sql.Connection;
import java.util.HashSet;

public class CartDisplay extends HttpServlet {

    Connection con = ConnectionProvider.getConnection();
    public CartDao dao = new CartDao(con);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StoreUser store = new StoreUser();
        User user = store.getUser();
        HashSet<Cart> cartItems = dao.getAllCartItemsById(user.getId());

    }
}

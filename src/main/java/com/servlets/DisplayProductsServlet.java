package com.servlets;

import com.dao.UserDao;
import com.model.Product;
import com.model.User;
import com.service.ConnectionProvider;
import com.service.SearchProducts;
import com.service.StoreUser;
import com.service.VerifySession;

import javax.mail.Store;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

public class DisplayProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if(VerifySession.verifySession(req, resp)){
                return;
            }
            Cookie[] cookies = req.getCookies();
            for(Cookie c: cookies){
                String name = c.getName();
                if(name.equals("userEmail")){
                    String email = c.getValue();
                    UserDao dao = new UserDao(ConnectionProvider.getConnection());
                    User user =dao.getUserByEmail(email);
                    StoreUser.storeUser(user);
                    break;
                }
            }
            SearchProducts search = new SearchProducts();

            HashSet<Product> products = search.searchAllProducts();
//            PrintWriter
//            out.println(products);

            req.setAttribute("list", products);
            req.getRequestDispatcher("views/user/userHome.jsp").forward(req, resp);
//            resp.sendRedirect("views/user/userHome.jsp");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}

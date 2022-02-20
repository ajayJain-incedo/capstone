package com.servlets;

import com.model.Product;
import com.service.SearchProducts;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

public class DisplayProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            SearchProducts search = new SearchProducts();

            ArrayList<Product> products = search.searchAllProducts();
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

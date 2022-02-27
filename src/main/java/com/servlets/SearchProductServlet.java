package com.servlets;
import com.model.Product;
import com.service.SearchProducts;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

public class SearchProductServlet extends HttpServlet
{
    SearchProducts search = new SearchProducts();
    HashSet<Product> products = new HashSet<>();
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String searchInput = req.getParameter("pname");

        try {
            products = search.searchProductsByInput(searchInput);
            req.setAttribute("list", products);

            req.getRequestDispatcher("views/user/userHome.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", products);
        req.getRequestDispatcher("views/user/userHome.jsp").forward(req, resp);
    }
}

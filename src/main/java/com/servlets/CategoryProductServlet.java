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

public class CategoryProductServlet extends HttpServlet {
    SearchProducts search = new SearchProducts();
    ArrayList<Product> products = new ArrayList<>();
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String category = req.getParameter("category");

        try {
            products = search.searchProductsByCategory(category);
            req.setAttribute("list", products);
            req.getRequestDispatcher("views/user/userHome.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

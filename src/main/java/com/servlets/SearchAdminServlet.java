package com.servlets;
import com.model.Product;
import com.service.SearchProducts;
import com.service.VerifySession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;

public class SearchAdminServlet extends HttpServlet
{

    SearchProducts search = new SearchProducts();
    HashSet<Product> products = new HashSet<>();
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(VerifySession.verifySessionForAdmin(req, resp)){
            return;
        }
        String searchInput = req.getParameter("pname");

        try {
            products = search.searchProductsByInput(searchInput);
            req.setAttribute("list", products);

            req.getRequestDispatcher("views/admin/search_item.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
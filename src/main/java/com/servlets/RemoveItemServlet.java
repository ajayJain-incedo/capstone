package com.servlets;

import com.dao.ProductDao;
import com.model.Product;
import com.service.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RemoveItemServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {

        Product product = new Product();
        String pname = req.getParameter("pname");
        product.setPname(pname);

        ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
        dao.RemoveItem(product);

        resp.sendRedirect("views/admin/update_item.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Product product = new Product();
        String pname = req.getParameter("pname");
        product.setPname(pname);

        ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
        dao.RemoveItem(product);

        resp.sendRedirect("views/admin/update_item.jsp");
    }
}

package com.servlets;

import com.model.Product;
import com.dao.ProductDao;
import com.service.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddItemServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Product product = new Product();

        String pname = req.getParameter("pname");
        product.setPname(pname);

        String pdesc = req.getParameter("pdesc");
        product.setPdesc(pdesc);

        double price = Double.parseDouble(req.getParameter("price"));
        product.setPrice(price);

        String category = req.getParameter("category");
        product.setCategory(category);

        double discount_percent = Double.parseDouble(req.getParameter("discount_percent"));
        product.setDiscount_percent(discount_percent);

        double available_quantity = Double.parseDouble(req.getParameter("available_quantity"));
        product.setAvailable_quantity(available_quantity);

        ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
        dao.AddItem(product);

        resp.sendRedirect("views/admin/add_item.jsp");
    }
}
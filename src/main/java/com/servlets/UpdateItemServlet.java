package com.servlets;

import com.dao.ProductDao;
import com.model.Product;
import com.service.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class UpdateItemServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Product product = new Product();
        int id = Integer.parseInt(req.getParameter("id"));
        product.setId(id);

        String pname=req.getParameter("pname");
        product.setPname(pname);

        String pdesc=req.getParameter("pdesc");
        product.setPdesc(pdesc);

        double price=Double.parseDouble(req.getParameter("price"));
        product.setPrice(price);

        String category=req.getParameter("category");
        product.setCategory(category);

        double discount_percent=Double.parseDouble(req.getParameter("discount_percent"));
        product.setDiscount_percent(discount_percent);

        double available_quantity = Double.parseDouble(req.getParameter("available_quantity"));
        product.setAvailable_quantity(available_quantity);

        ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
        dao.UpdateItem(product);

        resp.sendRedirect("views/admin/update_item.jsp");
    }
}

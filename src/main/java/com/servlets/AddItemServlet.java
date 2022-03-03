package com.servlets;

import com.model.Product;
import com.dao.ProductDao;
import com.service.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.mysql.jdbc.Driver;

@MultipartConfig
public class AddItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        Product product = new Product();

        String pname = req.getParameter("pname");
        product.setPname(pname);

        String pdesc = req.getParameter("pdesc");
        product.setPdesc(pdesc);

        double price = Double.parseDouble(req.getParameter("price"));
        product.setPrice(price);

        String category = req.getParameter("category");
        product.setCategory(category);

        double discount_percent = 0.0;//Double.parseDouble(req.getParameter("discount_percent"));
        product.setDiscount_percent(discount_percent);

        double available_quantity = Double.parseDouble(req.getParameter("available_quantity"));
        product.setAvailable_quantity(available_quantity);


        Part file = req.getPart("pimage");
        String imageFileName = file.getSubmittedFileName();     //get selected image file name


        System.out.println("Selected image FileName is: " + imageFileName);

        //upload path where we have to upload our actual image
        String uploadPath = "/resources/static/product_images/" + imageFileName;
        System.out.println("Upload Path is " + uploadPath);

        String absoluteDiskPath = getServletContext().getRealPath(uploadPath);

        //uploading our selected image into images folder (product_images)
        try {
            FileOutputStream fos = new FileOutputStream(absoluteDiskPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        product.setPimage(imageFileName);

        ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
        dao.AddItem(product);

        resp.sendRedirect("views/admin/add_item.jsp");
    }
}

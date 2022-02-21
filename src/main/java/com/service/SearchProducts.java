package com.service;

import com.model.Product;
import com.dao.ProductDao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchProducts {

    private final String query = "select * from product";
    Connection con = ConnectionProvider.getConnection();
    public ProductDao dao = new ProductDao(con);

    public SearchProducts(){}

    public ArrayList<Product> searchAllProducts() throws SQLException {
        return dao.getAllProduct(query);
    }

    public ArrayList<Product> searchProductsByCategory(String category) throws SQLException {
        String categoryQuery= query + " where product.category='" + category +"'";
        ArrayList<Product> products = dao.getAllProduct(categoryQuery);
        return products;
    }

    public ArrayList<Product> searchProductsByInput(String search) throws SQLException {
        String nameQuery = query + " where product.pname like '%" + search + "%'";
        ArrayList<Product> products = dao.getAllProduct(nameQuery);

        String descQuery = query + " where product.pdesc like '%" + search + "%'";
        products.addAll(dao.getAllProduct(descQuery));

        products.addAll(searchProductsByCategory(search));

        return products;
    }

}

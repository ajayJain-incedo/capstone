package com.service;

import com.model.Product;
import com.dao.ProductDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

public class SearchProducts {

    private final String query = "select * from product";
    Connection con = ConnectionProvider.getConnection();
    public ProductDao dao = new ProductDao(con);

    public SearchProducts(){}

    public HashSet<Product> searchAllProducts() throws SQLException {
        return dao.getAllProduct(query);
    }

    public HashSet<Product> searchProductsByCategory(String category) throws SQLException {
        String categoryQuery= query + " where product.category='" + category +"'";
        HashSet<Product> products = dao.getAllProduct(categoryQuery);
        return products;
    }

    public HashSet<Product> searchProductsByInput(String search) throws SQLException {
        String nameQuery = query + " where product.pname like '%" + search + "%'";
        HashSet<Product> products = dao.getAllProduct(nameQuery);

        String descQuery = query + " where product.pdesc like '%" + search + "%'";
        products.addAll(dao.getAllProduct(descQuery));

        products.addAll(searchProductsByCategory(search));

        return products;
    }

    public HashSet<Product> searchAllProductInCart(int uid) {
        String cartQuery = "select product.* from product p join (select * from cart_item where cart_item.uid=uid) c on p.pid=c.pid";
        HashSet<Product> cartProducts = dao.getAllProduct(cartQuery);
        return cartProducts;
    }


}

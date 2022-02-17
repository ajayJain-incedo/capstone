package com.dao;
import com.model.Product;

import java.sql.*;

public class ProductDao
{
    private Connection con;

    public ProductDao(Connection con)
    {
        this.con = con;
    }

    //Methods to add details of items in the DB
    public boolean AddItem(Product product)
    {
        boolean isQueryExecuted = false;
        try
        {
            String query = "insert into product( pname, pdesc, price, category, discount_percent, available_quantity) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setString(1, product.getPname());
            st.setString(2, product.getPdesc());
            st.setDouble(3, product.getPrice());
            st.setString(4, product.getCategory());
            st.setDouble(5, product.getDiscount_percent());
            st.setDouble(6, product.getAvailable_quantity());
            st.executeUpdate();
            isQueryExecuted=true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return isQueryExecuted;
    }
}

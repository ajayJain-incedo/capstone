package com.dao;
import com.model.Product;
import java.sql.*;
import java.util.HashSet;

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
            String query = "insert into product( pname, pdesc, price, category, discount_percent, available_quantity, pimage) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = this.con.prepareStatement(query);
//            System.out.println("Pimage i got is " + product.getPimage());
            st.setString(1, product.getPname());
            st.setString(2, product.getPdesc());
            st.setDouble(3, product.getPrice());
            st.setString(4, product.getCategory());
            st.setDouble(5, product.getDiscount_percent());
            st.setDouble(6, product.getAvailable_quantity());
            st.setString(7, product.getPimage());

            st.executeUpdate();
            isQueryExecuted=true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return isQueryExecuted;
    }

    //Method to remove item from the database
    public boolean RemoveItem(Product product)
    {
        boolean isQuery = false;
        try
        {

            String query = "delete from product where pname = ?";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setString(1,product.getPname());

            st.executeUpdate();
            //System.out.println("QUERY EXECUTED!!");

            isQuery=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return isQuery;
    }

    public boolean UpdateItem(Product product)
    {
        boolean isQuery = false;
        try
        {
            String query = "Update product set pname=?,pdesc=?,price=?,category=?,discount_percent=?,available_quantity=? where pid="+ product.getId();
            PreparedStatement st = this.con.prepareStatement(query);
            st.setString(1, product.getPname());
            st.setString(2, product.getPdesc());
            st.setDouble(3, product.getPrice());
            st.setString(4, product.getCategory());
            st.setDouble(5, product.getDiscount_percent());
            st.setDouble(6, product.getAvailable_quantity());
            //st.setString(7, product.getPimage());

            st.executeUpdate();
            isQuery=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return isQuery;
    }

    public Product getItem(String query){
        Product p =  new Product();
        try
        {
            PreparedStatement st = this.con.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            rs.next();
            p.setId(rs.getInt("pid"));
            p.setPname(rs.getString("pname"));
            p.setPdesc(rs.getString("pdesc"));
            p.setPrice(rs.getDouble("price"));
            p.setCategory(rs.getString("category"));
            p.setDiscount_percent(rs.getDouble("discount_percent"));
            p.setAvailable_quantity(rs.getDouble("available_quantity"));
            p.setPimage(rs.getString("pimage"));
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return p;
    }

    public HashSet<Product> getAllProduct(String query){

        HashSet<Product> products = new HashSet<>();
        try
        {
            PreparedStatement st = this.con.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setPdesc(rs.getString("pdesc"));
                p.setPrice(rs.getDouble("price"));
                p.setPname(rs.getString("pname"));
                p.setDiscount_percent(rs.getDouble("discount_percent"));
                p.setCategory(rs.getString("category"));
                p.setPimage(rs.getString("pimage"));
                p.setAvailable_quantity(rs.getInt("available_quantity"));
                products.add(p);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return products;
    }
}

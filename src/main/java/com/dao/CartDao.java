package com.dao;

import com.model.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;

public class CartDao {
    private Connection con;
    public CartDao(Connection con)
    {
        this.con = con;
    }

    public boolean AddItem(Cart cart) throws SQLException {
        boolean isQueryExecuted = false;
        try {
            String query = "insert into cart_item(user_id, product_id, quantity, amount, product_price) values(?, ?, ?, ?, ?)";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1, cart.getUid());
            st.setInt(2, cart.getPid());
            st.setInt(3, 1);
            st.setDouble(4, cart.getPrice());
            st.setDouble(5, cart.getPrice());
            st.executeUpdate();
            isQueryExecuted = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isQueryExecuted;
    }

    public boolean UpdateItemQuantity(Cart cart, int change) throws SQLException {
        boolean isQueryExecuted = false;
        try {
            String query = "update cart_item set quantity=? where user_id=? and product_id=?";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1, cart.getQuantity()+change);
            st.setInt(2, cart.getUid());
            st.setInt(3, cart.getPid());
            st.executeUpdate();
            isQueryExecuted = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isQueryExecuted;
    }

    public boolean Remove(int uid, int pid) throws SQLException {
        boolean isQueryExecuted = false;
        try {
            String query = "delete from cart_item where user_id=? and product_id=?";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1, uid);
            st.setInt(2, pid);
            st.executeUpdate();
            isQueryExecuted = true;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return isQueryExecuted;
    }

    public int IfExist(Cart cart) throws SQLException {
        int quantity=0;
        try {
            String query = "select * from cart_item where user_id=? and product_id=?";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1, cart.getUid());
            st.setInt(2, cart.getPid());
            ResultSet rs =st.executeQuery();
            if(rs.next()) {
                quantity= Integer.parseInt(rs.getString("quantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quantity;
    }

    public HashSet<Cart> getAllCartItemsById(int uid){
        HashSet<Cart> cartItem=new HashSet<>();
        try{
            String query ="select * from cart_item where user_id = '" + uid + "'";
            PreparedStatement st =con.prepareStatement(query);
            ResultSet rs =st.executeQuery();
            while(rs.next()){
                Cart cart = new Cart();
                cart.setPid(rs.getInt(1));
                cart.setUid(Integer.parseInt(rs.getString(2)));
                cart.setPrice(rs.getDouble(3));
                cart.setQuantity(Integer.parseInt(rs.getString(4)));
                cartItem.add(cart);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItem;

    }
}

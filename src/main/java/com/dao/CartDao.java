package com.dao;

import com.model.Cart;
import com.model.Product;

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
            String query = "insert into cart_item(user_id, product_id, quantity, amount) values(?, ?, ?, ?)";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1, cart.getUid());
            st.setInt(2, cart.getPid());
            st.setInt(3, cart.getQuantity());
            st.setDouble(4, cart.getPrice());
            st.executeUpdate();
            isQueryExecuted = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isQueryExecuted;
    }

    public HashSet<Cart> getAllCartItemsById(int uid){
        HashSet<Cart> cartItem=new HashSet<>();
        try{
            String query ="select * from cart_item where uid = '" + uid + "'";
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

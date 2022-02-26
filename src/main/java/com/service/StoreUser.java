package com.service;
import com.model.User;

public class StoreUser {
    static User user = new User();
    public static void storeUser(User userr){
        user.setMobile(userr.getMobile());
        user.setAddress(userr.getAddress());
        user.setPassword(userr.getPassword());
        user.setUserType(userr.getUserType());
        user.setEmail(userr.getEmail());
        user.setLastName(userr.getLastName());
        user.setFirstName(userr.getFirstName());
        user.setId(userr.getId());
        user.setCreatedAt(userr.getCreatedAt());
        user.setCartItem(userr.getCartItem());
    }
    public User getUser(){
        return this.user;
    }
}

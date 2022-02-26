package com.service;
import com.model.User;

public class StoreUser {
    static User currentUser = new User();
    public static void storeUser(User userr){

        currentUser.setMobile(userr.getMobile());
        currentUser.setAddress(userr.getAddress());
        currentUser.setPassword(userr.getPassword());
        currentUser.setUserType(userr.getUserType());
        currentUser.setEmail(userr.getEmail());
        currentUser.setLastName(userr.getLastName());
        currentUser.setFirstName(userr.getFirstName());
        currentUser.setId(userr.getId());
        currentUser.setCreatedAt(userr.getCreatedAt());
        currentUser.setCartItem(userr.getCartItem());

    }
    public static User getUser(){
        return currentUser;
    }
}

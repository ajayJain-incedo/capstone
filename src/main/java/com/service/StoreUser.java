package com.service;
import com.model.User;

public class StoreUser {
    static User currentUser = new User();
    public static void storeUser(User userr){

        User newUser=new User();
        newUser.setMobile(userr.getMobile());
        newUser.setAddress(userr.getAddress());
        newUser.setPassword(userr.getPassword());
        newUser.setUserType(userr.getUserType());
        newUser.setEmail(userr.getEmail());
        newUser.setLastName(userr.getLastName());
        newUser.setFirstName(userr.getFirstName());
        newUser.setId(userr.getId());
        newUser.setCreatedAt(userr.getCreatedAt());
        newUser.setCartItem(userr.getCartItem());
        currentUser =newUser;
    }
    public static User getUser(){
        return currentUser;
    }
}

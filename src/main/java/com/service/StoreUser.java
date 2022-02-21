package com.service;

import com.model.User;

public class StoreUser {
    User user = null;
    public void storeUser(User user){
        this.user=user;
    }
    public User getUser(){
        return this.user;
    }
}

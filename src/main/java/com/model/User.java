package com.model;

import java.sql.*;

public class User {
    // Data Members
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String mobile;
    private String address;
    private char userType;
    private Timestamp createdAt;
    private int cartItem;

    // Constructors
    public User() {
        this.cartItem=0;
    }

    public User(int id, String firstName, String last_name, String email, String password, String mobile, String address, char userType, Timestamp createdAt) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = last_name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.address = address;
        this.userType = userType;
        this.createdAt = createdAt;
        this.cartItem=0;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public char getUserType() {
        return userType;
    }

    public void setUserType(char userType) {
        this.userType = userType;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public int getCartItem() {
        return cartItem;
    }

    public void setCartItem(int cartItem) {
        this.cartItem = cartItem;
    }
    
}

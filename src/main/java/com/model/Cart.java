package com.model;

public class Cart {
    private int uid;
    private int pid;
    private int quantity;
    private double price;

    public Cart(){};

    public Cart(int uid, int pid, double price){
        this.uid=uid;
        this.pid=pid;
        this.quantity=1;
        this.price=price;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}

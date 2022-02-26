package com.model;

public class Order {
    private int user_id;
    private int order_id;
    private int product_id;
    private String product_name;
    private int product_quantity;
    private double pay_amount;

    public Order(){}
    public Order(int user_id, int order_id, int product_id, String product_name, int product_quantity, int pay_amount) {
        this.user_id = user_id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_quantity = product_quantity;
        this.pay_amount = pay_amount;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    @Override
    public String toString() {
        return "Order{" +
                "user_id=" + user_id +
                ", order_id=" + order_id +
                ", product_id=" + product_id +
                ", product_name='" + product_name + '\'' +
                ", product_quantity=" + product_quantity +
                ", pay_amount=" + pay_amount +
                '}';
    }

    public double getPay_amount() {
        return pay_amount;
    }

    public void setPay_amount(double pay_amount) {
        this.pay_amount = pay_amount;
    }
}

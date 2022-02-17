package com.model;

public class Product
{
    //Data Member
    private int id;
    private String pname;
    private String pdesc;
    private double price;
    private String category;
    private double discount_percent;
    private double available_quantity;

    public Product() {
    }

    public Product(int id, String pname, String pdesc, double price, String category, double discount_percent, double available_quantity)
    {
        this.id = id;
        this.pname = pname;
        this.pdesc = pdesc;
        this.price = price;
        this.category = category;
        this.discount_percent = discount_percent;
        this.available_quantity = available_quantity;
    }
    public Product(String pname, String pdesc, double price, String category, double discount_percent, double available_quantity)
    {
        this.pname = pname;
        this.pdesc = pdesc;
        this.price = price;
        this.category = category;
        this.discount_percent = discount_percent;
        this.available_quantity = available_quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getDiscount_percent() {
        return discount_percent;
    }

    public void setDiscount_percent(double discount_percent) {
        this.discount_percent = discount_percent;
    }

    public double getAvailable_quantity() {
        return available_quantity;
    }

    public void setAvailable_quantity(double available_quantity) {
        this.available_quantity = available_quantity;
    }
}

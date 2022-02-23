package com.model;

import java.util.Objects;

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
    private String pimage;

    public Product() {
    }

    public Product(int id, String pname, String pdesc, double price, String category, double discount_percent, double available_quantity, String pimage)
    {
        this.id = id;
        this.pname = pname;
        this.pdesc = pdesc;
        this.price = price;
        this.category = category;
        this.discount_percent = discount_percent;
        this.available_quantity = available_quantity;
        this.pimage = pimage;
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

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return id == product.id && Double.compare(product.price, price) == 0 && Double.compare(product.discount_percent, discount_percent) == 0 && Double.compare(product.available_quantity, available_quantity) == 0 && Objects.equals(pname, product.pname) && Objects.equals(pdesc, product.pdesc) && Objects.equals(category, product.category);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pname, pdesc, price, category, discount_percent, available_quantity);
    }
}

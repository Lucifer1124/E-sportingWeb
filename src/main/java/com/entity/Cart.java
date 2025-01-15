
package com.entity;

public class Cart {
  private int cart_id;
private int user_id;
private int item_id;
private String item_name;
private String brand_name;
private String photo;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
private int quantity;


    public Cart() {
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Cart(int cart_id, int user_id, int item_id, String item_name, String brand_name, String photo, int price, int total) {
        this.cart_id = cart_id;
        this.user_id = user_id;
        this.item_id = item_id;
        this.item_name = item_name;
        this.brand_name = brand_name;
        this.photo = photo;
        this.price = price;
        this.total = total;
    }
private int price;
private int total;

}

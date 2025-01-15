package com.entity;
public class Items{
    private int item_id;
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    private String price;
    private int total;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    private String category2;
    private int stock;

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCategory2() {
        return category2;
    }

    public void setCategory2(String category2) {
        this.category2 = category2;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Items( String price, String item_name, String category, String photo, String email, String brand,String category2,int stock,String description) {
        
        this.price = price;
        this.item_name = item_name;
        this.category = category;
        this.photo = photo;
        this.email = email;
        this.brand = brand;
        this.category2=category2;
        this.stock=stock;
        this.description=description;
    }

    public Items() {
        super();
    }

  

    

    @Override
    public String toString() {
        return "Items{" + "item_id=" + item_id + ", price=" + price + ", item_name=" + item_name + ", category=" + category + ", photo=" + photo + ", email=" + email + '}';
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    private String item_name;
    private String category;
    private String photo;
    private String email;
    private String brand;

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }
}
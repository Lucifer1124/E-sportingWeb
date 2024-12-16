package com.DAO;

import com.entity.CancelRequests;
import com.entity.Cart;
import com.entity.Comments;
import com.entity.Items;
import com.entity.item_order;
import com.user.servlet.CancelRequest;
import java.util.ArrayList;
import java.util.List;


public interface ItemDao {
    public boolean addItems(Items i);
    public List<Items> getAllItems();
    public List<Items> getNewItem();
    public List<Items> getTrendingItem();
    public List<Items> getAllLatestItem();
    public List<Items> getAllTrendingtem();
    public List<Items> getAllCricket();
    public List<Items> getAllFootball();
    public List<Items> getAllBasketBall();
    public List<Items> getAllTennis();
    public Items getItemDetails(int id);
    public boolean updateItem(Items i);
    public boolean deleteItem(int id);
    public boolean addItemsCart(Cart c);
    public List<Cart> getItembyUserId(int user_id);
     public boolean deleteItemCart(int id);
     public boolean deleteItemCart2(int id);
     public boolean addOrder(item_order o);
     public List<item_order> OrderDetailsById(int user_id);
     public item_order OrderById(int user_id);
     public  boolean stock(int user_id,int stock);
     public boolean SaveCartOrder(List<item_order> blist);
     public boolean addComment(Comments com);
     public List<Comments> getComments( int item_id);
      public List<item_order> AllOrderDetails();
      public boolean UpdateOrderStatus(int order_id,String status);
      public int checkCart(int user_id,int item_id);
      public boolean updateQuantity(int user_id,int quantity,int item_id,int total);
      public boolean deleteOrder(int item_id);
      public boolean cancelOrder(int order_id,int item_id,int quantity);
      public boolean setCancelRequest(int order_id);
      public List<CancelRequests> getCR(); 
      public boolean cancelreq(int order_id,int item_id,int stock);
      public List<Items> search(String ch);
      public item_order OrderByOrderId(int order_id);
      
     
   
    
}

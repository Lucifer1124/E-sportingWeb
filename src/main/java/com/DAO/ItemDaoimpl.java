
package com.DAO;

import com.entity.CancelRequests;
import com.entity.Cart;
import com.entity.Comments;
import com.entity.Items;
import com.entity.item_order;
import com.user.servlet.CancelRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ItemDaoimpl implements ItemDao {
    private Connection conn;
    public ItemDaoimpl(Connection conn){
        super();
        this.conn=conn;
    }
    @Override
    public boolean addItems(Items i){
        
        boolean f=false;
        try{
          String sql="insert item_details(item_name,price,category,photo,email,brand,category2,stock,description) values(?,?,?,?,?,?,?,?,?)";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1,i.getItem_name());
           ps.setString(2,i.getPrice());
           ps.setString(3,i.getCategory());
           ps.setString(4,i.getPhoto());
           ps.setString(5,i.getEmail());
           ps.setString(6,i.getBrand());
            ps.setString(7,i.getCategory2());
            ps.setInt(8,i.getStock());
             ps.setString(9,i.getDescription());
           
          
           int x=ps.executeUpdate();
           if(x==1)
           {
           f=true;
           }
        }catch(Exception e){
            
        }
        
        return f;
    }
    @Override
     public List<Items> getAllItems(){
         Items i=null;
         List<Items> list=new ArrayList<Items>();
         try{
             String sql="select*from item_details";
              PreparedStatement ps=conn.prepareStatement(sql);
              ResultSet rs= ps.executeQuery();
              while(rs.next())
              {
                  i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   i.setStock(rs.getInt(9));
                   i.setDescription(rs.getString(10));
                    
                   list.add(i);
                  
                  
                  
              }
             
         }catch(Exception e){
             
         }
         return list;
     }
     
     
    @Override
     public List<Items> getNewItem()
     {
         
         
         Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category2=?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "latest");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next()&& a<=4)
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
              
         
     }
     
     
     
    @Override
     public List<Items> getTrendingItem()
     {
         
         
         Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category2=?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "trending");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next()&& a<=4)
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
              
         
     }
     @Override
     public List<Items> getAllLatestItem()
     {
         
         
         Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category2=?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "latest");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next())
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
              
         
     }
     
    @Override
     public List<Items> getAllTrendingtem()
     {
         
         
         Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category2=?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "trending");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next())
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
              
         
     }
    @Override
     public List<Items> getAllCricket(){
          Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category=?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "cricket");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next())
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
     @Override
     public List<Items> getAllFootball(){
          Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category=?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "football");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next())
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
     @Override
     public List<Items> getAllTennis(){
          Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category=?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "tennis");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next())
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
     @Override
     public List<Items> getAllBasketBall(){
          Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category=?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "basketball");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next())
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
     public Items getItemDetails(int id)
     {
         
         Items i=null;
         try{
         String sql="select*from item_details where item_id=?";
                  PreparedStatement ps;
            ps = conn.prepareStatement(sql);
           ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   i.setStock(rs.getInt(9));
                   i.setDescription(rs.getString(10));
            }
                 
         
         
         }catch(Exception e){
             
         }
         return i;
         
     }
    @Override
     public boolean updateItem(Items i){
         boolean f=false;
         try{
         String sql="update item_details set item_name=?,price=?,category=?,brand=?,category2=?,stock=?,description=? where item_id=?";
         PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1,i.getItem_name());
            ps.setString(2,i.getPrice());
            ps.setString(3,i.getCategory());
            ps.setString(4,i.getBrand());
           ps.setString(5,i.getCategory2());
           ps.setInt(6,i.getStock());
           ps.setInt(8,i.getItem_id());
           ps.setString(7,i.getDescription());
            
            int x= ps.executeUpdate();
            if(x==1)
            {
                f=true;
            }
         
         
         
         
         }catch(Exception e){
         }
         
        return f; 
     }
    @Override
     public boolean deleteItem(int id)
     {
         
         boolean f=false;
         try{
         String sql="delete from item_details where item_id=?";
         PreparedStatement ps;
          ps = conn.prepareStatement(sql);
           
          ps.setInt(1,id);
            
            int x= ps.executeUpdate();
            if(x==1)
            {
                f=true;
            }
         
         
         
         
         }catch(Exception e){
         }
         
        return f; 
         
     } 
  @Override
  public boolean addItemsCart(Cart c){
      
         boolean f=false;
        try{
          String sql="insert cart(user_id,item_id,photo,item_name,brand_name,price,total,quantity) values(?,?,?,?,?,?,?,?)";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setInt(1,c.getUser_id());
           ps.setInt(2,c.getItem_id());
           ps.setString(3,c.getPhoto());
           ps.setString(4,c.getItem_name());
           ps.setString(5,c.getBrand_name());
           ps.setInt(6,c.getPrice());
           ps.setInt(7,c.getTotal());
           ps.setInt(8,c.getQuantity());
           
           
           
          
           int x=ps.executeUpdate();
           if(x==1)
           {
           f=true;
           }
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("gay");
        }
        
        return f;
      
  } 
    @Override
  public List<Cart> getItembyUserId(int user_id){
      
      
      Cart c = null;
      int totalPrice=0;
      List<Cart> list=new ArrayList<Cart>();
      try{
          String sql="select * from cart where user_id=?";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setInt(1, user_id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
               
               c=new Cart();
               c.setCart_id(rs.getInt(1));
               
               c.setUser_id(rs.getInt(2));
               c.setItem_id(rs.getInt(3));
               c.setPhoto(rs.getString(4));
               c.setItem_name(rs.getString(5));
               c.setBrand_name(rs.getString(6));
               c.setPrice(rs.getInt(7));
                totalPrice=totalPrice+rs.getInt(8);
                c.setTotal(totalPrice);
                c.setQuantity(rs.getInt(9));
                list.add(c);
                System.out.println("NIGGAS");
                System.out.println(list);
               
               
               
           }
          
      }catch(Exception e)
      {
          System.out.println("NIGGAS");
          e.printStackTrace();
      }
      
      
      return list;
  }
  @Override
     public boolean deleteItemCart(int id)
     {
         
         boolean f=false;
         try{
         String sql="delete from cart where cart_id=?";
         PreparedStatement ps;
          ps = conn.prepareStatement(sql);
           
          ps.setInt(1,id);
            
            int x= ps.executeUpdate();
            if(x==1)
            {
                f=true;
            }
         
         
         
         
         }catch(Exception e){
             
             
             System.out.println("DELETE");
             e.printStackTrace();
         }
         
        return f; 
         
     } 
    @Override
     public boolean deleteItemCart2(int id)
     {
         
         boolean f=false;
         try{
         String sql="delete from cart where item_id=?";
         PreparedStatement ps;
          ps = conn.prepareStatement(sql);
           
          ps.setInt(1,id);
            
            int x= ps.executeUpdate();
            if(x==1)
            {
                f=true;
            }
         
         
         
         
         }catch(Exception e){
             
             
             System.out.println("DELETE");
             e.printStackTrace();
         }
         
        return f; 
         
     } 
     
    @Override
     public boolean addOrder(item_order o)
     {
        boolean f=false;
        try{
          String sql="insert order_details(user_id,user_name,item_name,price,email,brand,address,pincode,city,item_id,quantity) values(?,?,?,?,?,?,?,?,?,?,?)";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setInt(1,o.getUser_id());
           ps.setString(2,o.getUser_name());
           ps.setString(3,o.getItem_name());
           ps.setInt(4,o.getPrice());
           ps.setString(5,o.getEmail());
           ps.setString(6,o.getBrand());
           ps.setString(7,o.getAdress());
           ps.setString(8,o.getPincode());
           ps.setString(9,o.getCity());
           
           ps.setInt(10, o.getItem_id());
           ps.setInt(11,o.getQuantity());
           
           
          
           int x=ps.executeUpdate();
           if(x==1)
           {
           f=true;
           }
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("gay");
        }
        
        return f;
     }
      public List<item_order> OrderDetailsById(int user_id)
      {
          item_order o= null;
      
      List<item_order> list=new ArrayList<item_order>();
      try{
          String sql="select * from order_details where user_id=?";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setInt(1, user_id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
               
              o=new item_order();
               o.setUser_id(rs.getInt(1));
               o.setOrder_id(rs.getInt(2));
               o.setUser_name(rs.getString(3));
               o.setItem_name(rs.getString(4));
               o.setPrice(rs.getInt(5));
               o.setEmail(rs.getString(6));
               o.setBrand(rs.getString(7));
               o.setAdress(rs.getString(8));
               o.setPincode(rs.getString(9));
               o.setCity(rs.getString(10));
               o.setPayment(rs.getString(11));
               o.setItem_id(rs.getInt(12));
               o.setQuantity(rs.getInt(13));
               o.setStatus(rs.getString(14));
               o.setLandmark(rs.getString(15));
               
                
                list.add(o);
                
               
               
               
           }
          
      }catch(Exception e)
      {
          System.out.println("NIGGAS");
          e.printStackTrace();
      }
      
      
      return list;
      }
       public item_order OrderById(int user_id){
           
           
            item_order o= null;
      
      
      try{
          String sql="select * from order_details where user_id=?";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setInt(1, user_id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
               
              o=new item_order();
               o.setUser_id(rs.getInt(1));
               o.setOrderid(rs.getInt(2));
               
               o.setUser_name(rs.getString(3));
               o.setItem_name(rs.getString(4));
               o.setPrice(rs.getInt(5));
               o.setEmail(rs.getString(6));
               o.setBrand(rs.getString(7));
               o.setAdress(rs.getString(8));
               o.setPincode(rs.getString(9));
               o.setCity(rs.getString(10));
               o.setPayment(rs.getString(11));
               o.setItem_id(rs.getInt(12));
               o.setQuantity(rs.getInt(13));
               o.setLandmark(rs.getString(14));
               
                
               
                
               
               
               
           }
          
      }catch(Exception e)
      {
          System.out.println("NIGGAS");
          e.printStackTrace();
      }
      
      
      return o;
           
       }
       public  boolean stock(int item_id,int stock)
       {
           boolean f= false;
           try{
              String sql="update item_details set stock=? where item_id=?";
              PreparedStatement ps=conn.prepareStatement(sql);
              ps.setInt(1,stock);
              ps.setInt(2,item_id);
              int x=ps.executeUpdate();
              if(x==1)
              {
                  f=true;
              }
              
           }catch(Exception e)
           {
               
           }
           return f;
       }
    @Override
         public boolean SaveCartOrder(List<item_order> blist)
         {    boolean f=false;
              String sql="insert order_details(user_id,user_name,item_name,price,email,brand,address,pincode,city,item_id,quantity) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn.setAutoCommit(false);
            PreparedStatement ps=conn.prepareStatement(sql);
            for(item_order o:blist)
            {
                System.out.println("GAY");
                System.out.println(o.getItem_name());
                System.out.println(blist);
            }
            for(item_order o:blist)
            {
                ps.setInt(1,o.getUser_id());
           ps.setString(2,o.getUser_name());
           ps.setString(3,o.getItem_name());
           ps.setInt(4,o.getPrice());
           ps.setString(5,o.getEmail());
           ps.setString(6,o.getBrand());
           ps.setString(7,o.getAdress());
           ps.setString(8,o.getPincode());
           ps.setString(9,o.getCity());
           
           ps.setInt(10, o.getItem_id());
           ps.setInt(11,o.getQuantity());
           ps.addBatch();
           
       
            }
             int[] count=ps.executeBatch();
           conn.commit();
           f=true;
           conn.setAutoCommit(true);
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
              return f;
              
         }
    @Override
        public boolean addComment(Comments com)
         { boolean f=false;
           String sql="insert comments(item_id,name,comment) values(?,?,?)";
            PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
             ps.setInt(1,com.getItem_id());
            ps.setString(2,com.getName());
            ps.setString(3,com.getComment());
            int i= ps.executeUpdate();
            if(i==1)
            {
                f=true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
           
            return f;
            
           
             
         }
        public List<Comments> getComments(int item_id)
        {
            String sql="select * from comments where item_id=?";
            Comments com=null;
             List<Comments> list=new ArrayList<Comments>();
        try {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1, item_id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
               com=new Comments();
               com.setItem_id(rs.getInt(1));
                com.setName(rs.getString(2));
                com.setComment(rs.getString(3));
                list.add(com);
               
           }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
            
            
        }
        public List<item_order> AllOrderDetails()
        {
            item_order o= null;
      
      List<item_order> list=new ArrayList<item_order>();
      try{
          String sql="select * from order_details";
           PreparedStatement ps=conn.prepareStatement(sql);
         
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
               
              o=new item_order();
               o.setUser_id(rs.getInt(1));
               o.setOrder_id(rs.getInt(2));
               
               o.setUser_name(rs.getString(3));
               o.setItem_name(rs.getString(4));
               o.setPrice(rs.getInt(5));
               o.setEmail(rs.getString(6));
               o.setBrand(rs.getString(7));
               o.setAdress(rs.getString(8));
               o.setPincode(rs.getString(9));
               o.setCity(rs.getString(10));
               o.setPayment(rs.getString(11));
               o.setItem_id(rs.getInt(12));
               o.setQuantity(rs.getInt(13));
               o.setStatus(rs.getString(14));
               
                
                list.add(o);
                
               
               
               
           }
          
      }catch(Exception e)
      {
          System.out.println("NIGGAS");
          e.printStackTrace();
      }
      
      
      return list;
        }
    @Override
        public boolean UpdateOrderStatus( int order_id,String status)
        {
            boolean f=false;
            try{
                String sql="update order_details set status=? where order_id=?";
                  PreparedStatement ps=conn.prepareStatement(sql);
             
              ps.setString(1,status);
              ps.setInt(2,order_id);
              int x=ps.executeUpdate();
              if(x==1)
              {
                  f=true;
              }
              
                
            }catch(Exception e)
            {
                
            }
            return f;
        }
    @Override
        public int checkCart(int user_id,int item_id)
        { boolean f=false;
        int quantity=0;
        try {
           
            String sql="select * from cart where user_id=? and item_id=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,user_id);
            ps.setInt(2,item_id);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                quantity=rs.getInt(9);
            }
            
           
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
         return quantity;
            
        }
        public boolean updateQuantity(int user_id,int quantity,int item_id,int total)
        {
            boolean f=false;
            try{
                String sql="update cart set quantity=? where user_id=? and item_id=?";
                  PreparedStatement ps=conn.prepareStatement(sql);
             
              ps.setInt(1, quantity);
              
              ps.setInt(2,user_id);
              ps.setInt(3,item_id);
              int x=ps.executeUpdate();
              String sql2="update cart set total=? where user_id=? and item_id=?";
                  PreparedStatement pss=conn.prepareStatement(sql2);
             
              pss.setInt(1, total);
              
              pss.setInt(2,user_id);
              pss.setInt(3,item_id);
              int y=pss.executeUpdate();
              if(x==1||y==1)
              {
                  f=true;
              }
              
                
            }catch(Exception e)
            {
                e.printStackTrace();
            }
            return f;
        }
         public boolean deleteOrder(int item_id)
         {
             
             
             boolean f=false;
             
             try{
                String sql="delete from order_details where item_id=?";
                PreparedStatement pss=conn.prepareStatement(sql);
                pss.setInt(1, item_id);
                int x= pss.executeUpdate();
            if(x==1)
            {
                f=true;
            }
                
             }catch(Exception e)
             {
                 e.printStackTrace();
             }
             return f;
             }
         
               public boolean cancelOrder(int order_id,int item_id,int quantity)
{
          boolean f=false;
          String sql="delete from order_details where order_id=?";
          String sql2="update item_details set stock=? where item_id=?";
         try{
    
    PreparedStatement ps=conn.prepareStatement(sql2);
    ps.setInt(1,quantity);
    ps.setInt(2,item_id);
    int y=ps.executeUpdate();
            PreparedStatement pss=conn.prepareStatement(sql);
    pss.setInt(1, order_id);
    int x=pss.executeUpdate();
    if(x==1)
    {
        f=true;
    }
   
            }catch(Exception e)
{

}
return f;
} 
      public boolean setCancelRequest(int order_id)
      {   
          
           boolean f=false;
          String sql="insert cancel_requests(order_id) values(?)";
           try{
    PreparedStatement ps=conn.prepareStatement(sql);
      ps.setInt(1, order_id);
     
   
    int x=ps.executeUpdate();
    if(x==1)
    {
        f=true;
    }
   
            }catch(Exception e)
{

}
return f;
          
      }
      
      
      
    @Override
       public List<CancelRequests> getCR()
       {
           CancelRequests cr=null;
           List<CancelRequests> list=new ArrayList<CancelRequests>();
           try{
               String sql="select*from cancel_requests";
               PreparedStatement ps;
                ps = conn.prepareStatement(sql);
                ResultSet rs= ps.executeQuery();
                while(rs.next())
                {
                    cr=new CancelRequests();
                    cr.setOrder_id(rs.getInt(1));
                    list.add(cr);
                    
                }
               
           }catch(Exception e)
           {
               
           }
           return list;
       }
       public boolean cancelreq(int order_id,int item_id,int stock)
       {
           boolean f=false;
           
           String sql3="update item_details set stock=? where item_id=?";
        try {
            String sql2="update order_details set status=? where order_id=?";
             PreparedStatement ss;
              ss = conn.prepareStatement(sql2);
              ss.setString(1,"Cancelled");
              ss.setInt(2,order_id);
              int y=ss.executeUpdate();
               PreparedStatement s;
              s = conn.prepareStatement(sql3);
              s.setInt(1, stock);
              s.setInt(2, item_id);
              int z=s.executeUpdate();
              String sql="delete from cancel_requests where order_id=?";
           PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, order_id);
            int x=ps.executeUpdate();
            if(x==1)
            {
                f=true;
            }
            
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
           return f;
       }
        public List<Items> search(String ch)
        {
             Items i=null;
         List<Items> list=new ArrayList<Items>();
         
        try {
            String sql="select*from  item_details where category like? or item_name like? or brand like? or category2 like?";
          PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+ch+"%");
            ps.setString(2, "%"+ch+"%");
            ps.setString(3, "%"+ch+"%");
            ps.setString(4, "%"+ch+"%");
            
            ResultSet rs= ps.executeQuery();
            int a=1;
            while(rs.next())
            {
                i=new Items();
                   i.setItem_id(rs.getInt(1));
                   i.setItem_name(rs.getString(2));
                   i.setPrice(rs.getString(3));
                   i.setCategory(rs.getString(4));
                   i.setPhoto(rs.getString(5));
                   i.setEmail(rs.getString(6));
                   i.setBrand(rs.getString(7));
                   i.setCategory2(rs.getString(8));
                   a++;
                    
                   list.add(i);
                   System.out.println(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
        }
         public item_order OrderByOrderId(int order_id)
         {
              item_order o= null;
      
      
      try{
          String sql="select * from order_details where order_id=?";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setInt(1,order_id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
               
              o=new item_order();
               o.setUser_id(rs.getInt(1));
               o.setOrderid(rs.getInt(2));
               
               o.setUser_name(rs.getString(3));
               o.setItem_name(rs.getString(4));
               o.setPrice(rs.getInt(5));
               o.setEmail(rs.getString(6));
               o.setBrand(rs.getString(7));
               o.setAdress(rs.getString(8));
               o.setPincode(rs.getString(9));
               o.setCity(rs.getString(10));
               o.setPayment(rs.getString(11));
               o.setItem_id(rs.getInt(12));
               o.setQuantity(rs.getInt(13));
               
               
                
               
                
               
               
               
           }
          
      }catch(Exception e)
      {
          
          e.printStackTrace();
      }
      
      
      return o;
         }
         }

        
    


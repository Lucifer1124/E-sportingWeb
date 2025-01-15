package com.user.servlet;



import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import com.entity.Items;
import com.entity.item_order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/PlaceOrder"})
public class placeOrder extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String user_name=request.getParameter("user_name");
          
           
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
            String payment=request.getParameter("payment");
            
            String p=request.getParameter("price");
            int price=Integer.parseInt(p);
            String y=request.getParameter("user_id");
             String z=request.getParameter("item_id");
             String item_name=request.getParameter("item_name");
             String brand=request.getParameter("brand");
             int user_id=Integer.parseInt(y);
             int item_id=Integer.parseInt(z);
              String q=request.getParameter("quantity");
               ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                     item_order o=new item_order();
                     Items i=dao.getItemDetails(item_id);
            int quantity=Integer.parseInt(request.getParameter("quantity"));
            int price2=price*quantity; o.setUser_id(user_id);
                    o.setUser_name(user_name);
                   o.setItem_name(item_name);
                   o.setPrice(price2);
                   o.setEmail(email);
               
                   o.setBrand(brand);
                   o.setAdress(address);
                   o.setPincode(pincode);
                   o.setCity(city);
                   o.setPayment(payment);
                   o.setItem_id(item_id);
                   o.setQuantity(quantity);
                   try{
                       boolean f=dao.addOrder(o);
                        int w=i.getStock()-quantity;
                        boolean d=dao.stock(item_id,w);
                   }catch(Exception e)
                   {
                       
                   }
            
    }

  

}

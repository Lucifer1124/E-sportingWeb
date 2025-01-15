
package com.user.servlet;

import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Items;
import com.entity.item_order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "orderCart", urlPatterns = {"/orderCart"})
public class orderCart extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        String y=request.getParameter("user_id");
        int user_id=Integer.parseInt(y);
       String user_name=request.getParameter("user_name");
          
            String landmark=request.getParameter("landmark");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
            String payment=request.getParameter("payment");
             
                     ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                    List<Cart> blist= dao.getItembyUserId(user_id);
                    item_order o;
                    ArrayList<item_order> orderList = new ArrayList<item_order>();
                    for(Cart c:blist)
                    {  o=new item_order();
                        o.setUser_id(user_id);
                    o.setUser_name(user_name);
                   o.setItem_name(c.getItem_name());
                   o.setPrice(c.getPrice()*c.getQuantity());
                   o.setEmail(email);
                   o.setBrand(c.getBrand_name());
                   o.setAdress(address);
                   o.setPincode(pincode);
                   o.setCity(city);
                   o.setPayment(payment);
                   o.setItem_id(c.getItem_id());
                   o.setQuantity(c.getQuantity());
                   Items i=dao.getItemDetails(c.getItem_id());
                   if(i.getStock()>=c.getQuantity())
                   {
                       orderList.add(o);
                       boolean b=dao.stock(c.getItem_id(),i.getStock()-c.getQuantity());
                   }
                   
                  
                    }
                     boolean f= dao.SaveCartOrder(orderList);
       
        response.sendRedirect("index.jsp");
                    
                
                    
    }

   

}

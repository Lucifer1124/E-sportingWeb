
package com.user.servlet;

import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Items;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "cartservlet", urlPatterns = {"/cartservlet"})
public class cartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String uid=request.getParameter("user_id");
            String iid=request.getParameter("item_id");
            int item_id=Integer.parseInt(iid);
            int user_id=Integer.parseInt(uid);
            
            ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
            Items i=dao.getItemDetails(item_id);
            String pri=i.getPrice();
            int price=Integer.parseInt(pri);
           
            boolean f=false;
            HttpSession session=request.getSession();
            int g=0;
            
            g=dao.checkCart(user_id, item_id);
            System.out.println(g+"NIEGEGEGEEGEGEGEGEGE");
            if(g!=0){
                int x=g+1;
                f=dao.updateQuantity(user_id,x, item_id,price*x);
            }else{
                Cart c= new Cart();
            c.setItem_id(item_id);
            c.setUser_id(user_id);
            c.setBrand_name(i.getBrand());
            c.setPhoto(i.getPhoto());
            c.setItem_name(i.getItem_name());
           
            c.setPrice(price);
                 c.setQuantity(1);
                c.setTotal(price);
                 f=dao.addItemsCart(c);
            }
            
            
            if(f)
            {
                session.setAttribute("addCart","Added to cart successfully");
                response.sendRedirect("index.jsp");
            }else{
            session.setAttribute("addCart","Failed to add");
            response.sendRedirect("index.jsp");
            
            }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

  
}

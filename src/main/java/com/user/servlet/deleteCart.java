
package com.user.servlet;

import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "deleteCart", urlPatterns = {"/deleteCart"})
public class deleteCart extends HttpServlet {

  
   @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
       try{    
        
       
           
           
           String s=req.getParameter("id");
           int id=Integer.parseInt(s);
            ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
             boolean f=dao.deleteItemCart(id);
             
             HttpSession session=req.getSession();
             if(f){
                 session.setAttribute("sucmsg","deleted successfully");
                 
                 res.sendRedirect("showCart.jsp");
             }else{
             
             session.setAttribute("failmsg", "Update failed");
             res.sendRedirect("showCart.jsp");
             }
             System.out.println("GAAAAAYYYYY");
             
             
             
             
             
            
       
       
       
       
       }catch(Exception e){
       e.printStackTrace();
        System.out.println("GAAAAAYYYYY");
        res.sendRedirect("admin/allitems.jsp");
         
       
       } 
    }
    

   
   
}

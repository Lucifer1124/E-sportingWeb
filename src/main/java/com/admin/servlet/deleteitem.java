package com.admin.servlet;

import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import com.entity.Items;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteitem")
public class deleteitem extends HttpServlet{
    

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
       try{    
        
       
           
           
           String s=req.getParameter("id");
           int id=Integer.parseInt(s);
            ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
             boolean f=dao.deleteItem(id);
             boolean d=dao.deleteItemCart2(id);
             boolean c=dao.deleteOrder(id);
             HttpSession session=req.getSession();
             if(f){
                 session.setAttribute("sucmsg", "Updated successfully");
                 
                 res.sendRedirect("admin/allitems.jsp");
             }else{
             
             session.setAttribute("failmsg", "Update failed");
             res.sendRedirect("admin/allitems.jsp");
             }
             System.out.println("GAAAAAYYYYY");
             
             
             
             
             
            
       
       
       
       
       }catch(Exception e){
       e.printStackTrace();
        System.out.println("GAAAAAYYYYY");
        res.sendRedirect("admin/allitems.jsp");
         
       
       } 
    }
    
}
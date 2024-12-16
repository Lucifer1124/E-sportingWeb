
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

@WebServlet("/edititem")
public class edititem extends HttpServlet{
    

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
       try{    
        
        
        String item_name=req.getParameter("item_name");
            String brand=req.getParameter("brand");
            String category=req.getParameter("category");
            String category2=req.getParameter("category2");
            String price=req.getParameter("price");
            String description=req.getParameter("description");
            String xstock=req.getParameter("stock");
            int stock=Integer.parseInt(xstock);
            Items i=new Items();
            i.setItem_id(Integer.parseInt(req.getParameter("item_id")));
            i.setItem_name(item_name);
            i.setCategory(category);
            i.setBrand(brand);
            i.setCategory2(category2);
            i.setPrice(price);
            i.setDescription(description);
            i.setStock(stock);
            ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
             boolean f=dao.updateItem(i);
             HttpSession session=req.getSession();
             if(f){
                
                 
                 res.sendRedirect("admin/allitems.jsp");
             }else{
             
             
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

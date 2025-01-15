
package com.admin.servlet;

import com.DAO.ItemDao;
import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import com.entity.Items;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
@WebServlet("/add_item")
@MultipartConfig
public class ItemAddServlet extends HttpServlet {

  
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try{
            String item_name=req.getParameter("item_name");
            String brand=req.getParameter("brand");
            String photo=req.getParameter("photo");
            String category=req.getParameter("category");
            String category2=req.getParameter("category2");
            String price=req.getParameter("price");
            String stock1=req.getParameter("stock");
            int stock=Integer.parseInt(stock1);
            String description=req.getParameter("description");
            Part part=req.getPart("photo");
            String filename= part.getSubmittedFileName();
            
           Items i=new Items(price,item_name,category,filename,"admin",brand,category2,stock,description);
           
            ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
            String path ="C:\\Users\\user\\OneDrive\\Documents\\NetBeansProjects\\E-SPORTS\\target\\E-SPORTS-1.0-SNAPSHOT\\item-img";
                    
                    
            
            boolean f=dao.addItems(i);
            HttpSession session = req.getSession();
       
       
            if(f){
                  File file=new File(path);
                    part.write(path+File.separator+filename);
              session.setAttribute("succ", "Items Added Successfully");
              res.sendRedirect("admin/addbooks.jsp");
            }else{
                session.setAttribute("faill", "Items Not Added");
                res.sendRedirect("admin/addbooks.jsp");
            }
           
        }catch(Exception e)
        {
        }
    }

}


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

@WebServlet(name = "deleteorder", urlPatterns = {"/deleteorder"})
public class deleteorder extends HttpServlet {

   
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String order=request.getParameter("id");
        String id=request.getParameter("item_id");
        String q=request.getParameter("q");
        String st=request.getParameter("stock");
        ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
        int order_id=Integer.parseInt(order);
        int item_id=Integer.parseInt(id);
        int quantity =Integer.parseInt(q);
        int stock =Integer.parseInt(st);
        boolean f=dao.cancelOrder(order_id,item_id,quantity+stock);
        if(f)
        {
            response.sendRedirect("index.jsp");
        }
            
    }

    
   

}

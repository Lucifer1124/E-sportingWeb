
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

@WebServlet(name = "CancelRequest", urlPatterns = {"/CancelRequest"})
public class CancelRequest extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String id=request.getParameter("id");
       int order_id=Integer.parseInt(id);
       String uid=request.getParameter("uid");
       int user_id=Integer.parseInt(uid);
       
        ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
        boolean f=dao.setCancelRequest(order_id);
        response.sendRedirect("MyOrders.jsp?id="+user_id);
    }

    
}

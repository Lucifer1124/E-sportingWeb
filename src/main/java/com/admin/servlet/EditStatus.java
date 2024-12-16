
package com.admin.servlet;

import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "EditStatus", urlPatterns = {"/EditStatus"})
public class EditStatus extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String order=request.getParameter("id");
       String status=request.getParameter("status");
       int order_id=Integer.parseInt(order);
      System.out.println(status);
       ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
       boolean f= dao.UpdateOrderStatus(order_id, status);
       if(f==true)
       {
           response.sendRedirect("admin/AllOrders.jsp");
       }
        
    }


}

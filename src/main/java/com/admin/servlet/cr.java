
package com.admin.servlet;

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


@WebServlet(name = "cr", urlPatterns = {"/cr"})
public class cr extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int order_id=Integer.parseInt(request.getParameter("id"));
        ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
        item_order o=dao.OrderByOrderId(order_id);
        Items i=dao.getItemDetails(o.getItem_id());
        int updatedquantity=o.getQuantity()+i.getStock();
        boolean f=dao.cancelreq(order_id,o.getItem_id(),updatedquantity);
        if(f)
        {
            response.sendRedirect("admin/CancelRequests.jsp");
        }
    }

}

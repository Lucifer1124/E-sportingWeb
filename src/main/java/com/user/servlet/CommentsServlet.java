
package com.user.servlet;

import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import com.entity.Comments;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "CommentsServlet", urlPatterns = {"/CommentsServlet"})
public class CommentsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String item=request.getParameter("item_id");
        String user=request.getParameter("name");
        String comment = request.getParameter("comment");
        int item_id=Integer.parseInt(item);
        
        Comments com=new Comments();
        com.setComment(comment);
        com.setItem_id(item_id);
        com.setName(user);
         ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
         boolean f=dao.addComment(com);
         if(f=true)
         {
             response.sendRedirect("view.jsp?id="+item_id);
         }
        
        
    }

   

}

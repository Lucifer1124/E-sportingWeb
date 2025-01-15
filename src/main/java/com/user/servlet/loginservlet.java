
package com.user.servlet;

import com.DAO.UserDaoimpl;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "loginservlet", urlPatterns = {"/loginservlet"})
public class loginservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        
        
        UserDaoimpl dao=new UserDaoimpl(DBConnect.getConn());
        HttpSession session=req.getSession();
        String email= req.getParameter("email");
        String password=req.getParameter("password");
        if("adminlogin@gmail.com".equals(email) && "admin69".equals(password))
        {
            
            
            User us=new User();
            us.setName("Admin");
            us.setEmail("adminlogin@gmail.com");
            session.setAttribute("userobj", us);
            
        res.sendRedirect("admin/AdminHome.jsp");
        }else{
            User us=dao.Login(email, password);
            if(us!=null)
            {
                session.setAttribute("userobj", us);
                res.sendRedirect("index.jsp");
                
            }else{
                session.setAttribute("failed","Wrong Email or Password");
                res.sendRedirect("login.jsp");
                System.out.print(us);
            }
        
        
        
        }
    }

}

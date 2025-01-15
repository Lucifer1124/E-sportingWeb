
package com.user.servlet;

import com.DAO.UserDaoimpl;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "registerservlet", urlPatterns = {"/registerservlet"})
public class registerservlet extends HttpServlet {

  
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int i=0;
        try{
        String name= req.getParameter("fname");
        String email= req.getParameter("email");
        String phno= req.getParameter("phno");
        String password= req.getParameter("password");
        String check= req.getParameter("check");
       User us = new User();
       us.setName(name);
       us.setEmail(email);
       us.setPhno(phno);
       us.setPassword(password);
       HttpSession session= req.getSession();
       if(check!=null)
       {
          i=i+1;
       
       }else{
      
        session.setAttribute("falmsg","Agree with the terms and conditons..");
           res.sendRedirect("register.jsp");
       
       }  if(email.contains("@")&& email.contains(".com"))
       {
          i=i+1;
       
       }else{
        session.setAttribute("failmsg","email must have an '@' & '.com'");
           res.sendRedirect("register.jsp");
       
       }
        if(password.length()>=5)
       {
          i=i+1;
       
       }else{
        session.setAttribute("failmsg","choose a longer password");
           res.sendRedirect("register.jsp");
       
       }
        if(i==3){
            UserDaoimpl dao=new UserDaoimpl(DBConnect.getConn());
            boolean a= dao.checkInfo(email);
            if(a){
            
            session.setAttribute("failmsg","email already exists...");
           res.sendRedirect("register.jsp");
            
            }
            else{
                boolean f=dao.userRegister(us);
                 if(f)
                   {
           
                     session.setAttribute("sucmsg","Registration Successfull...");
                     res.sendRedirect("login.jsp");
                    }else{
       
                       session.setAttribute("failmsg","Something went wrong,try again..");
                         res.sendRedirect("register.jsp");
       }


            }
        }
       
       
        
        
        
        
        }catch(Exception e){
        }
    }

   
 
}

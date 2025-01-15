
package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "logout", urlPatterns = {"/logout"})
public class logout extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session= request.getSession();
       session.removeAttribute("userobj");
       HttpSession session2 = request.getSession();
       session2.setAttribute("sucmsg","successfully logged out");
       response.sendRedirect("login.jsp");
       
    }


}

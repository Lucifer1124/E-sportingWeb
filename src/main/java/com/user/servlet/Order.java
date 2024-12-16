package com.user.servlet;

import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import com.entity.Items;
import com.entity.item_order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet(name = "Order", urlPatterns = {"/Order"})
public class Order extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            // Fetching user and order details from the request
            String user_name = request.getParameter("user_name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String pincode = request.getParameter("pincode");
            String city = request.getParameter("city");
            String paymentMethod = request.getParameter("payment");

            String p = request.getParameter("price");
            int price = Integer.parseInt(p);

            String y = request.getParameter("user_id");
            if (y == null || y.isEmpty()) {
                System.out.println("Error: user_id is missing.");
                response.sendRedirect("login.jsp");
                return;
            }
            int user_id = Integer.parseInt(y);

            String z = request.getParameter("item_id");
            String item_name = request.getParameter("item_name");
            String brand = request.getParameter("brand");
            int item_id = Integer.parseInt(z);

            String q = request.getParameter("quantity");
            int quantity = Integer.parseInt(q);
            int totalPrice = price * quantity;

            // Setting session attributes to pass data to JSP
            session.setAttribute("user_id", user_id);
            session.setAttribute("user_name", user_name);
            session.setAttribute("email", email);
            session.setAttribute("address", address);
            session.setAttribute("pincode", pincode);
            session.setAttribute("city", city);
            session.setAttribute("price", price);
            session.setAttribute("quantity", quantity);
            session.setAttribute("item_id", item_id);
            session.setAttribute("item_name", item_name);
            session.setAttribute("brand", brand);
            session.setAttribute("totalPrice", totalPrice);

            ItemDaoimpl dao = new ItemDaoimpl(DBConnect.getConn());
            Items itemDetails = dao.getItemDetails(item_id);

            if (itemDetails.getStock() >= quantity) {
                String photo = itemDetails.getPhoto();
                session.setAttribute("photo", photo);

                // If payment method is "online", redirect to payment.jsp
                if ("online".equals(paymentMethod)) {
                    response.sendRedirect("payment.jsp?price=" + totalPrice + "&user_id=" + user_id + "&item_id=" + item_id);
                }
                // If payment method is "cod", redirect to checkout.jsp
                else if ("cod".equals(paymentMethod)) {
                    response.sendRedirect("checkout.jsp?payment=cod&user_id=" + user_id + "&item_id=" + item_id);
                }
            } else {
                // Handle insufficient stock
                session.setAttribute("notenough", "Not enough items left in stock.");
                response.sendRedirect("buynow.jsp?id=" + item_id + "&&user_id=" + user_id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

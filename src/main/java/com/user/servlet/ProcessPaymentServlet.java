package com.user.servlet;

import com.razorpay.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.IOException;

public class ProcessPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve Razorpay payment details from the request
        String paymentId = request.getParameter("razorpay_payment_id");
        String orderId = request.getParameter("razorpay_order_id");
        String signature = request.getParameter("razorpay_signature");

        // Retrieve session and required attributes
        HttpSession session = request.getSession();
        String razorpayOrderId = (String) session.getAttribute("razorpay_order_id");
        Integer userIdInt = (Integer) session.getAttribute("user_id");
        Integer priceInt = (Integer) session.getAttribute("price");

        // Validate session attributes
        if (userIdInt == null || priceInt == null || razorpayOrderId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error: Missing required session attributes.");
            return;
        }

        // Convert attributes to required types
        String userId = String.valueOf(userIdInt);
        String price = String.valueOf(priceInt);

        // Retrieve additional attributes from the session
        String userName = (String) session.getAttribute("user_name");
        String email = (String) session.getAttribute("email");
        String address = (String) session.getAttribute("address");
        String pincode = (String) session.getAttribute("pincode");
        String city = (String) session.getAttribute("city");
        String itemName = (String) session.getAttribute("item_name");
        String brand = (String) session.getAttribute("brand");
        Integer quantity = (Integer) session.getAttribute("quantity");
        String itemPhoto = (String) session.getAttribute("itemPhoto");

        // Validate essential fields
        if (paymentId == null || orderId == null || signature == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error: Missing payment details.");
            return;
        }

        try {
            // Initialize Razorpay client
            RazorpayClient razorpay = new RazorpayClient("rzp_test_RutoXzI5m2zrZJ", "1fNibnwADvdAufSKmqjfTNc0");

            // Verify payment signature
            JSONObject options = new JSONObject();
            options.put("razorpay_order_id", razorpayOrderId);
            options.put("razorpay_payment_id", paymentId);
            options.put("razorpay_signature", signature);

            // Verify the payment signature using Razorpay's utility method
            Utils.verifyPaymentSignature(options, "1fNibnwADvdAufSKmqjfTNc0");

            // If verification succeeds, prepare data for checkout.jsp
            String redirectUrl = String.format(
                "checkout.jsp?paymentMethod=online&user_id=%s&order_id=%s&price=%s&user_name=%s&email=%s&address=%s&pincode=%s&city=%s&item_name=%s&brand=%s&quantity=%s&itemPhoto=%s",
                userId,
                orderId,
                price,
                encodeParam(userName),
                encodeParam(email),
                encodeParam(address),
                encodeParam(pincode),
                encodeParam(city),
                encodeParam(itemName),
                encodeParam(brand),
                quantity,
                encodeParam(itemPhoto)
            );

            // Redirect to checkout.jsp with data
            response.sendRedirect(redirectUrl);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error during payment verification: " + e.getMessage());
        }
    }

    // Helper method to encode URL parameters
    private String encodeParam(String param) {
        try {
            return param != null ? java.net.URLEncoder.encode(param, "UTF-8") : "";
        } catch (Exception e) {
            return "";
        }
    }
}

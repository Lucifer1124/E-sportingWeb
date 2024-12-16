<%@ page import="java.util.*" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.*" %>
<%
    String orderId = request.getParameter("order_id");
    String userId = request.getParameter("user_id");
    String price = request.getParameter("price");

    // Initialize Razorpay credentials
    String apiKey = "rzp_test_RutoXzI5m2zrZJ";
    String apiSecret = "1fNibnwADvdAufSKmqjfTNc0";

    try {
        // Create Razorpay client instance
        RazorpayClient razorpay = new RazorpayClient(apiKey, apiSecret);

        // Prepare the order request
        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount", Integer.parseInt(price) * 100); // Convert to paise
        orderRequest.put("currency", "INR");
        orderRequest.put("receipt", orderId);

        // Create the order
        Order order = razorpay.orders.create(orderRequest);
        String razorpayOrderId = order.get("id");

        // Store Razorpay order ID in session
        session.setAttribute("razorpay_order_id", razorpayOrderId);
        session.setAttribute("razorpay_payment_id", "");

        // Store price in session for the amount (in paise)
        session.setAttribute("price", Integer.parseInt(price) * 100);

    } catch (Exception e) {
        e.printStackTrace();
        // Handle error (optional: redirect or display error message)
        out.print("<p>Error while creating order: " + e.getMessage() + "</p>");
    }
%>

<form action="processPayment" method="post" id="paymentForm">
    <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id" />
    <input type="hidden" name="razorpay_order_id" id="razorpay_order_id" value="<%= session.getAttribute("razorpay_order_id") %>" />
    <input type="hidden" name="razorpay_signature" id="razorpay_signature" />
</form>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script type="text/javascript">
    var options = {
        "key": "rzp_test_RutoXzI5m2zrZJ", // Razorpay key ID
        "amount": "<%= session.getAttribute("price") %>", // Amount in paise
        "currency": "INR",
        "order_id": "<%= session.getAttribute("razorpay_order_id") %>", // Generated order ID
        "handler": function (response) {
            document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
            document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
            document.getElementById('razorpay_signature').value = response.razorpay_signature;

            // Submit the form after successful payment
            document.getElementById('paymentForm').submit();
        },
        "prefill": {
            "name": "<%= session.getAttribute("name") %>",
            "email": "<%= session.getAttribute("email") %>",
            "contact": "<%= session.getAttribute("contact") %>"
        },
        "theme": {
            "color": "#F37254" // Customize Razorpay's theme color (optional)
        }
    };

    // Open Razorpay checkout
    var rzp1 = new Razorpay(options);
    rzp1.open();
</script>

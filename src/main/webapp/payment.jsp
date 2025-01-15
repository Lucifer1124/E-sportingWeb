
<%@ page import="java.util.*" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.*" %>
<%
    String orderId = request.getParameter("order_id");
    String userId = request.getParameter("user_id");
    String price = request.getParameter("price");

    String apiKey = "rzp_test_RutoXzI5m2zrZJ";
    String apiSecret = "1fNibnwADvdAufSKmqjfTNc0";

    try {
        RazorpayClient razorpay = new RazorpayClient(apiKey, apiSecret);

        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount", Integer.parseInt(price) * 100); // Price in paise
        orderRequest.put("currency", "INR");
        orderRequest.put("receipt", "order_" + orderId);

        Order order = razorpay.orders.create(orderRequest);
        String razorpayOrderId = order.get("id");

        session.setAttribute("razorpayOrderId", razorpayOrderId);
%>
<html>
<head>
    <title>Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <form id="paymentForm" method="post" action="index.jsp">
        <script>
         var options = {
    "key": "rzp_test_RutoXzI5m2zrZJ",
    "amount": "<%= price %>.00", // Amount in paise
    "currency": "INR",
    "name": "Subby",
    "description": "Test Transaction",
    "order_id": "<%= razorpayOrderId %>",
    "handler": function (response) {
        console.log("Payment ID: " + response.razorpay_payment_id);
        console.log("Order ID: " + response.razorpay_order_id);
        console.log("Signature: " + response.razorpay_signature);

        document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
        document.getElementById('razorpay_signature').value = response.razorpay_signature;
        document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
        document.getElementById('paymentForm').submit();
    },
    "theme": {
        "color": "#3399cc"
    }
};
var rzp = new Razorpay(options);
rzp.open();

        </script>
   <input type="hidden" name="razorpay_payment_id" value="..." />
    <input type="hidden" name="razorpay_order_id" value="..." />
    <input type="hidden" name="razorpay_signature" value="..." />
</form>

</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>

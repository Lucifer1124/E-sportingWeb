<%@ page import="java.util.*" %>
<%@page import="com.entity.Items"%>
<%@page import="com.entity.item_order"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Checkout</title>
    <%@include file="ALLCSS/ALLCSS.jsp" %>
    <link rel="stylesheet" href="styles/checkout.css">
    <style>
        /* Popup Dialog Styling */
        #popupDialog {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 500px;
            height: 330px;
            border-radius: 5%;
        }

        /* Overlay Styling */
        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        /* Styling for Text */
        strong {
            color: #4CAF50; /* Green for emphasis */
        }

        td {
            color: #333; /* Darker text for table */
        }

        .btn {
            border-radius: 5px;
            padding: 10px 20px;
            margin: 10px 0;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007BFF;
            color: white;
        }

        .btn-danger {
            background-color: #DC3545;
            color: white;
        }

        .btn-success {
            background-color: #28A745;
            color: white;
        }

        /* Responsive Design for smaller screens */
        @media (max-width: 768px) {
            #popupDialog {
                width: 90%;
                height: auto;
            }
            .row {
                flex-direction: column;
                align-items: center;
            }
            .col-md-6, .col-md-5 {
                width: 100%;
                margin-top: 20px;
            }
        }

        /* Additional Styling for Table */
        .table {
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-collapse: separate;
            width: 100%;
        }

        .table thead {
            background-color: #007BFF;
            color: white;
            border-radius: 8px;
        }

        .table th, .table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f5f5f5;">
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"/>
    </c:if>
<h2>Checkout Details</h2>
    <table>
        <tr>
            <td>Product Name:</td>
            <td><c:out value="${sessionScope.item_name}" /></td>
        </tr>
        <tr>
            <td>Brand:</td>
            <td><c:out value="${sessionScope.brand}" /></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td>
                <c:choose>
                    <c:when test="${not empty sessionScope.price}">
                        <c:set var="price" value="${sessionScope.price}" />
                        <c:out value="${price}" />.00
                    </c:when>
                    <c:otherwise>
                        <span style="color: red;">Error: Price not available</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td>Quantity:</td>
            <td><c:out value="${sessionScope.quantity}" /></td>
        </tr>
        <tr>
            <td>Total:</td>
            <td>
                <c:choose>
                    <c:when test="${not empty sessionScope.totalPrice}">
                        <c:set var="totalPrice" value="${sessionScope.totalPrice}" />
                        <c:out value="${totalPrice}" />.00
                    </c:when>
                    <c:otherwise>
                        <span style="color: red;">Error: Total price not available</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>

    <form action="placeOrder" method="post">
        <input type="hidden" name="user_name" value="${sessionScope.user_name}">
        <input type="hidden" name="email" value="${sessionScope.email}">
        <input type="hidden" name="address" value="${sessionScope.address}">
        <input type="hidden" name="pincode" value="${sessionScope.pincode}">
        <input type="hidden" name="city" value="${sessionScope.city}">
        <input type="hidden" name="item_id" value="${sessionScope.item_id}">
        <input type="hidden" name="item_name" value="${sessionScope.item_name}">
        <input type="hidden" name="price" value="${sessionScope.price}">
        <input type="hidden" name="quantity" value="${sessionScope.quantity}">
        <input type="hidden" name="totalPrice" value="${sessionScope.totalPrice}">
        <button type="submit">Confirm Order</button>
    </form>
</body>
</html>
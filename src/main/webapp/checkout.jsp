
<%@page import="com.entity.Items"%>
<%@page import="com.entity.item_order"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkout</title>
        <%@include file="ALLCSS/ALLCSS.jsp" %>
        <style>
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
            height:330px;
            border-radius: 2%;
        }

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
        strong{
            color:darkgray;
        }
        td{
            color:white;
        }
        
            </style>
    </head>
    <body style="font-family: impact,sans-serif;">
         <c:if test ="${empty userobj}">
            <c:redirect url="login.jsp"/>
                 </c:if> 
         <%
         String x=request.getParameter("id");
                    
                     int id=Integer.parseInt(x);
                     ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                     Items i=dao.getItemDetails(id);
                     int user_id=Integer.parseInt(request.getParameter("user_id"));
                     item_order o=dao.OrderById(user_id);
                      String user_name=request.getParameter("user_name");
          
           
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
            String payment=request.getParameter("payment");
            
            String p=request.getParameter("price");
            int price=Integer.parseInt(p);
            String y=request.getParameter("user_id");
             String z=request.getParameter("item_id");
             String item_name=request.getParameter("item_name");
             String brand=request.getParameter("brand");
             int userr_id=Integer.parseInt(y);
             int item_id=Integer.parseInt(z);
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        
        
        
        %>
        
      
         <%@include file="ALLCSS/navbar.jsp" %>
         <div class="row">
           <div class="col-md-6" style="align-content: center;">
                <div class="" style="margin-left: 20%; margin-top: 100px;">
                <img   src="item-img/<%=i.getPhoto()  %>" alt="alt" style=" width: 300px; height:300px;  border: 1px solid white; box-shadow: 0px 0px 15px 0.5px black; border-width:0.1rem; border-style: double; border-radius: 5%;"/>
                
                
               
               
            </div>
            </div>
                <div class="col-md-5" style="margin-top: 100px;">
                    <table class="table">
  <thead>
    <tr>
      
      <th scope="col">Product</th>
      <th scope="col">price</th>
      <th scope="col">total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
     
      <td><%=i.getItem_name() %>x<%= quantity %></td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i><%=i.getPrice() %>.00</td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i> <%=  price*quantity %>.00</td>
    </tr>
    <tr>
     
      <td>Delivery </td>
      <td>free</td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i> 0.00</td>
    </tr>
    <tr>
     
      <td></td>
      <td></td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i> <%= price*quantity %>.00</td>
    </tr>
  </tbody>
</table>
    <a href="PlaceOrder?user_name=<%=user_name%>&&email=<%=email%>&&address=<%=address%>&&pincode=<%=pincode%>&&city=<%=payment%>&&city=<%=city%>&&price=<%=p%>&&user_id=<%=y%>&&item_id=<%=z%>&&item_name=<%=item_name%>&&brand=<%=brand%>&&quantity=<%=quantity%>"<button type="submit" class="btn btn-primary" style="margin-left: 65%;" onclick="">Confirm</button></a>
    
    <a href="deleteorder?id=<%=o.getOrderid()%>&&q=<%=o.getQuantity()%>&&item_id=<%=o.getItem_id()%>&&stock=<%=i.getStock()%>"><button type="submit" class="btn btn-danger">cancel</button></a>
    <div id="overlay"></div>
    <div id="popupDialog">
       <div class="">
           <div class="header"><h3 class="text-success">Order Placed Successfully!!</h3></div>
        <div class="product">
            
            <div class="details">
                <p><strong>Product Name : <%=o.getItem_name() %> </strong></p>
                <p><strong>Price :  <i class="fa-solid fa-indian-rupee-sign"></i><%=o.getPrice()%>.00</strong></p>
                <p ><strong><i class="fa-solid fa-truck-fast"></i>Order Date : <p id="demo"></p></strong><p id="demo"></p></p>
            </div>
            
        </div>
        <p  class="text-primary">Delivery between 2-3 working days</p>
        <div style="align-items: center;">
            <form action="index.jsp"><button style="margin-left: 33%;" class="btn btn-success">Continue Shopping</button></form>
            
        </div> 
    </div> 

    </div>
                    
                    
                </div>
            
            
            
        </div>
                     
                 
                 
                 
             
                    
         <script>
        function popupFn() {
            document.getElementById(
                "overlay"
            ).style.display = "block";
            document.getElementById(
                "popupDialog"
            ).style.display = "block";
        }
        function closeFn() {
            document.getElementById(
                "overlay"
            ).style.display = "none";
            document.getElementById(
                "popupDialog"
            ).style.display = "none";
        }
        const d = new Date();
document.getElementById("demo").innerHTML = d;
    </script>
    </body>
</html>

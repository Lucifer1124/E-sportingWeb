<%-- 
    Document   : showCart
    Created on : 25 Nov 2024, 3:28:54 am
    Author     : user
--%>

<%@page import="com.entity.Items"%>
<%@page import="com.entity.item_order"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="ALLCSS/ALLCSS.jsp" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ShowCart</title>
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
        a{
            text-decoration: none;
        }
        h4,h3,p,td{
            color:white;
        }
        tr:hover{
            box-shadow: 0px 0px 15px 0.5px grey; 
            transition:  0.3s;
        }
            </style>
    </head>

    <body>
        <%@include file="ALLCSS/navbar.jsp" %>
        <%
        
  ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
  List<Cart> cart=dao.getItembyUserId(u.getId());
  Cart ck= new Cart();
item_order o=dao.OrderById(u.getId()); 
Items i=null;


        %>
        <c:if test ="${empty userobj}">
            <c:redirect url="login.jsp"/>
                 </c:if>
          <input type="hidden" value="${userobj.id}" name="user_id">
        

        <section id="cart" class="section-p1">
            <table width="100%" style="color:white;">
                <thead>
                    <tr>
                        <td>Image</td>
                        <td>Name</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Remove</td>
                        
                    </tr>
                </thead>
                <%
   int x=0;
   
  for(Cart c:cart)
  { 
  int y=0;
  i=dao.getItemDetails(c.getItem_id());
  y=Integer.parseInt(i.getPrice())*c.getQuantity();
  if(i.getStock()>=c.getQuantity())
  {%>
                <tbody>
                    <tr>
                        
                  <td ><img  class="imgg" src="item-img/<%=c.getPhoto() %>" id="imgid" alt="alt" style="height: 50px; width: 50px; margin-bottom: 8%;"></td>
                  <td ><h4><a href="view.jsp?id=<%=c.getItem_id() %>" style="text-decoration: none; color:white;"><%=c.getItem_name()  %></a></h4></td>
          <td><h4><i class="fa-solid fa-indian-rupee-sign"></i><%=y %>.00</h4></td>
      
      <td><h4><%=c.getQuantity()%></h4></td>
     
      <td>
          
          <a  href="deleteCart?id=<%=c.getCart_id()%>"  class="btn btn.sm btn-danger imghover">Delete</a>
      </td>
       <%
      x=y+x;
      %>
                        
                    </tr>
                    <%}
else
{%>
<td><img class="imgg" src="item-img/<%=c.getPhoto() %>" id="imgid" alt="alt" style="height: 50px; width: 50px;"></td>
                  <td ><h4><a href="view.jsp?id=<%=c.getItem_id() %>" style="text-decoration: none;color:white;"><%=c.getItem_name() %></a></h4></td>
          <td><h4 class="text danger" style="margin-left:5px;">NA</h4></td>
      
          <td style="width: 50px;"><h4>0</h4></td>
     
      <td>
          
          <a  href="deleteCart?id=<%=c.getCart_id()%>"  class="btn btn.sm btn-danger imghover">Delete</a>
      </td>
      
    
    </tr>
<%}
  
 }

  %>
                    
                </tbody>
            </table>
        </section>

        <% 
        if(o==null)
        {%>
        <section id="cart-add" class="section-p1">
            <div id="subtotal">
            <form action="orderCart" method="post">
       <div   class="col-md-8" style="margin-top: 50px; margin-right: 20px; margin-left:30px;">
           
  <div class="form-row">
      
    <div class="form-group col-md-6">
       
       
        <input type="hidden" value="${userobj.id}" name="user_id">
       
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4"  name="user_name" value="${userobj.name}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">email</label>
      <input type="text" class="form-control" id="inputPassword4"  name="email" value="${userobj.email}">
    </div>
      <div class="form-group col-md-6">
      <label for="inputPassword4">phone number</label>
      <input type="text" class="form-control" id="inputPassword4" value="${userobj.phno}" name="phno">
    </div>
       <div class="form-group col-md-6">
      <label for="inputPassword4">landmark</label>
      <input type="text" class="form-control" id="inputPassword4" name="landmark">
    </div>
      
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" name="address">
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control"  id="inputCity" name="city">
    </div>
    
    <div class="form-group col-md-6">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control"   id="inputZip" name="pincode">
    </div>
      <div class="form-group col-md-6">
                      <select class="form-control" id="inputZip" name="payment">
                 <option selected>Cash on Delivery</option>
                 
                 <option value="cod">Cash on Delivery</option>
                 
                 
                 
             </select>
                    </div>
    </div>
    </div>
    </div>

            <div id="subtotal">
                <h3>Cart Total</h3>
                <table>
                    <tr>
                        <td>Cart Subtotal</td>
                        <td>₹<%=x %></td>
                    </tr>
                    <tr>
                        <td>Shipping</td>
                        <td>Free</td>
                    </tr>
                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong>₹<%=x%></strong></td>
                    </tr>
                </table>
                 <%
    if(x!=0)
    {%>
    <a data-toggle="modal" data-target="#exampleModalLong" onclick="popupFnn()"><button>Confirm</button></a>
    <%}
    %>
    <%
    if(x==0)
    {%>
    <a href="index.jsp"><h3 class="text-danger"> Add More Items</h3></a>
    <%}
    %>
    <div id="overlay"></div>
    <div id="popupDialog">
       <div class="">
           <div class="header"><h3 class="text-success">Order Placed Successfully!!</h3></div>
        <div class="product">
            
            <div class="details">
               
                <p><strong>Price :</strong> <i class="fa-solid fa-indian-rupee-sign"></i> <%=x%>.00</p>
                <p><strong><i class="fa-solid fa-truck-fast"></i>Order Date :</strong> <p id="demo"></p></p>
            </div>
            
        </div>
        <p  class="text-primary">Delivery between 5-7 working days</p>
        <div style="align-items: center;">
            <button  type="submit" style="margin-left: 33%;" class="btn btn-success">Continue Shopping</button></form>
        </div> 
    </div> 

    </div>
            </div>
            
            </form>
        </section>
        <%}else
        {%>
        <section id="cart-add" class="section-p1">
            <div id="subtotal">
            <form action="orderCart" method="post">
       <div   class="col-md-8" style="margin-top: 50px; margin-right: 20px; margin-left:30px;">
           
  <div class="form-row">
      
    <div class="form-group col-md-6">
       
       
        <input type="hidden" value="${userobj.id}" name="user_id">
       
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4"  name="user_name" value="${userobj.name}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">email</label>
      <input type="text" class="form-control" id="inputPassword4"  name="email" value="${userobj.email}">
    </div>
      <div class="form-group col-md-6">
      <label for="inputPassword4">phone number</label>
      <input type="text" class="form-control" id="inputPassword4" value="${userobj.phno}" name="phno">
    </div>
       <div class="form-group col-md-6">
      <label for="inputPassword4">landmark</label>
      <input type="text" class="form-control" id="inputPassword4" name="landmark">
    </div>
      
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" value="<%=o.getAdress() %>" name="address">
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" value="<%=o.getCity() %>" id="inputCity" name="city">
    </div>
    
    <div class="form-group col-md-6">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control"  value="<%=o.getPincode() %>" id="inputZip" name="pincode">
    </div>
      <div class="form-group col-md-6">
                      <select class="form-control" id="inputZip" name="payment">
                 <option selected>--select--</option>
                 
                 <option value="cod">Cash on Delivery</option>
                 
                 
                 
             </select>
                    </div>
    </div>
    </div>
    </div>

            <div id="subtotal">
                <h3>Cart Total</h3>
                <table>
                    <tr>
                        <td>Cart Subtotal</td>
                        <td>₹<%=x %></td>
                    </tr>
                    <tr>
                        <td>Shipping</td>
                        <td>Free</td>
                    </tr>
                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong>₹<%=x%></strong></td>
                    </tr>
                </table>
                 <%
    if(x!=0)
    {%>
    <a data-toggle="modal" data-target="#exampleModalLong" onclick="popupFnn()"><button>Confirm</button></a>
    <%}
    %>
    <%
    if(x==0)
    {%>
    <a href="index.jsp"><h3 class="text-danger"> Add More Items</h3></a>
    <%}
    %>
    <div id="overlay"></div>
    <div id="popupDialog">
       <div class="">
           <div class="header"><h3 class="text-success">Order Placed Successfully!!</h3></div>
        <div class="product">
            
            <div class="details">
               
                <p><strong>Price :</strong> <i class="fa-solid fa-indian-rupee-sign"></i> <%=x%>.00</p>
                <p><strong><i class="fa-solid fa-truck-fast"></i>Order Date :</strong> <p id="demo"></p></p>
            </div>
            
        </div>
        <p  class="text-primary">Delivery between 5-7 working days</p>
        <div style="align-items: center;">
            <button  type="submit" style="margin-left: 33%;" class="btn btn-success">Continue Shopping</button></form>
        </div> 
    </div> 

    </div>
            </div>
            
            </form>
        </section>
        <%}
        
        
        
        %>

       

         <script>
        function popupFnn() {
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
    <%@include file="ALLCSS/footer.jsp" %>
</html>

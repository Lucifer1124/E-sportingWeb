

<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.item_order"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Items"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BuyNow</title>
        <%@include file="ALLCSS/ALLCSS.jsp" %>
        <style>
            
            
            
        </style>
    </head>
    <body> 
         <c:if test ="${empty userobj}">
            <c:redirect url="login.jsp"/>
                 </c:if>
         <%
                    String x=request.getParameter("id");
                    
                     int id=Integer.parseInt(x);
                     ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                     Items i=dao.getItemDetails(id);
                     String y=request.getParameter("user_id");
                    
                     int user_id=Integer.parseInt(y);
                     item_order o=dao.OrderById(user_id);
                     
                     
                     
                    
                    %>
        <%@include file="ALLCSS/navbar.jsp" %>
        <form action="Order?id=<%=u.getId()%>" method="post" style="margin-top:150px; margin-bottom: 400px;">
            <c:if test ="${not empty notenough}">
                     <h6  class="text-center text-danger">${notenough}</h6>
                    
                     <c:remove var="notenough" scope="session"/>
            </c:if>
                     
        <div class="row">
            <div class="col-md-6">
                <div class="" style="margin-left: 180px;">
                <img   src="item-img/<%=i.getPhoto()  %>" alt="alt" style=" width: 370px; height:330px;  border-color: white; border-width: 3px; border-style: double;border: 1px solid white; box-shadow: 0px 0px 15px 0.5px black; border-width:0.1rem; border-style: double; border-radius: 5%;"/>
                
                <h4 style="color: darkslategrey; margin-top:8%;">PRODUCT:<%=i.getItem_name()%></h4>
                <h2 style="color:black;"><i class="fa-solid fa-indian-rupee-sign"></i><%=i.getPrice()  %>.00</h2>
               quantity<select name="quantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option>4</option>
                    <option>5</option>
                    
                        </select>
               
            </div>
            </div>
              
            <%
            if(o==null){%>
            <div class="col-md-5" style="margin-top: 50px; margin-right: 20px;">
  <div class="form-row">
      
    <div class="form-group col-md-6">
        <input type="hidden" value="<%=i.getItem_id()%>" name="item_id">
        <input type="hidden" value="<%=i.getPrice()%>" name="price">
        <input type="hidden" value="${userobj.id}" name="user_id">
        <input type="hidden" value="<%=i.getItem_name() %>" name="item_name">
        <input type="hidden" value="<%=i.getBrand() %>" name="brand">        
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
    <input type="text" class="form-control" id="inputAddress" value="" name="address">
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" value="" id="inputCity" name="city">
    </div>
    
    <div class="form-group col-md-6">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control"  value="" id="inputZip" name="pincode">
    </div>
      <div class="form-group col-md-6">
                      <select class="form-control" id="inputZip" name="payment">
                 <option selected>--select--</option>
                 
                 <option value="cod">Cash on Delivery</option>
                 
                 
                 
             </select>
                    </div>
      <div class="form-group col-md-2">
                      
                    </div>
  </div>
                    
  
    <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Proceed</button>
</div>
                <%}else{%>
<div class="col-md-5" style="margin-top: 50px; margin-right: 20px;">
  <div class="form-row">
      
    <div class="form-group col-md-6">
        <input type="hidden" value="<%=i.getItem_id()%>" name="item_id">
        <input type="hidden" value="<%=i.getPrice()%>" name="price">
        <input type="hidden" value="${userobj.id}" name="user_id">
        <input type="hidden" value="<%=i.getItem_name() %>" name="item_name">
        <input type="hidden" value="<%=i.getBrand() %>" name="brand">        
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4"  name="user_name" value="${userobj.name}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">email</label>
      <input type="text" class="form-control" id="inputPassword4"  name="email" value="${userobj.email}">
    </div>
      <div class="form-group col-md-12">
      <label for="inputPassword4">phone number</label>
      <input type="text" class="form-control" id="inputPassword4" value="${userobj.phno}" name="phno">
    </div>
       
      
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" value="<%=o.getAdress()%>" name="address">
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" value="<%=o.getCity()%>" id="inputCity" name="city">
    </div>
    
    <div class="form-group col-md-6">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control"  value="<%=o.getPincode() %>" id="inputZip" name="pincode">
    </div>
      <div class="form-group col-md-6">
                      <select class="form-control" id="inputZip" name="payment">
                          <option selected>Cash on Delivery</option>
                 
                 <option value="cod">Cash on Delivery</option>
                 
                 
                 
             </select>
                    </div>
      <div class="form-group col-md-2">
                      
                    </div>
  </div>
                    
  
    <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Proceed</button>
</div>
      <%}
            
            %>
            
            
        </div>
    </form>
    
    </body>
</html>


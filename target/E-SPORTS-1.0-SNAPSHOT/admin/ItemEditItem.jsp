<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Items"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditItem</title>
        <link rel="stylesheet" href="style.css">
         <%@include file="ALLCSS.jsp" %>
    </head>
    <body style="">
            <c:if test ="${empty userobj}">
            <c:redirect url="../login.jsp"/>
                 </c:if>
        <%
         User u=(User)session.getAttribute("userobj");
        if(u.getEmail()!="adminlogin@gmail.com")
        {
        response.sendRedirect("../login.jsp");
        }
        %>
         <%@include file="adminnavbar.jsp" %>
          
            
            
                 <h5 style="padding-top: 30px; margin-left: 705px;">Edit Item</h5>
                  
                    <%
                    
                     int id=Integer.parseInt(request.getParameter("id"));
                     ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                     Items i=dao.getItemDetails(id);
                     
                     
                     
                    
                    %>
              
                  <div style="width: 50%; margin-left: 25%; margin-top: 5%; margin-bottom: 15%; ">
                 <form action="../edititem" method="get" >
                     
                     <div class="form-row">
                         <input type="hidden" value="<%=i.getItem_id() %>" name="item_id">
    <div class="form-group col-md-6">
      <label>Item Name</label>
      <input type="text" class="form-control" id="" placeholder="" name="item_name" value="<%=i.getItem_name()%>" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Brand</label>
      <input type="text" class="form-control" id="" name="brand"  value="<%=i.getBrand()%>" required>
    </div>
  </div>
                     <div class="form-row">
    <div class="form-group col-md-6">
      <label>Price</label>
      <input type="number" class="form-control" id="" placeholder="" name="price" value="<%= i.getPrice()%>" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Stock</label>
      <input type="number" class="form-control" id="" name="stock" value="<%=i.getStock() %>" required>
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Description</label>
    <textarea class="form-control" name="description" maxlength="150" value="<%=i.getDescription()%>" required></textarea>
  </div>
  
  <div class="form-row">
    
    <div class="form-group col-md-6">
      <label for="inputState">Category</label>
      <select id="inputState" class="form-control" name="category" required>
        <option selected>Choose...</option>
        
                 <option value="cricket" >Cricket</option>
                 <option value="football">Football</option>
                 <option value="basketball">BasketBall</option>
                 <option value="tennis">Tennis</option>
                 
                 
            
      </select>
    </div>
      <div class="form-group col-md-6">
      <label for="inputState">Category</label>
      <select id="inputState" class="form-control" name="category2" required>
        <option selected>Choose...</option>
        
                 <option value="trending" >Trending</option>
                 <option value="latest">Latest</option>
               
                 
                 
            
      </select>
    </div>
      
      
    
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  </form>
  </div>
  


        



                
         
           
     
                        <%@include file="../ALLCSS/footer.jsp" %>
    </body>
</html>


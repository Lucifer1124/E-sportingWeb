

<%@page import="java.util.List"%>
<%@page import="com.entity.item_order"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Orders</title>
        <style>
            
               tr:hover{
            box-shadow: 0px 0px 15px 0.5px grey; 
            transition:  0.3s;
        }
            
           
            
            </style>
         </head>
         <body style="background-image: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);">
               <%
        User u=(User)session.getAttribute("userobj");
        
        %>
             <%@include file="adminnavbar.jsp" %>
              <%@include file="ALLCSS.jsp" %>
              <section id="cart" class="section-p1">
              <table class="table">
            <%
            ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
            List<item_order> list=dao.AllOrderDetails();
            
            %>
             <c:if test ="${empty userobj}">
            <c:redirect url="../login.jsp"/>
                 </c:if>
        <%
         
        if(u.getEmail()!="adminlogin@gmail.com")
        {
        response.sendRedirect("../login.jsp");
        }
        %>
        
       <tr>  <thead class="thead-dark">
      
       <th scope="col">Order-ID</th>
      <th scope="col">User-ID</th>
      <th scope="col">User Name</th>
      <th scope="col">Item Id</th>
      <th scope="col">Item Name</th>
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col" style="margin-left: 30px;">Status</th>
      <%
      for(item_order l:list)
      {%>
       <tr>
           
           <td><%=l.getOrder_id()%></td>
           <td><%=l.getUser_id() %></td>
           <td><%=l.getUser_name() %></td>
           <td><%=l.getItem_name() %></td>
           <td><%=l.getItem_id() %></td>
           <td><%=l.getQuantity() %></td>
           <td><%=l.getPrice() %></td>
           <td> <div class="dropdown">
  <button class="btn btn-primary dropdown-toggle"  style="width:65%; " type="button" data-bs-toggle="dropdown" aria-expanded="false">
      <%=l.getStatus() %>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="../EditStatus?status=Shipped&&id=<%=l.getOrder_id() %>">Shipped</a></li>
    <li><a class="dropdown-item" href="../EditStatus?status=OutForDelivery&&id=<%=l.getOrder_id()%>">OutforDelivery</a></li>
    <li><a class="dropdown-item" href="../EditStatus?status=Delivered&&id=<%=l.getOrder_id()%>">Delivered</a></li>
    <li><a class="dropdown-item" href="../EditStatus?status=Cancelled&&id=<%=l.getOrder_id()%>">Cancel</a></li>
  </ul>
</div></td>
       </tr>
      <%}
      %>
     
      
   
    
  </thead>
        </table>
      </section>
         
   
    
       
    </body>
</html>

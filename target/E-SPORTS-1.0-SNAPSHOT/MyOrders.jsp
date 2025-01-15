<%-- 
    Document   : MyOrders
    Created on : 25 Nov 2024, 11:19:03 am
    Author     : user
--%>
<%@page import="com.entity.Items"%>
<%@page import="com.entity.item_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyOrders</title>
         <%@include file="ALLCSS/ALLCSS.jsp" %>
         <style>
             .order{
                height:180px;
                
                border-bottom-color: grey;
                border-style:solid;
                display:grid;
                grid-template-columns: 300px 1000px;
                border-top:0px;
                border-left: 0px;
                border-right: 0px;
                border-bottom: 0px;
                
            }
            .ord{
                margin: 40px;
                border-style: solid;
                border-color: grey;
                
                border-radius: 15px;
            }
           
            .ord:hover{
                              box-shadow: 0px 0px 15px 0.5px white; border-width:0.1rem;
                            transition: 0.5s;
            }
            a{
                text-decoration: none;
            }
            h4{
                text-shadow: 1px 1px black;
            }
            
         </style>
    </head>
    <body>
         <%@include file="ALLCSS/navbar.jsp" %>
         <% String user=request.getParameter("id");
         int user_id=Integer.parseInt(user);
         ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
          List<item_order> list=dao.OrderDetailsById(user_id);
         Items i=null;
         %> 
         <h1 style="text-align:center; margin-bottom: 30px; margin-top: 20px; font-family: 'Oswald', sans-serif; color:white;">My Orders</h1>
         <%
         for(item_order o:list)
         {%>
         <%
          i=dao.getItemDetails(o.getItem_id());
         %>
         <div class="ord">
             
         <div class="order">
             <div>
             <img src="item-img/<%=i.getPhoto() %>" alt="alt" style="width: 100px; height: 100px; margin-left:40px;margin-top:40px;">
             </div>  
             <div>
                 
                 <h2 style="margin-top: 15px;"><%=o.getItem_name() %></h2>
                
                 <h5 style="color: grey">Quantity : <%=o.getQuantity() %></h5>
                 <h3>Price: <i class="fa-solid fa-indian-rupee-sign"></i><%=o.getPrice() %>.00</h3>
                 <%
                 if(o.getStatus().equals("Cancelled") )
                 {%>
                 <h4 class="text-danger">status-cancelled</h4>
                 <%}
                 %>
                 <%
                 if(o.getStatus().equals("OutForDelivery")||o.getStatus().equals("Shipped")||o.getStatus().equals("Delivered"))
                 {%>
                 <h4 class="text-success">status-<%=o.getStatus() %></h4>
                 <%}
                 %>
                 
             </div>
          
            
         </div>
          <%
                 if(o.getStatus().equals("OutForDelivery")||o.getStatus().equals("Shipped"))
                 {%>
                 <div  class="cancel" style="text-align: center; height:45px;"><a href="CancelRequest?id=<%=o.getOrder_id()%>&&uid=<%=o.getUser_id() %>" style="width:100%; height:45px; text-decoration: none;"><h5 class="text-danger"><i class="fa-solid fa-xmark fa-1.7x" style="margin-top: 5px; margin-right: 5px;"></i>cancel order</h5></a></div>
                
  
</div>
  
</div>  
                 <%}
                 %>
                 <%
                 if(o.getStatus().equals("Delivered"))
                 {%>
                 <form action="CommentsServlet" method="post"><div><textarea style="width: 85%; height:50px; margin-left: 3%; margin-bottom: 2%; display:inline-block"  placeholder="add your review"class="form-control" name="comment"></textarea><button class="btn btn-primary" type="submit" style="margin-bottom: 10px; display:inline block; margin-left: 10px;" >submit</button>
                     <input type="hidden"  value="<%=u.getName()%>" name="name">
                     <input type="hidden" value="<%=o.getItem_id()%>" name="item_id">
                 </form></div>
                 <%}
                 %>
                
                 
         </div>
               
         <%}
         %>
         <div style="height:100px; width:100%;"></div>
    </body><%@include file="ALLCSS/footer.jsp" %>
</html>

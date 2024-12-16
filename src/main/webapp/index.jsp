
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Items"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
       
        <style>
            a{
    text-decoration: none;
}
.xyz{
           
            
        }
        body{
          
            
        }
        
        </style>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
          <%@include file="ALLCSS/ALLCSS.jsp" %>
       
    </head>

    <body>
         
        <%@include file="ALLCSS/navbar.jsp" %>
        
        
      

        

       

        <section id="product1" class="section-p1">
            <h2>Latest Arrivals</h2>
            <p>Latest sports equipments </p>
            <div class="pro-container">
                <%
                  ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                  
                  List<Items> list=dao.getNewItem();
                  for(Items i:list){%>
                <div class="pro">
                    <a href="view.jsp?id=<%=i.getItem_id()%>">
                    <img class="shirt" src="item-img/<%= i.getPhoto() %>" alt="" style="height:250px;">
                    <div class="des">
                        <span><%=i.getBrand() %></span>
                        <h5><%=i.getItem_name()%></h5>
                        <div class="star">
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                        </div>
                        <h4>$<%=i.getPrice()%>.00</h4>
                    </div>
                    <%
                          if(u == null)
                          {%>
                    <a href="login.jsp"><i class='bx bx-cart cart' ></i></a>
                    <%}      
                          %>
                           <%
                          if(u != null)
                          {%>
                    <a href="cartservlet?item_id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>"><i class='bx bx-cart cart' ></i></a>
                     <%}      
                          %>
                    </a></div>
                 <%}
                  
                  
                  
                  %>
                
            </div>
        </section>

        
        <section id="product1" class="section-p1">
            <h2>Trending Items</h2>
            <p>Trending sports equipments </p>
            <div class="pro-container">
                <%
                  
                  
                  List<Items> list2=dao.getTrendingItem();
                  for(Items i:list2){%>
                <div class="pro">
                    <a href="view.jsp?id=<%=i.getItem_id()%>">
                    <img class="shirt" src="item-img/<%= i.getPhoto() %>" alt="" style="height:250px;">
                    <div class="des">
                        <span><%=i.getBrand() %></span>
                        <h5><%=i.getItem_name()%></h5>
                        <div class="star">
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                        </div>
                        <h4>$<%=i.getPrice()%>.00</h4>
                    </div>
                    <%
                          if(u == null)
                          {%>
                    <a href="login.jsp"><i class='bx bx-cart cart' ></i></a>
                    <%}      
                          %>
                           <%
                          if(u != null)
                          {%>
                    <a href="cartservlet?item_id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>"><i class='bx bx-cart cart' ></i></a>
                     <%}      
                          %>
                    </div>
                 <%}
                  
                  
                  
                  %>
                  
                  <%
                    String status = request.getParameter("status");
                    String paymentId = request.getParameter("paymentId");
                    if ("success".equals(status)) {
            %>
                <div class="alert alert-success">
                    Payment Successful! Payment ID: <%= paymentId %>
                </div>
        <%
    }
%>

                
            </div>
        </section>
                  <section id="product1" class="section-p1">
            <h2>Categories</h2>
            <p>Choose among four categories!</p>
            <div class="pro-container">
                <div class="pro">
                    <a href="Football.jsp"><img class="shirt" src="football.jpg" alt=""></a>
                    
                    
                </div>
                 <div class="pro">
                    <a href="Basketball.jsp"><img class="shirt" src="img/basketball.jpg" alt="" style="height:230px;"></a>
                    
                    
                </div>
                 <div class="pro">
                    <a href="Cricket.jsp"><img class="shirt" src="img/cricket.jpg" alt=""  style="height:230px;"></a>
                    
                    
                </div>
                 <div class="pro">
                    <a href="Tennis.jsp"><img class="shirt" src="img/tennis.jpg" alt=""  style="height:230px;"></a>
                    
                    
                </div>
                
            </div>
            
        </section>
        
     

                  <%@include file="ALLCSS/footer.jsp" %>


        <script src="script.js"></script>
        
        <c:if test ="${not empty addCart}">
                     
                    <div id="snackbar" >${addCart}</div>
                        <body onload="myFunction();"></body>
                    
                    
                        <script>
                        function myFunction() {
                          var x = document.getElementById("snackbar");
                          x.className = "show";
                          setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
                        }
                        </script>
<c:remove var="addCart" scope="session" />  
                   
                 </c:if>
    </body>
</html>




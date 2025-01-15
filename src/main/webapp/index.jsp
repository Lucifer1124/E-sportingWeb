
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
        /* The snackbar - position it at the bottom and in the middle of the screen */
#snackbar {
  visibility: hidden; /* Hidden by default. Visible on click */
  min-width: 250px; /* Set a default minimum width */
  margin-left: -125px; /* Divide value of min-width by 2 */
  background-color: #333; /* Black background color */
  color: #fff; /* White text color */
  text-align: center; /* Centered text */
  border-radius: 2px; /* Rounded borders */
  padding: 16px; /* Padding */
  position: fixed; /* Sit on top of the screen */
  z-index: 1; /* Add a z-index if needed */
  left: 50%; /* Center the snackbar */
  bottom: 30px; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
  visibility: visible; /* Show the snackbar */
  /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
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
                    <a href="cartservlet?item_id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>"  onclick="myFunction1()"><i class='bx bx-cart cart' ></i></a>
                    
                     <%}      
                          %>
                    </a></div>
                 <%}
                  
                  
                  
                  %>
                
            </div>
        </section>
                  <div id="snackbar">Added to cart..</div>

        
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
                    </a></div>
                 <%}
                  
                  
                  
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
                        function myFunction1() {
  // Get the snackbar DIV
  var x = document.getElementById("snackbar");

  // Add the "show" class to DIV
  x.className = "show";

  // After 3 seconds, remove the show class from DIV
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}
                        </script>
<c:remove var="addCart" scope="session" />  
                   
                 </c:if>
    </body>
</html>




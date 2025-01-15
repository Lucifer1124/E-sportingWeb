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
            
            </style>
        
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Latest</title>
        <%@include file="ALLCSS/ALLCSS.jsp" %>
       
    </head>

    <body>
        <%@include file="ALLCSS/navbar.jsp" %>
        

        <section id="product1" class="section-p1">
            <h2>Latest Equipments</h2>
            <p>checkout the equipments </p>
            <div class="pro-container">
                <%
                  ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                  
                  List<Items> list=dao.getAllLatestItem();
                  for(Items i:list){%>
                  <a href="view.jsp?id=<%=i.getItem_id()%>"><div class="pro">
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
                      </div></a>
                 <%}
                  
                  
                  
                  %>
                
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



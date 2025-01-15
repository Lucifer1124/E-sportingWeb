<%@page import="java.util.List"%>
<%@page import="com.entity.Comments"%>
<%@page import="com.entity.item_order"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.entity.Items"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="ALLCSS/ALLCSS.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
          <!-- style.css  -->
    <link rel="stylesheet" href="./css/style.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <!-- fontawesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
        integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ=="
        crossorigin="anonymous" />
         </head>
          <%@include file="ALLCSS/navbar.jsp" %>
         <body> <c:if test ="${empty userobj}">
            <c:redirect url="login.jsp"/>
                 </c:if>
         <%
                    String x=request.getParameter("id");
                    
                     int id=Integer.parseInt(x);
                     ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                     Items i=dao.getItemDetails(id);
                     
                     
                     item_order o=dao.OrderById(u.getId());
                     List<Comments> com=dao.getComments(id);
                     
                     
                     
                    
                    %>
      
                    <c:if test ="${not empty notenough}">
                     <h6  class="text-center text-danger">${notenough}</h6>
                    
                     <c:remove var="notenough" scope="session"/>
            </c:if>
            <div class="row rounded"
                style="box-shadow: 0px 0px 15px 0.5px grey; border-width:0.1rem; padding: 3.5rem; width:1100px; margin-left: 12%; margin-top: 100px;">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="carouselExampleIndicators" class="carousel slide shadow rounded"
                                data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="item-img/<%= i.getPhoto() %>"  style="height: 300px;" class="d-block w-100 img img-fluid rounded view"
                                            alt="image">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="item-img/<%= i.getPhoto() %>" class="d-block w-100 img img-fluid rounded view "
                                            alt="image">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="item-img/<%= i.getPhoto() %>" class="d-block w-100 img img-fluid rounded view "
                                            alt="image">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="item-img/<%= i.getPhoto() %>" class="d-block w-100 img img-fluid rounded view"
                                            alt="image">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                    data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                    data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title mb-4">
                                <h3 style="color: #088178;"><%=i.getItem_name()%></h3>
                            </div>
                            <div class="category mb-4">
                                <span class="bg-light-gray p-2" style="color:grey;"><%=i.getBrand() %></span>
                            </div>
                            <div class="rating d-flex text-danger mb-4">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="price mb-4">
                                <b style="color: #088178;"><span class="mr-1" >₹</span><span><%=i.getPrice()  %>.00</span></b>
                            </div>
                            <div class="desc ">
                                <p>
                                    <%=i.getDescription()%>
                                  
                                </p>
                            </div>
                            
                                        <h3 class="text-danger"><%=i.getStock() %> left in the stock<h3>
                            <%
                            if(i.getStock()>0)
                            {%>
                            <div class="buy">
                                <a href="cartservlet?item_id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>" class="btn btn-primary shadow"><i class="fa-solid fa-cart-plus"></i>Add to Cart</a> <a href="buynow.jsp?id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>" class="btn btn-success shadow"><i class="fa-solid fa-cart-shopping"></i>Buy Now</a>
                            </div>
                            <%}
                            %>
                        </div>
                    </div>
                </div>
            </div>
                                    <div class="row rounded"
                style="box-shadow: 0px 0px 15px 0.5px grey; border-width:0.1rem; padding: 3.5rem; width:1100px; margin-left: 12%; margin-top: 100px; margin-bottom: 50px;">
                                      <div style="padding-bottom: 100px;">
                              <%
                              int w=0;
                              for(Comments cm:com)
                              {
                              w++;
                              }
                              %>
                                 <h4   style="margin-bottom: 8%; color:darkslateblue">Reviews(<%=w%>)</h4>
                                 <div style="margin-left: 5%;width :90%;">
                                    
                                     <% 
                                     for(Comments cm:com)
                                     {%>
                                    <h5 style=" color:cyan;"> <i class="fa-regular fa-user" style="margin-left: 6.5px;"></i>  <%=cm.getName()%></h5>
                                     <p style="margin-left:3%;"><%=cm.getComment() %></p>
                                     <%}
                                     
                                     %>
                                     
                                     
                                                                      
                                 </div>
                            </div>
                                    </div>
                                   
                                  
                                     
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



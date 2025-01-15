
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminPage</title>
         <%@include file="ALLCSS.jsp" %>
         <link rel="stylesheet" href="style.css">
          <style>
              
              a{
                  text-decoration: none;
              }
              p{
                  text-decoration: none;
                  color:black;
              }
              .Latest{
    width:100%;
    display:grid;
    grid-template-columns: 25% 25% 25% 25%;
    height: 600px;
    
    align-items: center;
}
.container:hover{
  box-shadow: 0px 0px 15px 0.5px grey; border-width:0.1rem;
   transition:0.5s;
   text-decoration: none;
   border-radius:5%;
    p{
                  text-decoration: none;
                 
              }
    
    
}
         </style>
    </head>
    <body>
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
       
       
            
            
            
        <div class="container-fluid back-img" style="
             display:flex;
             align-items: center;">
            <div class="Latest">
                <a href="addbooks.jsp"><div class="container" style="margin-left: 5%;">
                      <div><i class="fa-solid fa-square-plus fa-10x text-success " style="width: 200px;height: 200px; border-radius: 10px; margin-left: 29%; margin-top: 10%; 
                               "></i></div>
                      <div><p style="text-align:center; padding-bottom: 5%;">Add items<p></div>
                          
                  </div></a>
                <a href="allitems.jsp"><div class="container">
                      <div><i class="fa-solid fa-list-check fa-10x text-danger" style="width: 200px;height: 200px; border-radius: 10px; margin-left: 28%; margin-top: 10%;
                              "></i></div>
                      <div><p style="text-align:center;  padding-bottom: 5%;">All Items<p></div>
                          
                  </div></a> 
              
                <a href="AllOrders.jsp"><div class="container">
                      <div><i class="fa-solid fa-box-open fa-10x text-warning" style="width: 200px;height: 200px; border-radius: 10px; margin-left: 22%; margin-top: 10%;
                               "></i></div>
                      <div><p style="text-align:center;  padding-bottom: 5%;">All Orders<p></div>
                          
                  </div></a>
                <a  href="CancelRequests.jsp"><div class="container">
                      <div><i class="fa-solid fa-circle-xmark fa-10x text-primary" style="width: 200px;height: 200px; border-radius: 10px; margin-left: 28%; margin-top: 10%;
                              "></i></div>
                      <div><p style="text-align:center;  padding-bottom: 5%;">Cancel Requests<p></div>
                          
                  </div></a>
                    
                 
              </div>
            
            
            
       
           
      
       
    </body>
</html>

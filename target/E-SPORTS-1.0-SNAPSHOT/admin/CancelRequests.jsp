<%-- 
    Document   : CancelRequests
    Created on : 22 Nov 2024, 12:29:57 am
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.CancelRequests"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Requests</title>
         <%@include file="ALLCSS.jsp" %>
         <style>tr:hover{
            box-shadow: 0px 0px 15px 0.5px grey; 
            transition:  0.3s;
        }</style>
    </head>
    <body style="background-image: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);">
         
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
        <section id="cart" class="section-p1">
        <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Action</th>
      
    </tr>
  </thead>

        <%
        ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
        List<CancelRequests> list=dao.getCR();
        for(CancelRequests cr:list)
        {%>
       
  <tbody>
    <tr>
      
      <td><%=cr.getOrder_id()%></td>
      <td><a  href="../cr?id=<%=cr.getOrder_id()%>"  class="btn btn.sm btn-danger imghover">Cancel</a></td>
      
    </tr>
 
        <%}
        %>
         </tbody>
</table>
         </section>
    </body>
</html>

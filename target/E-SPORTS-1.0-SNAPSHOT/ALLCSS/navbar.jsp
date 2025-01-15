<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test ="${empty userobj}">
            <c:redirect url="login.jsp"/>
                 </c:if>
<%
        User u=(User)session.getAttribute("userobj");
        
        %>
       
        <style>
         .sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 2;
  top: 0;
  right: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
  position: fixed;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
         
 <section id="header" style="background:white;">
          <i class="fa-solid fa-futbol fa-2x" ></i>
          

         
            <div>
                <ul id="navbar">
                    
                    <li><a  href="index.jsp"><i class="fa-solid fa-house-chimney"></i>Home</a></li>
                    <li><a href="Trending.jsp"><i class="fa-solid fa-arrow-up-right-dots" style="margin-right: 2px;"></i>trending</a></li>
                    <li><a href="Latest.jsp"><i class="fa-regular fa-clock"  style="margin-right: 2px;"></i>latest</a></li>
                    <%
                    if(u.getEmail().equals("adminlogin@gmail.com"))
                    {%>
                    <li class="nav-item">
          <a class="nav-link" aria-current="page"  href="admin/AdminHome.jsp"><i class="fa-solid fa-house-chimney"></i>adminHome</a>
        </li>
                    <%}
                    %>
                    
                    
                    
                <c:if test="${ not empty userobj}">
                    <li><a href="showCart.jsp"><i class='bx bx-shopping-bag' ></i></a></li>
                <i id="bar" class='bx bx-menu' onclick="openNav()"></i>
                </c:if>
                 <c:if test="${empty userobj}">
                     <li><a href="login.jsp"><i class='bx bx-shopping-bag' ></i></a></li>
                <i id="bar" class='bx bx-menu' onclick="openNav()"></i>
                </c:if>
                
            
                </ul>
               
            </div>
      
            <div id="mobile">
                <a href="cart.html"><i class='bx bx-shopping-bag' ></i></a>
                <i id="bar" class='bx bx-menu'></i>
            </div>
        </section>
        <section id="header" style="  background-image: linear-gradient(to right,darkgrey 0%, black 65%); z-index: 999;border:none; 
  position: sticky;">
            

            <div>  <form action="SearchResult.jsp" method="post">
                 <ul id="navbar" >
                    
                   <li><input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search" style="width:400px; display:inline-block; margin-left: 320px; margin-right:0px" name="ch"> </li><li><button class="btn btn-primary my-2 my-sm-0 " style="background-color: black;" type="submit">Search</button></li>
                    <c:if test="${not empty userobj}">
                    <li><a href=""><button class=" btn btn-success"><i class="fas-fa-user"></i><%=u.getName()%></button></a> <a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary  bgg"><i class="fa-solid fa-right-from-bracket"></i>logout</a></li>
               
               
           
            </c:if>
               <c:if test="${empty userobj}">
                   <li><a href="login.jsp"><button class=" btn btn-success"><i class="fas-fa-user"></i>login</button>   <a href="register.jsp"><button class="btn btn-primary"><i class="fa-solid fa-right-from-bracket fa-text-primary "></i>SignUp</button></a></li>
                    
                    <li></li>
                    </c:if>
                    
                    
                    
                   
                </ul>
                    </form> 
               
            </div>
      <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">About</a>
  <a href="MyOrders.jsp?id=<%=u.getId()%>">MyOrders</a>
  <a href="#">Clients</a>
  <a href="#">Contact</a>
</div>
            
        </section>
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Do you want to logout?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="logout"><button type="button" class="btn btn-primary">Logout</button></a>
      </div>
    </div>
  </div>
</div>
        <script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

</script>
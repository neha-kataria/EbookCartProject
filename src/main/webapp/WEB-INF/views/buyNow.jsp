<%-- 
    Document   : buyNow
    Created on : 24 Nov, 2016, 3:47:15 PM
    Author     : neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
         <div class="shell" >
            
             
            <hr style="width: 100%">
            <br>
<!--             <h1 style="margin-left: 10%"> Hello ${logged_user}
             </h1>-->
             <img style="margin-left: 35%" src="assets/product/${selected.thumb_name}">
             <br>
             <br>
             
             <div style="color: #00aeef; font-size: 26px; margin-left: 40%">Rs ${selected.price}</div>>
            <input type="button" value="Pay Now" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 20%; margin-top: 10%">
             <br><br>
             <div><br><br><br><br><br><br>
             <br><br></div>
         </div><!-- end of div shell class -->
         
         
           <%@include file="footer.jsp" %>
    </body>
</html>

<%-- 
    Document   : addToCart
    Created on : 24 Nov, 2016, 2:59:38 PM
    Author     : neha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add To Cart</title>
        <style>

            #container {
                width: 100%;
           
                margin: auto;
                height: auto;
            }
            #first {
                width: 50%;
                float: left;
               
            }
            #second {
                width: 50%;
                float: left;

              
            }
            #clear {
                clear: both;
            }
        </style>

       
    </head>
    <body >

        <%@include file="header.jsp" %>

        <div class="shell" style="height:600px">
            <hr style="width: 100%">
            <h2 style="color: black">In Your Cart</h2>
            
            <br><br>
            <div>
                <table border="2" style="width: 100%;">
                    <thead>
                    <th>Product Name</th><th>Quantity</th>
                    </thead>
                    <c:forEach items="${addtocartlist}" var="atclist">
                    <tr><td>
                            <c:out value="${atclist.product_id}" />
                        </td>
                        <td>
                           <c:out value="${atclist.quantity}" />
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>


           <br><br>
           <div>
               <input type="button" value="Checkout" onclick="window.location.href='/EbookCart/checkout'">
           </div>
        </div>  <!-- shell tag ending -->
       <div style="margin-left: -6.5%">
            <%@include file="footer.jsp" %></div>


    </body>
</html>

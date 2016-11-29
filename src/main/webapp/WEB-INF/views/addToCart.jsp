<%-- 
    Document   : addToCart
    Created on : 24 Nov, 2016, 2:59:38 PM
    Author     : neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            #container {
                width: 100%;
                /*background-color: #ffcc33;*/
                margin: auto;
                height: auto;
            }
            #first {
                width: 50%;
                float: left;
                /*height: 300px;*/
                /*background-color: blue;*/
            }
            #second {
                width: 50%;
                float: left;

                /*height: 300px;*/
                /*background-color: green;*/
            }
            #clear {
                clear: both;
            }
        </style>

       
    </head>
    <body >

        <%@include file="header.jsp" %>

        <div class="shell">
            <hr style="width: 100%">
            <h2 style="color: black">In Your Cart</h2>


            <div id="container">
                <div id="first">
                    <div class="products">
            <h3>Featured Products</h3>
            <ul>
                <c:forEach items="${prod_list}" var="prod">
                <li>
                    <div class="product">
                        <!--<a href="#" class="info">-->
                        <div class="info">
                            <span class="holder" >
                                <img src="<c:out value="assets/product/${prod.thumb_name}" />" alt="" />
                                <span class="book-name"><c:out value="${prod.productName}" /></span>
                                <span class="author">Available quantity : <c:out value="${prod.availQuant}" /></span>
                                <span class="description"><c:out value="${prod.shortDesc}" /></span>
                            </span>
                        
                            <a href="/EbookCart/bookDetail?prod_name=${prod.productName}">
                            <div  class="buy-btn">BUY NOW <span class="price"><span class="low"></span><c:out value="${prod.price}" /></span></div></a>
                    <!--</a>-->
                        </div>
                    </div>
                </li>
     </c:forEach>
            </ul>
            <!-- End Products -->
        </div>
                </div>
                <div id="second" >
                    <input type="button" value="Buy Now" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 20%">
                    <input type="button" value="Login To Buy" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 20%; margin-top: 10%">
                    <input type="button" value="Add To Cart" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 20%; margin-top: 10%">
                </div>

                <div id="clear"></div>
            </div>



        </div>  <!-- shell tag ending -->
        <%@include file="footer.jsp" %>

    </body>
</html>

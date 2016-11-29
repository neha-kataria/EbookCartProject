<%-- 
    Document   : addToCartPage
    Created on : 10 Nov, 2016, 12:34:14 PM
    Author     : neha
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!--<link rel="stylesheet" href="resources/css/homepgcontent.css" type="text/css" media="all" />-->
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
        <title>JSP Page</title>
    </head>
    <body >
        
        <%@include file="header.jsp" %>
        
        <div class="shell">
      <hr style="width: 100%">
            <h2 style="color: black">${selected.productName}</h2>
            
         
<div id="container">
    <div id="first"><img src="assets/product/${selected.thumb_name}" alt="" />
                                <br>
                                <span style="font-size: 22px; color: #0871b3; font-weight: bold">${selected.productName}</span>
                                <br>
                                <span style="font-size: 16px; color: #34c4da; font-weight: bold">Available quantity : ${selected.availQuant}</span>
                                &nbsp;&nbsp;&nbsp;
                                <span style="font-size: 16px; color: #34c4da; font-weight: bold" >BUY NOW @ ${selected.price}</span>
                                <br><br>
                                <span style="font-size: 16px;  font-weight: bold">${selected.shortDesc}"</span>
                                <br><br>
                                <br>
                                 <span style="font-size: 14px; ">${selected.longDesc}</span>
                                 <br>
                                 
                                 <br>
                                 </div>
    <div id="second" >
        <input type="button" value="Buy Now" onclick="location.href='/EbookCart/buyNow?prod_name=${selected.productName}'" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 20%">
        <input type="button" value="Login To Buy" onclick="location.href='/EbookCart/login?buy=1'" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 20%; margin-top: 10%">
        <input type="button" value="Add To Cart" onclick="location.href='/EbookCart/addToCart'" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 20%; margin-top: 10%">
    </div>
        
    <div id="clear"></div>
</div>
            
            
<!--        <div class="info">
            <div style="width:75%;float: left;">
                            <span class="holder" style="width: 20%" >
                                <img src="assets/product/${selected.thumb_name}" alt="" />
                                <br>
                                <span class="book-name">${selected.productName}</span>
                                <br>
                                <span class="author">Available quantity : ${selected.availQuant}"</span>
                                <br>
                                <span class="description">${selected.shortDesc}"</span>
                                <br>
                                 <span>${selected.longDesc}</span>
                            </span>
          
                            <a href="/EbookCart/addToCart?prod_name=${prod.productName}">
                            <div  class="buy-btn">BUY NOW <span class="price"><span class="low"></span>${selected.price}</span></div>
                    </a>
                      </div>
                        </div>
                    <div style="width: 25%">
                        <h1>BUY NOW</h1>
                    </div>
        -->
        
        
        
        </div>  <!-- shell tag ending -->
        <%@include file="footer.jsp" %>
       
    </body>
</html>

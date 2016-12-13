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
                height: 450px;
                /*background-color: threedhighlight;*/
            }
            #second {
                width: 50%;
                float: left;
                height: 450px;
                /*height: 300px;*/
                /*background-color: green;*/
            }
            #clear {
                clear: both;
            }
        </style>
        <script>
           // document.cookie="product_name=${selected.productName}";
           
        </script>
        <title>Buy Now</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="shell" style="height: auto" >
            
             
            <hr style="width: 100%">
            <br>
<!--             <h1 style="margin-left: 10%"> Hello ${logged_user}
             </h1>-->

<div id="container" >
    <div id="first">
        <br><br><br>
             <img style="margin-left: 20%" src="assets/product/${selected.thumb_name}">
             <br>
    </div>
             
             <div id="second" >  
                 <!--<form action="/EbookCart/login?buy=1" method="GET">-->
                 <div style="background-color: #79C3DF; margin-top: 20%">
                     <br><br>
             <div style="color: whitesmoke; font-size: 26px; margin-left: 40%; ">Rs ${selected.price}</div>
             <!--<input type="email" placeholder="type email id here" name="shipping_email" id="shipping_email" style="background-color: whitesmoke; width: 60%;height: 50px; font-size: 20px; margin-left: 20%; margin-top: 10%">--> 
             <br>
             <input type="hidden" value="${selected.price}" id="price">
             <label style="font-size: 16px;margin-left: 10%">Quantity to be ordered:</label><input type="number" onchange="totalbill()" value="1" id="quantity" style="height: 20px">
             <br><br>
             <label style="font-size: 16px;margin-left: 10%" id="totalbill">Your Total Amount: Rs ${selected.price}</label>
             <script>

function totalbill(){
    var cost=document.getElementById('price').value;
   // alert(cost);
    var n=document.getElementById('quantity').value;
    document.getElementById('totalbill').innerHTML="Your Total Amount:"+(cost*n);
}
                 function setCookie(ele) { 
                                
                                
                                var d = new Date();
                                d.setTime(d.getTime() + (2*60*60*1000));
                                 var expires = "expires="+ d.toUTCString();
                                 document.cookie="quant="+document.getElementById('quantity').value;
                                 if(ele=='1')
                                window.location.href="/EbookCart/login?buy=1";
                                else
                                    window.location.href="/EbookCart/checkout";
                                
                                }
                 
                 
                //  document.cookie="quantity="+document.getElementById('quantity').value;
                // var x=document.cookie;alert(x);
                              </script>
                              <% String user= (String)session.getAttribute("logged_user");
                              if(user.equals("Guest")){
                              %>
             <input type="button" value="Login To Buy" onclick="setCookie(1);" style="background-color: whitesmoke; width: 60%;height: 50px; font-size: 20px; margin-left: 20%; margin-top: 10%">
             <% }else { %>
             <input type="button" value="Checkout" onclick="setCookie(2);" style="background-color: whitesmoke; width: 60%;height: 50px; font-size: 20px; margin-left: 20%; margin-top: 10%">
             <% }%>
             <br><br><br>
                 </div> 
                 <!--</form>-->
             </div>
            <br><br>
            <br><br><br><br><br><br>
             <br><br></div>
            
             <div id="clear"></div>
             <br><br><br><br><br><br><br><br>
         </div><!-- end of div shell class -->
         
         <div style="margin-left: -6.5%">
            <%@include file="footer.jsp" %></div> 
    </body>
</html>

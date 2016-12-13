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
        <title>Book Detail</title>
    </head>
    <body >

        <%@include file="header.jsp" %>

        <div class="shell">
            <hr style="width: 100%">
            

            <br>
            <div id="container" >
                <div>
                <div id="first" ><img src="assets/product/${selected.thumb_name}" width="200" alt="" style="margin-left: 25%;"/>
                    <br><br>
                    <span id="prodname" style="font-size: 22px; color: #0871b3; font-weight: bold; margin-left: 35%">${selected.productName}</span>
                    <br>
                    <span style="font-size: 16px; color: #34c4da; font-weight: bold;margin-left: 15%">Available quantity : ${selected.availQuant}</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span style="font-size: 16px; color: #34c4da; font-weight: bold" >BUY NOW @ ${selected.price}</span>
                    <br><br>
                    <!--<span style="font-size: 16px;  font-weight: bold">${selected.shortDesc}"</span>-->
                    <input type="hidden" value="${logged_user}" id='user'>


                    <br>
                </div>
                    <script>
//                        function askquant(){
//                           
//                            document.getElementById('askq').innerHTML="Quantity to be ordered:";
//                            
//                            
//                        }

function getValue(){
               var retVal = prompt("Enter quantity of this product : ", "enter here");
             //  document.write("You have entered : " + retVal);
              var s=document.getElementById('prodname').innerHTML;
             document.cookie="quant="+retVal;
             alert(document.cookie);
             var nm=document.getElementById('user').value;
             //alert(nm);
             if(nm=='Guest')
             window.location.href = '/EbookCart/login?prod_name='+s+'&buy=2';
         else
             window.location.href = '/EbookCart/addToCart?prod_name='+s+'&buy=2';
            }
                    </script>
                <div id="second">
                    <div style=" width: 90%; margin-top: 20%; background-image: url(resources/images/footer.png)" >
                        <br><br><br>
                    <input type="button" value="Buy Now" onclick="location.href = '/EbookCart/buyNow?prod_name=${selected.productName}'" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 30%; ">

                    <input type="button" value="Add To Cart" onclick="getValue();" style="background-color: whitesmoke; width: 50%;height: 50px; font-size: 20px; margin-left: 30%; margin-top: 10%">
                    <br><br><br>
                    <!--<label style="font-size: 16px;margin-left: 10%" id="askq"></label><input type="number" onchange="totalbill()" value="1" id="quantity" style="height: 20px">-->
                    
                    </div>
                </div>
                </div>
                <br><br><br><br><br><br><br><br><br>
                <div >
                  <span style="font-size: 16px;  font-weight: bold">${selected.shortDesc}"</span>
                  <br><br><br>
                  
                    <span style="font-size: 16px;" >${selected.longDesc}</span>
                    <br>
                </div>
                <br><br><br>
                <div id="clear"></div>
            </div>






        </div>  <!-- shell tag ending -->
        <%--<%@include file="footer.jsp" %>--%>
        <div style="margin-left: -6.5%">
            <%@include file="footer.jsp" %></div>

    </body>
</html>

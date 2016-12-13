<%-- 
    Document   : homepagedemo2
    Created on : 9 Dec, 2016, 9:53:47 AM
    Author     : neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/myhomepage.css" type="text/css" media="all">
        <link href="resources/css/custom.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="resources/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <title>JSP Page</title>

        <script>
            function ajaxcall(el) {
                //   alert($(el));
                var catg = $(el).attr('id');
                catg = catg.replace("_", " ");
                // alert(catg);
                $.ajax({
                    type: "GET",
                    url: "SelectCatg",
                    data: {'name': catg},
                    dataType: 'json',
                    success: function (data)
                    { //alert(data.length);
                        $('#heyo').html("");


                        $.each(data, function (i, item) {
                            
                            $('#heyo').append("<li style='color:black'><a href='/EbookCart/bookDetail?prod_name=" + item.productName + "&log_buy=0'  ><div class='product' id='insideproduct' >" +
                                    "<div class='info' id='book_info' >" + "<img src='assets/product/" + item.thumb_name + "' alt='img' >" +
                                    "<span class='book-name' id='book-name' style='color:black'>" + item.productName + "</span>" +
                                    "<span class='avail_quant' style='color:blue'>Available quantity:" + item.availQuant + "</span></div></div></a></li>");

                        });

                    }
                });
            }

            $(document).ready(function catgAjaxCall() {
                $.ajax({
                    type: "GET",
                    url: "SideMenu",
                    data: {},
                    dataType: 'json',
                    success: function (data)
                    { 
                        $.each(data, function (i, item) {

                            var s = item.categoryName;
                            s = s.replace(" ", "_");

                            $('#side').append("<li ><span><a onclick='ajaxcall(this);' style='color:#0182b5' id=" + item.categoryName + ">" + "<i class='fa fa-align-justify'></i>" + item.categoryName + "</a>" +
                                    "<a onclick='subcatgAjaxCall(this);' style='color:#0182b5' id=" + item.categoryName + "><span class='fa fa-chevron-down' style='width:3px;height:3px' ></span></a></span>" +
                                    "<ul id='addhere_" + item.categoryName + "'></ul></li>");
                          

                        });
                    }
                });
                product();

            })

            function product() {
                $.ajax({
                    type: "GET",
                    url: "ProductListing",
                    data: {},
                    dataType: 'json',
                    success: function (data)
                    {
                        $('#heyo').html("");
                        $.each(data, function (i, item) {

                            $('#heyo').append("<li style='margin-left:5%'><a href='/EbookCart/bookDetail?prod_name=" + item.productName + "&log_buy=0'><div class='product' id='insideproduct' >" +
                                    "<div class='info' id='book_info' >" + "<img src='assets/product/" + item.thumb_name + "' alt='img' >" +
                                    "<span class='book-name' id='book-name' style='color:blue; margin-left:10px;'>" + item.productName + "</span>" +
                                    "<span class='avail_quant' style='color:blue; margin-left:10px;'>Available quantity:" + item.availQuant + "</span>"+
                                    "<div  class='buy-btn' style='bottom:10px; left:20px;'>Rs <span class='price' style='color: black'><span class='low'></span>"+
                                    item.price+"</span></div>"+
                                        "</div></div></a></li>");

                        });
                    }
                });

            }




            function subcatgAjaxCall(el) {

                $.ajax({
                    type: "GET",
                    url: "SideMenuSubCatg",
                    data: {'name': $(el).attr('id')},
                    dataType: 'json',
                    success: function (data)
                    { //alert(data);
                        var s = "#addhere_" + $(el).attr('id');
                        $(s).html("");

                        $.each(data, function (i, item) {
                            var s2 = item.subcategoryName;
                            s2 = s2.replace(" ", "_");


                            $(s).append("<li style='margin-left:15%;' ><a onclick='ajaxcall(this);' style='color:#0182b5' id=" + s2 + ">" + item.subcategoryName + "</a></li>");

                        });
                    }
                });
            }

        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- main body -->
        <div style="background-image: url(resources/images/shell.png);width: 881px;height:1200px ; margin: 0 auto;padding: 0 50px 0 60px; position: relative;">
            <!-- Sidebar -->
         

            <div id="sidebar" style="font-size: 16px; line-height: 24px;">
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section"  >
                        <!--<h3 style="color: #015faa">Category</h3>-->


                        <!--<h3>Categories</h3><hr>-->  
                        <h5 style="color: #0182b5; margin-top: 45%; line-height: 26px;font-size: 18px;" >   
                            <i class="fa fa-edit" style="color: #0066cc; "></i><a onclick="catgAjaxCall();">Categories</a> <span class="fa "></span></h5>

                        <div >
                            <ul class="nav side-menu" id="side">
                                <li>
                                    <div id="child"></div>
                                </li>

                            </ul>






                        </div>



                    </div></div>
              
            </div>
            <!-- End Sidebar -->



            <!--<input type="button" value="click here" onclick="ajaxcall();" >-->
            <br>
            <!--<div id="itemslist">-->
            <div id="content">
                <div class="products" >
                    <div style="color:red">${exception}</div>
                    <h3>Featured Products</h3>
                    <br>
                    <div>
                        <ul id="heyo" style="color: white;font-size: 20px; "> 


                        </ul>

                    </div>
                </div>
            </div>

        </div> <!-- main body end tag -->
        <div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>

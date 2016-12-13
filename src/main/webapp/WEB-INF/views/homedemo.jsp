<%-- 
    Document   : home
    Created on : 5 Nov, 2016, 10:37:56 PM
    Author     : neha
--%>
<%@page import="com.mindfire.dao.AddProductDAO"%>
<%@page import="com.mindfire.bean.ProductBean"%>
<%@page import="com.mindfire.bean.CategoryBean"%>
<%@page import="com.mindfire.service.AddSubCategoryImpl"%>
<%@page import="com.mindfire.bean.SubCategoryBean"%>
<%@page import="java.util.List"%>
<%@page import="com.mindfire.dao.AddSubCategoryDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>




        <link rel="stylesheet" href="resources/css/homepgcontent.css" type="text/css" media="all" />
        <link rel="shortcut icon" href="resources/css/images/favicon.ico" />

        <link href="resources/css/custom.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="resources/css/font-awesome.min.css" rel="stylesheet">

        <!-- Bootstrap -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="resources/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="resources/css/nprogress.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="resources/css/blue.css" rel="stylesheet">
        <!-- bootstrap-progressbar -->
        <link href="resources/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
        <!-- JQVMap -->
        <link href="resources/css/jqvmap.min.css" rel="stylesheet"/>
        <!-- bootstrap-daterangepicker -->
        <link href="resources/css/daterangepicker.css" rel="stylesheet">


        <!--[if IE 6]>
                <script type="text/javascript" src="js/png-fix.js"></script>
        <![endif]-->
        <script>
            function setvalues(element) {
                //   document.getElementById(element).innerHTML="hello there
                //    document.getElementById(element).getElementByClassName("product").getElementByClassName("info").getE
                document.getElementById('texthere').innerHTML = "NEHA";
                var s = document.getElementById('texthere');
                //s.create("h2");
                //     var para=document.createElement("h2");
                // var node = document.createTextNode("This is a new paragraph.");
                // para.appendChild(node);
//        para.innerHTML="hello this is h2";
//        para.value="cdgcydgc";
//        s.appendChild(para);
//        

                var para = document.createElement("div");
                var node = document.createTextNode("This is new.");
                para.appendChild(node);
                var span1 = document.createElement("img");
                var span2 = document.createElement("p");
                var node2 = document.createTextNode("This is new 2.");
                span2.appendChild(node2);
                para.appendChild(span2);
                span1.setAttribute("src", "resources/images/ebookcart.png");
                para.appendChild(span1);
                var element1 = document.getElementById('texthere');
                element1.appendChild(para);
//AddProductImpl productDao=new AddProductImpl();
//List<ProductBean> prod_list_catg = productDao.prod_list("Fiction");
//alert(prod_list_catg.size());
                alert("wrkng");
                var bookname = document.createElement("p");
                var bookprice = document.createElement("p");
//for(int i=0;i<prod_list_catg.size();i++){
//    bookname.appendChild(document.createTextNode("This is new 3."));
//    element1.appendChild(bookname);
//}



            }
        </script>


        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <jsp:include page="header.jsp" />
        </div>

        <!-- Main -->
        <!-- Custom Theme Scripts -->


        <div id="main" class="shell" >
            <a onclick="setvalues('texthere')"> click</a>
            <!-- Sidebar -->

          
                <!--<div class="cl">&nbsp;</div>-->
                <!-- Best-sellers -->
                <div id="best-sellers">
                    <div id="texthere" >Hello </div>
                    <input type="button" value="click" onclick="setvalues('texthere')">

                </div>
                <!-- End Content -->
              
            <div>
                <input type="button" value="click here" onclick="ajaxcall();" >
                
                <!--<div id="itemslist">-->
                    <div id="content">
                        <div class="products" >
                            <h3>Featured Products</h3>
                            <div>
                                 <ul id="heyo" style="color: white;font-size: 20px; "> 
            </ul>
                                
                            </div>
                     </div></div>          
                                   
                </div>
            </div>
            <!-- End Main -->
           
                <!--</div>-->
                  <div class="cl">&nbsp;</div>
            <div>
                <div class="cl">&nbsp;</div>
                <jsp:include page="footer.jsp" />
            </div>


            <!-- jQuery -->
            <script src="js/jquery-1.10.1.js" type="text/javascript"></script>


            <!-- Bootstrap -->
            <script src="resources/js/bootstrap.min.js"></script>
            <!-- Custom Theme Scripts -->
            <script src="resources/js/custom.min.js"></script>
            <!-- FastClick -->
            <script src="resources/js/fastclick.js"></script>
            <script type="text/javascript" src="resources/js/jquery-1.6.2.min.js"></script>
            <script type="text/javascript" src="resources/js/jquery.jcarousel.min.js"></script>
            <script type="text/javascript" src="resources/js/functions.js"></script>

    </body>
</html>

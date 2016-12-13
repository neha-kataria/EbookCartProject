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
        <link rel="stylesheet" href="resources/css/homepgcontent.css" type="text/css" media="all" />
        <link rel="shortcut icon" href="resources/css/images/favicon.ico" />
        <!--        <script type="text/javascript" src="resources/js/jquery-1.6.2.min.js"></script>
                
                <script type="text/javascript" src="resources/js/jquery-1.8.2.js"></script>
                <script type="text/javascript" src="resources/js/jquery.jcarousel.min.js"></script>-->

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
         function setvalues(){
          //   document.getElementById(element).innerHTML="hello there
      //    document.getElementById(element).getElementByClassName("product").getElementByClassName("info").getE
         // document.getElementsById("book-name").innerHtml="NEHA";
         var s=document.getElementsById("productdisplay");
         var para=s.create("p");
         var node = document.createTextNode("This is a new paragraph.");
         para.appendChild(node);
        s.appendChild(para);
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

            <!-- Sidebar -->
            <% List<CategoryBean> catg_list = (List<CategoryBean>) request.getAttribute("catg_list");

            %>
            <div id="sidebar">
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section" >
                        <!--<h3 style="color: #015faa">Category</h3>-->
                      

                                <!--<h3>Categories</h3><hr>-->  
                                <h5 style="color: #0182b5; margin-top: 20%;" >    <i class="fa fa-edit" style="color: #0066cc"></i>Categories <span class="fa "></span></h5>
                                
                         <div >
                                <ul class="nav side-menu" >
                            
                            
                       

                            <c:forEach items="${catg_list}" var="catg">
                                  <li>
                                    <c:set var="selectedcatg" scope="page" value="${catg.categoryName}"/>
                                       <!--<div style="color:#383838; font-size: 14px; width:100%;">-->
                                      
                                    <a> 
                                  
                                     
                                      <i class="fa fa-align-justify"></i>
                                          
                                        <c:out value="${catg.categoryName}" />
                                  
                                        <span class="fa fa-chevron-down" ></span>
                            <!--</div>-->
                                    </a>
                                        <a href="/EbookCart/SelectCategory?category=<c:out value="${catg.categoryName}" />" ></a>   
                                  
                               
<!--                            <a>       <span class="fa fa-chevron-down"></span>
                                    </a>-->
                                       <!--</div>-->          
                                    
                                    <%                                            // AddSubCategoryDAO subCategoryDao=(AddSubCategoryDAO)request.getAttribute("subCategoryDaoObject");
                                        String name=(String)pageContext.getAttribute("selectedcatg");
                                        AddSubCategoryDAO subCategoryDao = (AddSubCategoryDAO) request.getAttribute("subCategoryDaoObject");
                                        List<SubCategoryBean> sub_list = subCategoryDao.list(name);
                                        System.out.println(sub_list.get(0).getSubcategoryName());
                                       
                                        //set prod_list here........inside this java
                                        AddProductDAO productDao= (AddProductDAO)request.getAttribute("productDaoObject");
   
                                   //    List<ProductBean> prod_list_catg = productDao.prod_list("Fiction");
                                    //   System.out.println(">>+"+prod_list_catg.get(0).getProductName());
                                     //   session.setAttribute("prod_list", prod_list_catg);
                                        
                                    %>
                                   
                                    <ul class="nav child_menu" >
                                        <%--<c:forEach items="${subcatg_list}" var="subcatg">--%>
                                         <% for(int i = 0; i < sub_list.size(); i++) { %>
                                        <li>
                                            <div style="color: red">
                                                <a style="text-decoration: none;line-height: 30px;" href="/EbookCart/SelectCategory?category=<c:out value="<%= sub_list.get(i).getSubcategoryName()%>" />">   <c:out value="<%= sub_list.get(i).getSubcategoryName()%>" /></a>
                                                
                                                <%--<c:out value="${subcatg.subcategoryName}" />--%>
                                            </div>
                                        </li>
                                        <% } %>
                                        <%--</c:forEach>--%>

                                    </ul>
                                        
                                    </li>
                            </c:forEach>
                        </ul>
                              </div>

                        <ul class="categories">
                            <li>

                                <!--<h3>Categories</h3><hr>-->  
                                <a><i class="fa fa-edit"></i>Category <span class="fa fa-chevron-down"></span></a>
                                <ul>

                                    <c:forEach items="${catg_list}" var="catg">
                                        <li><a href="/EbookCart/SelectCategory?category=<c:out value="${catg.categoryName}" />" ><c:out value="${catg.categoryName}" /></a></li>
                                        </c:forEach>
                                </ul>
                            </li>
                    </div></div>
                <ul>
                    <li>
                        <h3>Categories</h3>
                        <ul>
                            <li><a href="#">Fiction</a></li>
                            <li><a href="#">Non-Fiction</a></li>
                            <li><a href="#">Romance novel</a></li>
                            <li><a href="#">Thriller</a></li>
                            <li><a href="#">Horror</a></li>
                            <li><a href="#">Tragedy</a></li>
                            <li><a href="#">Satire</a></li>
                            <li><a href="#">Classic</a></li>
                            <li><a href="#">Mystery</a></li>
                            <li><a href="#">Fable</a></li>
                            <li><a href="#">Science Fiction</a></li>
                            <li><a href="#">Biography</a></li>
                            <li><a href="#">Autobiography</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!-- End Sidebar -->

            <!-- Content -->
            <div id="content">
                <!-- Products -->
                <div class="products">
                    <h3>Featured Products</h3>
                    <ul>
                        <c:forEach items="${prod_list}" var="prod">
                            <li id="productdisplay">
                                <div class="product">
                                    <!--<a href="#" class="info">-->
                                        <div class="info">
                                        <!--<span class="holder" >-->
                                        <a href="/EbookCart/bookDetail?prod_name=${prod.productName}&log_buy=0"><img src="<c:out value="assets/product/${prod.thumb_name}" />" alt="" /></a>
                                        <span class="book-name" id="book-name"><c:out value="${prod.productName}" /></span>
                                        <span class="avail_quant">Available quantity : <c:out value="${prod.availQuant}" /></span>
                                        <!--<span class="description"><c:out value="${prod.shortDesc}" /></span>-->
                                        <!--</span>-->

                                        <a href="/EbookCart/bookDetail?prod_name=${prod.productName}&log_buy=0">
                                            <div  class="buy-btn" style="bottom:15px; left:10px;">Rs <span class="price" style="color: seashell"><span class="low"></span><c:out value="${prod.price}" /></span></div></a>
                                        <!--</a>-->
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <!-- End Products -->
                </div>
                <div class="cl">&nbsp;</div>
                <!-- Best-sellers -->
                <div id="best-sellers">
                    <a onclick="setvalues()"> click</a>
<!--                    <p id="texthere" >Hello </p>
                    <a onclick="setvalues('texthere')">heyo</a>-->
                    <h3>Best Sellers</h3>
                    <ul>
                        <li>
                            <div class="product">
                                <a href="#">
                                    <img src="resources/images/image-best01.jpg" alt="" />
                                    <span class="book-name">Book Name </span>
                                    <span class="author">by John Smith</span>
                                    <span class="price"><span class="low">$</span>35<span class="high">00</span></span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="product">
                                <a href="#">
                                    <img src="resources/images/image-best02.jpg" alt="" />
                                    <span class="book-name">Book Name </span>
                                    <span class="author">by John Smith</span>
                                    <span class="price"><span class="low">$</span>45<span class="high">00</span></span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="product">
                                <a href="#">
                                    <img src="resources/images/image-best03.jpg" alt="" />
                                    <span class="book-name">Book Name </span>
                                    <span class="author">by John Smith</span>
                                    <span class="price"><span class="low">$</span>15<span class="high">00</span></span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="product">
                                <a href="#">
                                    <img src="resources/images/image-best04.jpg" alt="" />
                                    <span class="book-name">Book Name </span>
                                    <span class="author">by John Smith</span>
                                    <span class="price"><span class="low">$</span>27<span class="high">99</span></span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="product">
                                <a href="#">
                                    <img src="resources/images/image-best01.jpg" alt="" />
                                    <span class="book-name">Book Name </span>
                                    <span class="author">by John Smith</span>
                                    <span class="price"><span class="low">$</span>35<span class="high">00</span></span>
                                </a>
                            </div>
                        </li>

                        <li>
                            <div class="product">
                                <a href="#">
                                    <img src="resources/images/image-best03.jpg" alt="" />
                                    <span class="book-name">Book Name </span>
                                    <span class="author">by John Smith</span>
                                    <span class="price"><span class="low">$</span>15<span class="high">00</span></span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="product">
                                <a href="#">
                                    <img src="resources/images/image-best04.jpg" alt="" />
                                    <span class="book-name">Book Name </span>
                                    <span class="author">by John Smith</span>
                                    <span class="price"><span class="low">$</span>27<span class="high">99</span></span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- End Best-sellers -->
            </div>
            <!-- End Content -->
            <div class="cl">&nbsp;</div>
        </div>
        <!-- End Main -->



        <div>
            <div class="cl">&nbsp;</div>
            <jsp:include page="footer.jsp" />
        </div>


        <!-- jQuery -->
        <script src="resources/js/jquery.min.js"></script>
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

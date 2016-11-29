<%-- 
    Document   : home
    Created on : 5 Nov, 2016, 10:37:56 PM
    Author     : neha
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/homepgcontent.css" type="text/css" media="all" />
        <link rel="shortcut icon" href="resources/css/images/favicon.ico" />
        <script type="text/javascript" src="resources/js/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.jcarousel.min.js"></script>
	<!--[if IE 6]>
		<script type="text/javascript" src="js/png-fix.js"></script>
	<![endif]-->
	<script type="text/javascript" src="resources/js/functions.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
    <div>
        <jsp:include page="header.jsp" />
      
    </div>
    
 
    <div class="cl">&nbsp;</div>
    <div class="cl">&nbsp;</div>
    <div class="cl">&nbsp;</div>
</div>
<div>
    <jsp:include page="slider.jsp" />
    <div class="cl">&nbsp;</div>
</div>
<!-- Main -->
<div id="main" class="shell">
   
    <!-- Sidebar -->
    <div id="sidebar">
        <ul class="categories">
            <li>
                <h4>Categories</h4>
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
            <li>
                <h4>Educational Books</h4>
                <ul>
                    <li><a href="#">Science</a></li>
                    <li><a href="#">Social Science</a></li>
                    <li><a href="#">Economics</a></li>
                    <li><a href="#">Mathematics</a></li>
                    <li><a href="#">Hindi</a></li>
                    <li><a href="#">Sanskrit</a></li>
                    <li><a href="#">MBA</a></li>
                    <li><a href="#">Computers</a></li>
                    <li><a href="#">English</a></li>
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
        <div class="cl">&nbsp;</div>
        <!-- Best-sellers -->
        <div id="best-sellers">
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
                            <img src="css/images/image-best02.jpg" alt="" />
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
            </ul>
        </div>
        <!-- End Best-sellers -->
    </div>
    <!-- End Content -->
    <div class="cl">&nbsp;</div>
</div>
<!-- End Main -->


<div>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>

<%-- 
    Document   : header
    Created on : 1 Nov, 2016, 2:39:27 PM
    Author     : neha
--%>

<%@page import="com.mindfire.bean.LoginBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/header.css" type="text/css" media="all" />
     
        <title>JSP Page</title>
    </head>
    <body>
        <div id="header" class="shell">

            <div id="site_logo" ><h1><a href="/EbookCart/">ebookCart</a></h1></div>
            <% String user=(String)request.getAttribute("logged_user");
            user= (String)session.getAttribute("logged_user");
            String name=user;
            String type=(String)request.getAttribute("login_type");
            System.out.println("inside scriplet"+name+"    "+type);
            %>
            <!--<div><br><br>
            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pick your ebook today!</span></div>-->
            <div id="navigation">
                <ul>
                    <li><a href="/EbookCart/" class="active">Home</a></li>
                    <% if(name.equals("Guest")){ %>
                    <li><a href="/EbookCart/login?buy=0">LogIn/Register</a></li>
                    <% } %>
                    <li><a href="#">Offers</a></li>

                    <li><a href="#About">About Us</a></li>
                    <li><a href="#Contacts">Contacts</a></li>
                    <% if(!name.equals("Guest")){  %>
                    <li><a href="/EbookCart/signOut">Logout</a></li>
                    <% } %>
                </ul>
            </div>
            <!-- End Navigation -->
            <div class="cl">&nbsp;</div>
            <!-- Login-details -->
            <div id="login-details">
                <div >
                     <!--<h1> hello ${logged_user}</h1>-->
                <ul style="float: right;list-style-type: none;">
                 
                    <li style="display: inline "> Welcome ${logged_user}!</li>
                   
                    <li style="display: inline ">&nbsp;</li>
                    <li style="display: inline ">&nbsp;</li>
                        <li style="display: inline "><a href="/EbookCart/adminLogin">Go To Admin panel</a></li>
                        
                        
                    </ul>
                </div>
                </div>
                <!--
                    <p id="user">Welcome, Guest User</p>
                <!--<p><a href="#" class="cart" ><img src="resources/images/shoppingcart.jpg" alt="" /></a>Shopping Cart (0) <a href="#" class="sum">$0.00</a></p>
        </div>-->
                <!-- End Login-details -->

            </div>

    </body>
</html>

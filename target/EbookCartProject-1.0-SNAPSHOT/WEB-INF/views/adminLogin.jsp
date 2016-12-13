<%-- 
    Document   : login
    Created on : 4 Nov, 2016, 6:55:59 PM
    Author     : neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>admin login panel</title>
  
  
  
      
 <link rel="stylesheet" href="resources/css/style_1.css" type="text/css" media="all" />
<link rel="stylesheet" href="resources/css/bg_css.css" type="text/css" media="all" />
  
</head>

<body>
   
  <div class="loginpanel">
       <div style="position: relative; margin-left: 20%">
        <div style="color: red; font-size: 20px">${error}</div>
     </div>
   
      <form action="submitAdminLogin" method="POST" name="submitAdminForm" >
  <div class="txt">
    <input id="username" type="text" placeholder="Username" name="username"/>
    <label for="username" class="entypo-user"></label>
  </div>
  <div class="txt">
    <input id="password" type="password" placeholder="Password" name="password" />
    <label for="password" class="entypo-lock"></label>
  </div>
  <div class="buttons">
    <input type="submit" value="Login" />
  <!--  <span>
      <a href="/EbookCart/register" class="entypo-user-add register">Register</a>
    </span> -->
  </div>
      </form>
  <!--<div class="hr">
    <div></div>
    <div>OR</div>
    <div></div>
  </div>
  
  <div class="social">
    <a href="javascript:void(0)" class="facebook"></a>
    <a href="javascript:void(0)" class="twitter"></a>
    <a href="javascript:void(0)" class="googleplus"></a>
  </div>
</div>
    
<!--
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
-->
    
</body>
</html>
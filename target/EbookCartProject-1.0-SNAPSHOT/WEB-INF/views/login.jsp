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
  <title>another login panel</title>
  
  
  
      
 <link rel="stylesheet" href="resources/css/style_1.css" type="text/css" media="all" />
<link rel="stylesheet" href="resources/css/bg_css.css" type="text/css" media="all" />
  
</head>

<body>
   
  <div class="loginpanel">
       <div style="position: relative; margin-left: 20%">
        <div style="color: red; font-size: 20px">${error}</div>
     </div>
   
      <form action="submitLogin" method="POST" name="submitForm" >
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
    <span>
      <a href="/EbookCart/register" class="entypo-user-add register">Register</a>
    </span>
  </div>
      </form>
  <div class="hr">
    <div></div>
    <div>OR</div>
    <div></div>
  </div>
     
     <script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '383742011962035',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.8' // use graph api version 2.8
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      window.location.href = '/EbookCart/';
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
  
</script>

  <script>
    document.getElementById('fb').addEventListener('click',checkLoginState,false);
</script>
  <div class="social">
    <a href="https://www.facebook.com/dialog/oauth?client_id=383742011962035&redirect_uri=http://localhost:8080/EbookCart/" class="facebook"></a>
    <a href="#" onclick="checkLoginStatus()" class="twitter"></a>
    <a href="javascript:void(0)" class="googleplus"></a>
  </div>
</div>
    
<!--
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
-->
    
</body>
</html>
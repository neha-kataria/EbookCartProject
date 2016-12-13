<%-- 
    Document   : sidemenu
    Created on : 5 Dec, 2016, 6:42:39 PM
    Author     : neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

         <!-- Custom Theme Style -->
    <link href="resources/css/custom.min.css" rel="stylesheet">
        <title>Admin Page</title>
    </head>
    <body style="background-color: #000000">
        <h1>Hello World!</h1>
        <jsp:include page="header.jsp" />
        <jsp:include page="slider.jsp" />
           <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                            <div class="menu_section">

                                <h3>General</h3>
                                <ul class="nav side-menu">
                                    <li>
                                        <a >
                                            <i class="fa fa-home"></i>
                                            Home <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="/EbookCart/admin">Dashboard</a></li>

                                        </ul>
                                    </li>
                                    <li>
                                        <a><i class="fa fa-edit"></i>Category <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="/EbookCart/addCategory">Add Category</a></li>
                                            <li><a href="/EbookCart/adminCategoryShowTable">Show Category</a></li>
                                            <li><a href="editCategoryPage.html">Edit Category</a></li>

                                        </ul>
                                    </li>

                                    <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="tables.html">Registered Users Table</a></li>
                                            <li><a href="/EbookCart/adminProductShowTable">Product Table</a></li>
                                        </ul>
                                    </li>
<!--                                    <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="chartjs.html">Chart JS</a></li>
                                            <li><a href="chartjs2.html">Chart JS2</a></li>
                                            <li><a href="morisjs.html">Moris JS</a></li>
                                            <li><a href="echarts.html">ECharts</a></li>
                                            <li><a href="other_charts.html">Other Charts</a></li>
                                        </ul>
                                    </li>-->

                                </ul>
              </div>
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">E-commerce</a></li>
                      <li><a href="projects.html">Projects</a></li>
                      <li><a href="project_detail.html">Project Detail</a></li>
                      <li><a href="contacts.html">Contacts</a></li>
                      <li><a href="profile.html">Profile</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">403 Error</a></li>
                      <li><a href="page_404.html">404 Error</a></li>
                      <li><a href="page_500.html">500 Error</a></li>
                      <li><a href="plain_page.html">Plain Page</a></li>
                      <li><a href="login.html">Login Page</a></li>
                      <li><a href="pricing_tables.html">Pricing Tables</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li>
                    </ul>
                  </li>                  
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i>
                          Offers Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->
            
    <!-- jQuery -->
    <script src="resources/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="resources/js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="resources/js/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="resources/js/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="resources/js/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="resources/js/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="resources/js/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="resources/js/skycons.js"></script>
    <!-- Flot -->
    <script src="resources/js/jquery.flot.js"></script>
    <script src="resources/js/jquery.flot.pie.js"></script>
    <script src="resources/js/jquery.flot.time.js"></script>
    <script src="resources/js/jquery.flot.stack.js"></script>
    <script src="resources/js/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="resources/js/jquery.flot.orderBars.js"></script>
    <script src="resources/js/jquery.flot.spline.min.js"></script>
    <script src="resources/js/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="resources/js/date.js"></script>
    <!-- JQVMap -->
    <script src="resources/js/jquery.vmap.js"></script>
    <script src="resources/js/jquery.vmap.world.js"></script>
    <script src="resources/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="resources/js/moment.min.js"></script>
    <script src=".resources/js/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="resources/js/custom.min.js"></script>
    </body>
</html>

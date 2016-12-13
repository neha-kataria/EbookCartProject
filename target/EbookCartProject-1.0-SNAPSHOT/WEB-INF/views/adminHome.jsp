<%-- 
    Document   : admin
    Created on : 7 Nov, 2016, 11:39:14 AM
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
    
    <script src="resources/js/myAdminJSFile.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <title>Admin Page</title>
        
        <script>
             $(document).ready(prodAjaxCall())
                     
            function prodAjaxCall() {
                   $.ajax({
                    type: "GET",
                    url: "showProduct",
                    data: {},
                    dataType: 'json',
                    success: function (data)
                    { //alert(data);
                         $('#list_table').html("");
                       $('#list_table').append("<table class='table table-striped jambo_table bulk_action' id='prod_list_table'>"+
                                            "<thead><tr class='headings'>"+
                                                    "<th class='column-title'>Id </th>"+
                                                    "<th class='column-title'>Thumbnail </th>"+
                                                    "<th class='column-title'>Name </th>"+
                                                    "<th class='column-title'>Parent Category </th>"+
                                                    "<th class='column-title'>Short Description </th>"+
                                                    "<th class='column-title'>Total Quantity </th>"+
                                                    "<th class='column-title'>Available Quantity </th></tr></thead>");
                                                  
                         $.each(data, function (i, item) {
                             $("#prod_list_table").append("<tr onclick='bookdetail(this);' id='"+item.productName+"'><td>"+item.p_id+"</td><td><img src='assets/product/"+item.thumb_name+"' height='100' width='100'></td><td>"+item.productName+"</td><td>"+item.parentName+"</td><td>"+item.shortDesc+"</td><td>"+item.availQuant+"</td><td>"+item.totalQuant+"</td></tr>");
                         });
                      $('#list_table').append("</table>");   
                     }
                 });
            }
             
  
function catgAjaxCall() {
   // alert($(el));
                   $.ajax({
                    type: "GET",
                    url: "SideMenu",
                    data: {},
                    dataType: 'json',
                    success: function (data)
                    { //alert(data);
                        $('#list_table').html("");
                       $('#list_table').append("<table class='table table-striped jambo_table bulk_action' id='catg_list_table'><thead>"+
                                                "<tr class='headings'>"+
                                                    "<th class='column-title'>Id </th>"+
                                                    "<th class='column-title'>Thumbnail </th>"+
                                                    "<th class='column-title'>Name </th>"+
                                                    "<th class='column-title'>Parent Category </th>"+"</tr></thead>");
                                                    
                                                    

                       
                         $.each(data, function (i, item) {
                            $('#catg_list_table').append("<tr onclick='subcatgAjaxCall(this);' id='"+item.categoryName+"'><td>"+item.c_id+"</td><td><img src='assets/category/"+item.catg_thumb_name+"' height='100' width='100'></td><td>"+item.categoryName+"</td><td>"+item.parentName+"</td></tr>");
                            });
                            $('#list_table').append("</table>");
                    }
                });
            }
                               
        function subcatgAjaxCall(el) {
   // alert($(el));
                   $.ajax({
                    type: "GET",
                    url: "SideMenuSubCatg",
                    data: {'name':$(el).attr('id')},
                    dataType: 'json',
                    success: function (data)
                    {// alert(data);
                        $('#list_table').html("");
                       $('#list_table').append("<table class='table table-striped jambo_table bulk_action' id='catg_list_table'><thead>"+
                                                "<tr class='headings'>"+
                                                    "<th class='column-title'>Id </th>"+
                                                    "<th class='column-title'>Thumbnail </th>"+
                                                    "<th class='column-title'>Name </th>"+
                                                    "<th class='column-title'>Parent Category </th>"+
                                                    "<th class='column-title'>Short Description </th>"+
                                                    "</tr></thead>");
                                                    
                                                    

                       
                         $.each(data, function (i, item) {
                            $('#catg_list_table').append("<tr><td>"+item.s_id+"</td><td><img src='assets/subcategory/"+item.subCatg_thumb_name+"' height='100' width='100'></td><td>"+item.subcategoryName+"</td><td>"+item.subCatg_parentName+"</td><td>"+item.subCatg_shortDesc+"</td></td></tr>");
                            });
                            $('#list_table').append("</table>");
                    }
                });
            }
                
             
             
             
             
             
        </script>
   
        
        
    </head>
   
    
    
    <body class="nav-md">
        
        
        
        
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border:0;">
              <a href="/EbookCart/home" class="site_title"> <span>ebookcart</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                  <img src="resources/images/user.png" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>Admin</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

           
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
                                        <a><i class="fa fa-edit"></i>Add items <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="/EbookCart/addCategory">Add Category</a></li>
                                            <li><a href="/EbookCart/addSubCategory">Add Sub-Category</a></li>
                                            <li><a href="/EbookCart/addProduct">Add Product</a></li>
                                            
                                          

                                        </ul>
                                    </li>

                                    <li><a><i class="fa fa-table"></i> Show Tables <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a onclick="userAjaxCall();">Registered Users Table</a></li>
                                            <li><a onclick="catgAjaxCall();">Show Category</a></li>
                                            <li><a onclick="prodAjaxCall();">Product Table</a></li>
                                            <li><a onclick="addToCartAjaxCall();">Show AddToCart Table</a></li>
                                        </ul>
                                    </li>


                                </ul>
              </div>
             

            </div>
            <!-- /sidebar menu -->

           
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="resources/images/user.png" alt="">Admin
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="/EbookCart/"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Users</span>
              <div class="count">2500</div>
              <span class="count_bottom"><i class="green">4% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> Average Time</span>
              <div class="count">123.50</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Males</span>
              <div class="count green">2,500</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Females</span>
              <div class="count">4,567</div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Collections</span>
              <div class="count">2,315</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Connections</span>
              <div class="count">7,325</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
          </div>
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>Displaying... <small>Tables</small></h3>
                  </div>
                  <div class="col-md-6">
                   
                  </div>
                </div>

                          <div class="table-responsive" style="width:100%" id="list_table">

                      </div>
                  </div>
                </div>
                

                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />

        


          
               
       
      </div>
    </div>

    <!-- jQuery -->
    <script src="resources/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="resources/js/fastclick.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="resources/js/custom.min.js"></script>


    <!-- /gauge.js -->
  </body>
</html>
<%-- 
    Document   : addCategoryPage
    Created on : 8 Nov, 2016, 9:56:19 AM
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

        <!-- Custom Theme Style -->
        <link href="resources/css/custom.min.css" rel="stylesheet">
        
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript">
$(function () {
$("#thumbUpload").change(function () {
$("#spnName").html($("#thumbUpload").val().substring($("#thumbUpload").val().lastIndexOf('\\') + 1));

});
});
</script>

<script type="text/javascript">
                                   function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#preview')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }    
                                   </script>
                               
        <title>JSP Page</title>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="/EbookCart/" class="site_title"> <span>ebookcart</span></a>
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
                                        <a><i class="fa fa-edit"></i>Category <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="/EbookCart/addCategory">Add Category</a></li>
                                            <li><a href="showCategoryPage.jsp">Show Category</a></li>
                                            <li><a href="editCategoryPage.html">Edit Category</a></li>

                                        </ul>
                                    </li>

                                    <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="tables.html">Registered Users Table</a></li>
                                            <li><a href="tables_dynamic.html">Product Table</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="chartjs.html">Chart JS</a></li>
                                            <li><a href="chartjs2.html">Chart JS2</a></li>
                                            <li><a href="morisjs.html">Moris JS</a></li>
                                            <li><a href="echarts.html">ECharts</a></li>
                                            <li><a href="other_charts.html">Other Charts</a></li>
                                        </ul>
                                    </li>

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
                    <div class="">
                        <div class="page-title">
                            <br>
                            <div style="float: left; display: inline; font-family: 'Georgia', Arial, serif; font-size: 16px; line-height: 20px; margin-left: auto; margin-top: auto;">
                                <ul style="list-style: none; padding-left: 33px; float: left; display: inline; ">
                                    <li style="list-style: none; padding-left: 33px; float: left; display: inline;"><a href="#" class="active" style="font-weight: bold;text-decoration: underline">Category</a></li>
                                    <li style="list-style: none; padding-left: 33px; float: left; display: inline;"><a href="/EbookCart/addSubCategory">Sub-Category</a></li>
                                    <li style="list-style: none; padding-left: 33px; float: left; display: inline;"><a href="/EbookCart/addProduct">Product</a></li>


                                </ul>

                            </div>
                            <br>


                            <!--         <h3>Form Elements</h3> -->
                        </div>

                        <div class="title_right">
                            <!--  <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                  <input type="text" class="form-control" placeholder="Search for...">
                                  <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">Go!</button>
                                  </span>
                                </div>
                              </div>-->
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Add Category <small>different form elements</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown" >
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form id="category-form" name="categoryForm" action="submitCategoryForm" method="POST" enctype="multipart/form-data"  data-parsley-validate class="form-horizontal form-label-left">

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="category-name">Category Name
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" name="categoryName" id="category-name" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="parent-name">Parent Category <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="parent-name" name="parentName" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="show-title" class="control-label col-md-3 col-sm-3 col-xs-12">Show Category Title
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="show-title" name="showTitle" class="form-control">

                                                    <option value="show" selected="selected">Show</option>
                                                    <option value="hide">Hide</option>
                                                </select>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Category Icon 
                                                <span class="required">*</span>
                                            </label> <div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                            <div class="bs-glyphicons" >
                                                <ul class="bs-glyphicons-list" >
                                                    <li ><input type="file" name="thumbUpload" id="thumbUpload" style="display: none" onchange="readURL(this);">
                                                        <div onclick='$("#thumbUpload").click()' >
                                                            <span class="glyphicon glyphicon-camera" aria-hidden="true"  ></span>
                                                            <span class="glyphicon-class" ><br>  Click to <br> upload</span>
                                                        </div>
                                                       
                                                    </li>
                                                    
                                                </ul>
                                                <div style="margin-left: 20%">  <span id="spnName"></span> </div>
                                                <img id="preview" src="#" alt="your image" style="margin-left: 20%" />
                                            </div>
                                            
                                        </div>
                                   <!--     <input style="display:none" type="file" id="fileupload1" />
<input type="button"  id="btnUpload" onclick='$("#fileupload1").click()' value="Upload"/>
                                        
                                       
                                    <input type='file' onchange="readURL(this);" />
    <img id="blah" src="#" alt="your image" /> -->
                                </div>

                            </div>
                        </div>

                        <div class="clear"></div>


                        </li>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="reset" class="btn btn-primary">Cancel</button>
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>

                        </form>
                    </div>
                    <!--     new row ------>
                    <br><br>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Category List </h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown" >
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <table border="1" style="margin-left: 20%;width: 50%;font-size: 24px;">
                                        <th>Category Icon</th>
                                        <th>Category Name</th>
                                        <th>Add Product/Sub-Category
                                        </th>
                                        <tr>
                                            <td><img src="resources/images/gandhi.jpg" style="width: 100px; height: 100px;"></td>
                                            <td>Biography</td>
                                            <td >
                                                <span style="margin-left: 20%" class="glyphicon glyphicon-plus" aria-hidden="true" ></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><img src="resources/images/harrypotter.jpg" style="width: 100px; height: 100px;"></td>
                                            <td>Novels</td>
                                            <td >
                                                <span style="margin-left: 20%" class="glyphicon glyphicon-plus" aria-hidden="true" ></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><img src="resources/images/journal.jpg" style="width: 100px; height: 100px;"></td>
                                            <td>Journals</td>
                                            <td >
                                                <span style="margin-left: 20%" class="glyphicon glyphicon-plus" aria-hidden="true" ></span>
                                            </td>
                                        </tr>


                                    </table>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>

                <div class="clear"></div>



                <!-- -->

            </div>
        </div>
    </div>


    <!-- footer content -->
    <!--      <footer>
            <div class="pull-right">
              ebookcart - Bootstrap Admin Template 
            </div>
            <div class="clearfix"></div>
          </footer>
    <!-- /footer content -->
</div>
</div>

<!-- jQuery -->
<script src="resources/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="resources/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="resources/js/fastclick.js"></script>
<!-- NProgress -->
<script src="resources/js/nprogress.js"></script>

<!-- bootstrap-progressbar -->
<script src="resources/js/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="resources/js/icheck.min.js"></script>
<!-- Skycons -->
<script src="resources/js/skycons.js"></script>


<!-- jQuery Tags Input -->
<script src="resources/js/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="resources/js/switchery.min.js"></script>
<!-- Select2 -->
<script src="resources/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="resources/js/parsley.min.js"></script>
<!-- Autosize -->
<script src="resources/js/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script src="resources/js/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="resources/js/starrr.js"></script>



<!-- Custom Theme Scripts -->
<script src="resources/js/custom.min.js"></script>


<!-- Select2 -->
<script>
    $(document).ready(function () {
        $(".select2_single").select2({
            placeholder: "Select a state",
            allowClear: true
        });
        $(".select2_group").select2({});
        $(".select2_multiple").select2({
            maximumSelectionLength: 4,
            placeholder: "With Max Selection limit 4",
            allowClear: true
        });
    });
</script>
<!-- /Select2 -->

<!-- jQuery Tags Input -->
<script>
    function onAddTag(tag) {
        alert("Added a tag: " + tag);
    }

    function onRemoveTag(tag) {
        alert("Removed a tag: " + tag);
    }

    function onChangeTag(input, tag) {
        alert("Changed a tag: " + tag);
    }

    $(document).ready(function () {
        $('#tags_1').tagsInput({
            width: 'auto'
        });
    });
</script>
<!-- /jQuery Tags Input -->

<!-- Parsley -->
<script>
    $(document).ready(function () {
        $.listen('parsley:field:validate', function () {
            validateFront();
        });
        $('#demo-form .btn').on('click', function () {
            $('#demo-form').parsley().validate();
            validateFront();
        });
        var validateFront = function () {
            if (true === $('#demo-form').parsley().isValid()) {
                $('.bs-callout-info').removeClass('hidden');
                $('.bs-callout-warning').addClass('hidden');
            } else {
                $('.bs-callout-info').addClass('hidden');
                $('.bs-callout-warning').removeClass('hidden');
            }
        };
    });

    $(document).ready(function () {
        $.listen('parsley:field:validate', function () {
            validateFront();
        });
        $('#demo-form2 .btn').on('click', function () {
            $('#demo-form2').parsley().validate();
            validateFront();
        });
        var validateFront = function () {
            if (true === $('#demo-form2').parsley().isValid()) {
                $('.bs-callout-info').removeClass('hidden');
                $('.bs-callout-warning').addClass('hidden');
            } else {
                $('.bs-callout-info').addClass('hidden');
                $('.bs-callout-warning').removeClass('hidden');
            }
        };
    });
    try {
        hljs.initHighlightingOnLoad();
    } catch (err) {
    }
</script>
<!-- /Parsley -->

<!-- Autosize -->
<script>
    $(document).ready(function () {
        autosize($('.resizable_textarea'));
    });
</script>
<!-- /Autosize -->

<!-- jQuery autocomplete -->
<script>
    $(document).ready(function () {
        var countries = {AD: "Andorra", A2: "Andorra Test", AE: "United Arab Emirates", AF: "Afghanistan", AG: "Antigua and Barbuda", AI: "Anguilla", AL: "Albania", AM: "Armenia", AN: "Netherlands Antilles", AO: "Angola", AQ: "Antarctica", AR: "Argentina", AS: "American Samoa", AT: "Austria", AU: "Australia", AW: "Aruba", AX: "Åland Islands", AZ: "Azerbaijan", BA: "Bosnia and Herzegovina", BB: "Barbados", BD: "Bangladesh", BE: "Belgium", BF: "Burkina Faso", BG: "Bulgaria", BH: "Bahrain", BI: "Burundi", BJ: "Benin", BL: "Saint Barthélemy", BM: "Bermuda", BN: "Brunei", BO: "Bolivia", BQ: "British Antarctic Territory", BR: "Brazil", BS: "Bahamas", BT: "Bhutan", BV: "Bouvet Island", BW: "Botswana", BY: "Belarus", BZ: "Belize", CA: "Canada", CC: "Cocos [Keeling] Islands", CD: "Congo - Kinshasa", CF: "Central African Republic", CG: "Congo - Brazzaville", CH: "Switzerland", CI: "Côte d’Ivoire", CK: "Cook Islands", CL: "Chile", CM: "Cameroon", CN: "China", CO: "Colombia", CR: "Costa Rica", CS: "Serbia and Montenegro", CT: "Canton and Enderbury Islands", CU: "Cuba", CV: "Cape Verde", CX: "Christmas Island", CY: "Cyprus", CZ: "Czech Republic", DD: "East Germany", DE: "Germany", DJ: "Djibouti", DK: "Denmark", DM: "Dominica", DO: "Dominican Republic", DZ: "Algeria", EC: "Ecuador", EE: "Estonia", EG: "Egypt", EH: "Western Sahara", ER: "Eritrea", ES: "Spain", ET: "Ethiopia", FI: "Finland", FJ: "Fiji", FK: "Falkland Islands", FM: "Micronesia", FO: "Faroe Islands", FQ: "French Southern and Antarctic Territories", FR: "France", FX: "Metropolitan France", GA: "Gabon", GB: "United Kingdom", GD: "Grenada", GE: "Georgia", GF: "French Guiana", GG: "Guernsey", GH: "Ghana", GI: "Gibraltar", GL: "Greenland", GM: "Gambia", GN: "Guinea", GP: "Guadeloupe", GQ: "Equatorial Guinea", GR: "Greece", GS: "South Georgia and the South Sandwich Islands", GT: "Guatemala", GU: "Guam", GW: "Guinea-Bissau", GY: "Guyana", HK: "Hong Kong SAR China", HM: "Heard Island and McDonald Islands", HN: "Honduras", HR: "Croatia", HT: "Haiti", HU: "Hungary", ID: "Indonesia", IE: "Ireland", IL: "Israel", IM: "Isle of Man", IN: "India", IO: "British Indian Ocean Territory", IQ: "Iraq", IR: "Iran", IS: "Iceland", IT: "Italy", JE: "Jersey", JM: "Jamaica", JO: "Jordan", JP: "Japan", JT: "Johnston Island", KE: "Kenya", KG: "Kyrgyzstan", KH: "Cambodia", KI: "Kiribati", KM: "Comoros", KN: "Saint Kitts and Nevis", KP: "North Korea", KR: "South Korea", KW: "Kuwait", KY: "Cayman Islands", KZ: "Kazakhstan", LA: "Laos", LB: "Lebanon", LC: "Saint Lucia", LI: "Liechtenstein", LK: "Sri Lanka", LR: "Liberia", LS: "Lesotho", LT: "Lithuania", LU: "Luxembourg", LV: "Latvia", LY: "Libya", MA: "Morocco", MC: "Monaco", MD: "Moldova", ME: "Montenegro", MF: "Saint Martin", MG: "Madagascar", MH: "Marshall Islands", MI: "Midway Islands", MK: "Macedonia", ML: "Mali", MM: "Myanmar [Burma]", MN: "Mongolia", MO: "Macau SAR China", MP: "Northern Mariana Islands", MQ: "Martinique", MR: "Mauritania", MS: "Montserrat", MT: "Malta", MU: "Mauritius", MV: "Maldives", MW: "Malawi", MX: "Mexico", MY: "Malaysia", MZ: "Mozambique", NA: "Namibia", NC: "New Caledonia", NE: "Niger", NF: "Norfolk Island", NG: "Nigeria", NI: "Nicaragua", NL: "Netherlands", NO: "Norway", NP: "Nepal", NQ: "Dronning Maud Land", NR: "Nauru", NT: "Neutral Zone", NU: "Niue", NZ: "New Zealand", OM: "Oman", PA: "Panama", PC: "Pacific Islands Trust Territory", PE: "Peru", PF: "French Polynesia", PG: "Papua New Guinea", PH: "Philippines", PK: "Pakistan", PL: "Poland", PM: "Saint Pierre and Miquelon", PN: "Pitcairn Islands", PR: "Puerto Rico", PS: "Palestinian Territories", PT: "Portugal", PU: "U.S. Miscellaneous Pacific Islands", PW: "Palau", PY: "Paraguay", PZ: "Panama Canal Zone", QA: "Qatar", RE: "Réunion", RO: "Romania", RS: "Serbia", RU: "Russia", RW: "Rwanda", SA: "Saudi Arabia", SB: "Solomon Islands", SC: "Seychelles", SD: "Sudan", SE: "Sweden", SG: "Singapore", SH: "Saint Helena", SI: "Slovenia", SJ: "Svalbard and Jan Mayen", SK: "Slovakia", SL: "Sierra Leone", SM: "San Marino", SN: "Senegal", SO: "Somalia", SR: "Suriname", ST: "São Tomé and Príncipe", SU: "Union of Soviet Socialist Republics", SV: "El Salvador", SY: "Syria", SZ: "Swaziland", TC: "Turks and Caicos Islands", TD: "Chad", TF: "French Southern Territories", TG: "Togo", TH: "Thailand", TJ: "Tajikistan", TK: "Tokelau", TL: "Timor-Leste", TM: "Turkmenistan", TN: "Tunisia", TO: "Tonga", TR: "Turkey", TT: "Trinidad and Tobago", TV: "Tuvalu", TW: "Taiwan", TZ: "Tanzania", UA: "Ukraine", UG: "Uganda", UM: "U.S. Minor Outlying Islands", US: "United States", UY: "Uruguay", UZ: "Uzbekistan", VA: "Vatican City", VC: "Saint Vincent and the Grenadines", VD: "North Vietnam", VE: "Venezuela", VG: "British Virgin Islands", VI: "U.S. Virgin Islands", VN: "Vietnam", VU: "Vanuatu", WF: "Wallis and Futuna", WK: "Wake Island", WS: "Samoa", YD: "People's Democratic Republic of Yemen", YE: "Yemen", YT: "Mayotte", ZA: "South Africa", ZM: "Zambia", ZW: "Zimbabwe", ZZ: "Unknown or Invalid Region"};

        var countriesArray = $.map(countries, function (value, key) {
            return {
                value: value,
                data: key
            };
        });

        // initialize autocomplete with custom appendTo
        $('#autocomplete-custom-append').autocomplete({
            lookup: countriesArray
        });
    });
</script>
<!-- /jQuery autocomplete -->

<!-- Starrr -->
<script>
    $(document).ready(function () {
        $(".stars").starrr();

        $('.stars-existing').starrr({
            rating: 4
        });

        $('.stars').on('starrr:change', function (e, value) {
            $('.stars-count').html(value);
        });

        $('.stars-existing').on('starrr:change', function (e, value) {
            $('.stars-count-existing').html(value);
        });
    });
</script>
<!-- /Starrr -->
</body>
</html>
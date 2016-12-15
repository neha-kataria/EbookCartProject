/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 function prodAjaxCall() {
                   $.ajax({
                    type: "GET",
                    url: "showProduct",
                    data: {},
                    dataType: 'json',
                    success: function (data)
                    { //alert(data);
                        $('.x_content').html("");
                   //     $('.row').html("");
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
                
             
             
             
           



function userAjaxCall() {
                   $.ajax({
                    type: "GET",
                    url: "showUsers",
                    data: {},
                    dataType: 'json',
                    success: function (data)
                    { //alert(data);
                        $('#list_table').html("");
                       $('#list_table').append("<table class='table table-striped jambo_table bulk_action' id='user_list_table'><thead>"+
                                                "<tr class='headings'>"+
                                                    "<th class='column-title'>Id </th>"+
                                                    "<th class='column-title'>Username </th>"+
                                                    "<th class='column-title'>email </th>"+
                                                    "<th class='column-title'>Contact </th>"+
                                                    "<th class='column-title'>login type </th>"+"</tr></thead>");
                                                    
                                                    

                       
                         $.each(data, function (i, item) {
                            $('#user_list_table').append("<tr><td>"+item.u_id+"</td><td>"+item.username+"</td><td>"+item.email+"</td><td>"+item.contact+"</td><td>"+item.login_type+"</td></tr>");
                            });
                            $('#list_table').append("</table>");
                    }
                });
            }

function addToCartAjaxCall() {
                   $.ajax({
                    type: "GET",
                    url: "showAddToCartList",
                    data: {},
                    dataType: 'json',
                    success: function (data)
                    { //alert(data);
                        $('#list_table').html("");
                       $('#list_table').append("<table class='table table-striped jambo_table bulk_action' id='atc_list_table'><thead>"+
                                                "<tr class='headings'>"+
                                                    "<th class='column-title'>Id </th>"+
                                                    "<th class='column-title'>Username </th>"+
                                                    "<th class='column-title'>Product id </th>"+
                                                    "<th class='column-title'>Quantity</th>"+
                                                    "</tr></thead>");
                                                    
                                                    

                       
                         $.each(data, function (i, item) {
                            $('#atc_list_table').append("<tr><td>"+item.id+"</td><td>"+item.userid+"</td><td>"+item.product_id+"</td><td>"+item.quantity+"</td></tr>");
                            });
                            $('#list_table').append("</table>");
                    }
                });
            }



function bookdetail(el) {
                   $.ajax({
                    type: "GET",
                    url: "showProdDetail",
                    data: {'name':$(el).attr('id')},
                    dataType: 'json',
                    success: function (data)
                    { //alert(data);
                        $('#list_table').html("");
                       $('#list_table').append("<div><table style='width:100%;height:20px;font-size:24px'><tr ><td><img src='assets/product/"+data.thumb_name+"' height='200' width='200'></td><td>"+data.productName+"</td></tr>"+
                               "><tr><td>Available Quantity:"+data.availQuant+"</td><td>Total Quantity:"+data.totalQuant+"</td>"+
                               "<tr><td colspan='2'>Short Description:"+data.shortDesc+"</td></tr>"+
                               "<tr><td colspan='2'>Long Description:"+data.longDesc+"</td></tr>");
                       

                        $('#list_table').append("</table>");
                       
                    }
                });
            }
                               


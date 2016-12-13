/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
                               


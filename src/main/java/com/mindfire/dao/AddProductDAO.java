/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.dao;


import com.mindfire.bean.ProductBean;
import java.util.List;

/**
 *
 * @author neha
 */
public interface AddProductDAO {
     public void saveOrUpdate(ProductBean product);
	
	public void delete(int c_id);
	
	public ProductBean get(String p_name);
	
	public List<ProductBean> list();
     //   public List<ProductBean> list(String name);
         public List<ProductBean> prod_list(String name);
    
}

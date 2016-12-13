/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.dao;


import com.mindfire.bean.SubCategoryBean;
import java.util.List;

/**
 *
 * @author neha
 */
public interface AddSubCategoryDAO {
     public void saveOrUpdate(SubCategoryBean product);
	
	public void delete(int c_id);
	
	public SubCategoryBean get(String name);
	
	public List<SubCategoryBean> list(String name);
    
    
}

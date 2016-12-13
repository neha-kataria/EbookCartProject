/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.dao;

import com.mindfire.bean.CategoryBean;
import java.util.List;

/**
 *
 * @author neha
 */
public interface AddCategoryDAO {
    
    public void saveOrUpdate(CategoryBean category);
	
	public void delete(int c_id);
	
	public CategoryBean get(String name);
	
	public List<CategoryBean> list();
        public List<CategoryBean> catg_list();
        
}
    


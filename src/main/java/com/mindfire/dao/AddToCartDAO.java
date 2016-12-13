/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.dao;

import com.mindfire.bean.AddToCartBean;
import com.mindfire.bean.RegisterUserBean;
import java.util.List;

/**
 *
 * @author neha
 */
public interface AddToCartDAO {
     public void saveOrUpdate(AddToCartBean order);

    public void delete(String name);

    public AddToCartBean get(String name);

    public List<AddToCartBean> list();
    
    public List<AddToCartBean> user_list(String name);
    
}

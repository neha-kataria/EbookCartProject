/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.dao;

import com.mindfire.bean.RegisterUserBean;
import java.util.List;

/**
 *
 * @author neha
 */
public interface AddUserDAO {

    public void saveOrUpdate(RegisterUserBean user);

    public void delete(String name);

    public RegisterUserBean get(String name);

    public List<RegisterUserBean> list();

}

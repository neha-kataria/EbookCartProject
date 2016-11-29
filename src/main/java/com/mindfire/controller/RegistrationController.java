/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.RegisterUserBean;
import com.mindfire.dao.AddUserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author neha
 */
@Controller
public class RegistrationController {
    @Autowired
    AddUserDAO userDao;

    @RequestMapping(value="submitResgiterationForm", method = RequestMethod.POST)
    public String registerUser(Model model,RegisterUserBean bean){
        System.out.println("registeration:"+bean.getUsername());
        bean.setLogin_type("signup");
        userDao.saveOrUpdate(bean);
        return "login";
    }
    
}

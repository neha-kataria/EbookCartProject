/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.RegisterUserBean;
import com.mindfire.dao.AddUserDAO;
import com.mindfire.service.EncryptionService;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author neha
 * 
 * Registration controller class : handles the signup page and adds new users and redirects to login page
 */
@Controller
public class RegistrationController extends ParentController {

    @Autowired
    AddUserDAO userDao;

    private static final Logger logger = Logger.getLogger(RegistrationController.class);
    /**
     * 
     * @param model
     * @param bean: the new user bean that is to be added in the db table registered_user
     * @param buy
     * @return the viewname "login"
     */
    @RequestMapping(value = "submitResgiterationForm", method = RequestMethod.POST)
    public String registerUser(Model model, RegisterUserBean bean, @RequestParam("buy") String buy) {
      //  System.out.println("registeration:" + bean.getUsername());
        logger.debug("inside registeration controller>>>>>>>>" + bean.getUsername());
        bean.setLogin_type("signup");
        //validation check
        bean.setUsername(bean.getUsername().trim());
        bean.setPassword(bean.getPassword().trim());
        String phone = bean.getContact().trim();

        int flag = 0;
        //validation check for username
        if (!bean.getUsername().matches("^[a-zA-Z_]+[0-9]*") || bean.getUsername().isEmpty()) {
            model.addAttribute("error_username", "invalid username");
            flag = 1;

        }

        RegisterUserBean already_user = userDao.get(bean.getUsername());
        if (already_user != null) {
            model.addAttribute("error_username", "username exists");
            flag = 1;

        }
        //validation check for email
       
        if (!bean.getEmail().matches("^(.+)@(.+)$")) {
            model.addAttribute("error_email", "invalid email address");
            flag = 1;
           
        }

        //validation check for contact
        if (phone.length() == 10) {
            if (phone.startsWith("9") || phone.startsWith("8") || phone.startsWith("7")) {
                
                bean.setContact(phone);
            } else {
                model.addAttribute("error_contact", "invalid contact number");
                flag = 1;
               
            }
        } else {
            model.addAttribute("error_contact", "invalid contact number");
            flag = 1;
            
        }

        if (flag == 1) {
            return "SignUpPage";
        }
        
        //password encryption
        EncryptionService encrypt=new EncryptionService();
        bean.setPassword(encrypt.encryptPass(bean.getPassword()));

        userDao.saveOrUpdate(bean);
        System.out.println(">>>buy="+buy);
        String url="redirect: /EbookCart/login?buy="+buy;
        return url;
    }

}

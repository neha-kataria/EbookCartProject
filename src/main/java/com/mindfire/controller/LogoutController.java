/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.CategoryBean;
import com.mindfire.bean.LoginBean;
import com.mindfire.bean.ProductBean;
import com.mindfire.dao.AddCategoryDAO;
import com.mindfire.dao.AddProductDAO;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neha
 */
@Controller
//@SessionAttributes({"logged_user","prod_list","catg_list"})

public class LogoutController {
    @Autowired
    AddProductDAO productDao;
    @Autowired
    AddCategoryDAO categoryDao;
    
     @RequestMapping(value = "/signOut", method = RequestMethod.GET)
    public ModelAndView logout(ModelAndView model,HttpSession session) {
        session.invalidate();
//        PageController ob=new PageController();
//        ob.init(model);
//         LoginBean ob = new LoginBean();
//        ob.setUsername("Guest");
//        model.addObject("logged_user", ob.getUsername());
//        model.addObject("login_type", "no-login");
//        System.out.println("After Logout" + ob.getUsername());
//         List<ProductBean> list = productDao.list();
//        model.addObject("prod_list", list);
//         List<CategoryBean> catg_menu=categoryDao.catg_list();
//          model.addObject("catg_list", catg_menu);
//        
//        
//        model.setViewName("home");

model.setViewName("redirect:loggedOut");
        return model;
    }
    
     @RequestMapping(value = "/loggedOut", method = RequestMethod.GET)
    public ModelAndView logoutRedirect(ModelAndView model,SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        System.out.println("after logout>>>>>>>>><<<<<<<<<<<");
        model.addObject("logged_user", "Guest");
        model.setViewName("redirect:/");
        return model;
    }
}

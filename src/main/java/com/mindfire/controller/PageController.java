/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.LoginBean;
import com.mindfire.bean.ProductBean;
import com.mindfire.dao.AddCategoryDAO;
import com.mindfire.dao.AddProductDAO;
import com.mindfire.dao.AddSubCategoryDAO;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neha
 */
@Controller
@SessionAttributes({"logged_user","prod_list","login_type"})
public class PageController {
//    
//     @Autowired
//    private AddCategoryDAO categoryDao;
//    @Autowired
//    private AddSubCategoryDAO subcategoryDao;
    @Autowired
    private AddProductDAO productDao;
    
     @RequestMapping(value="/", method=RequestMethod.GET)
    public ModelAndView init(ModelAndView model){
      List<ProductBean> list=productDao.list();
//      model.addAttribute("prod_list", list);
//      model.addAttribute("logged_user", "Guest");
       // return "home";
       model.addObject("prod_list", list);
       
       LoginBean ob=new LoginBean();
       ob.setUsername("Guest");
       model.addObject("logged_user", ob.getUsername());
       model.addObject("login_type", "no-login");
       System.out.println("start up page"+ob.getUsername());
       model.setViewName("home");
     return model; 
    }
    



      @RequestMapping(value="/signOut", method=RequestMethod.GET)
      public String logout(HttpSession session) {
        session.invalidate();
        return "home";
      }
    
    
}

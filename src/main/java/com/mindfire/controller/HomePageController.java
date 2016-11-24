/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.CategoryBean;
import com.mindfire.bean.ProductBean;
import com.mindfire.bean.SubCategoryBean;
import com.mindfire.dao.AddCategoryDAO;
import com.mindfire.dao.AddProductDAO;
import com.mindfire.dao.AddSubCategoryDAO;
import java.util.ArrayList;
import java.util.List;
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
public class HomePageController {
     @Autowired
    private AddCategoryDAO categoryDao;
    @Autowired
    private AddSubCategoryDAO subcategoryDao;
    @Autowired
    private AddProductDAO productDao;
    
     @RequestMapping(value="/", method=RequestMethod.GET)
    public String init(Model model){
      List<ProductBean> list=productDao.list();
      model.addAttribute("prod_list", list);
        return "home";
      
    }
    
     @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login(Model model){
      
        return "login";
       
    }
     
      @RequestMapping(value="/register", method=RequestMethod.GET)
    public String registerNew(Model model){
      
        return "SignUpPage";
       
    }

    
     @RequestMapping(value="/forgotPassword", method=RequestMethod.GET)
    public String forgotPassword(Model model){
      
        return "ForgotPassword";
       
    }
    @RequestMapping(value="/admin", method=RequestMethod.GET)
    public String AdminLogIn(Model model){
      
        return "adminHome";
      
    }
    
      @RequestMapping(value="/addCategory", method=RequestMethod.GET)
    public String addCategory(Model model){
         List<CategoryBean> list=categoryDao.list();
                  
      model.addAttribute("catg_list",list);
        return "addCategoryPage";
      
    }
   
    @RequestMapping(value="/addSubCategory", method=RequestMethod.GET)
    public String addSubCategory(Model model){
      
        return "addSubcategoryPage";
       
    }
    @RequestMapping(value="/addProduct", method=RequestMethod.GET)
    public String addProduct(Model model){
      
        return "addProductPage";
       
    }
    
    @RequestMapping(value="/footer", method=RequestMethod.GET)
    public String footer(Model model){
      
        return "footer";
       
    }
    @RequestMapping(value="/header", method=RequestMethod.GET)
    public String header(Model model){
      
        return "header";
       
    }
    @RequestMapping(value="/offers", method=RequestMethod.GET)
    public String offers(Model model){
      
        return "OffersPage";
       
    }
    @RequestMapping(value="/slider", method=RequestMethod.GET)
    public String slider(Model model){
      
        return "slider";
      
    }
    
     @RequestMapping(value="/addToCart", method=RequestMethod.GET)
    public String addToCart(Model model){
      
        return "addToCartPage";
       
    }
    
    @RequestMapping(value="/fb", method=RequestMethod.GET)
    public String fb(Model model){
      
        return "fbLogin";
       
    }
    @RequestMapping(value="/adminCategoryShowTable", method=RequestMethod.GET)
    public String adminCategoryShowTable(Model model){
       List<CategoryBean> list=categoryDao.list();
                  
      model.addAttribute("catg_list",list);
        return "adminCategoryShowTable";
       
    }
    
     @RequestMapping(value="/adminSubCategoryShowTable", method=RequestMethod.GET)
    public String adminSubCategoryShowTable(Model model){
       List<SubCategoryBean> list=subcategoryDao.list();
                  
      model.addAttribute("catg_list",list);
        return "adminSubCategoryShowTable";
       
    }
    @RequestMapping(value="/adminProductShowTable", method=RequestMethod.GET)
    public String adminProductShowTable(Model model){
       List<ProductBean> list=productDao.list();
                  
      model.addAttribute("catg_list",list);
        return "adminProductShowTable";
       
    }
}

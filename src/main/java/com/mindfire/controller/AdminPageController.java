/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.CategoryBean;
import com.mindfire.bean.ProductBean;
import com.mindfire.bean.RegisterUserBean;
import com.mindfire.bean.SubCategoryBean;
import com.mindfire.dao.AddCategoryDAO;
import com.mindfire.dao.AddProductDAO;
import com.mindfire.dao.AddSubCategoryDAO;
import com.mindfire.dao.AddToCartDAO;
import com.mindfire.dao.AddUserDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neha
 * this Controller class contains methods/mappings for the admin panel 
 */
@Controller
public class AdminPageController extends ParentController{
    @Autowired
    AddProductDAO productDao;
    @Autowired
    AddCategoryDAO categoryDao;
    @Autowired
    AddSubCategoryDAO subcategoryDao;
    @Autowired
    AddUserDAO userDao;
    @Autowired
    AddToCartDAO addtocartDao;
    
    /**
     * this method sets the admin homepage for the admin user
     * @param model
     * @param user :  the logged_user if admin then only load the page 
     * @return model and view of admin home page
     */
    @RequestMapping(value="/admin", method = RequestMethod.GET)
    public ModelAndView init(ModelAndView model,@ModelAttribute("logged_user") String user){
      
        if(!user.equals("admin")){
           model.setViewName("redirect: /");
        }else{
     
        model.setViewName("adminHome");
        }
        return model;
    }
    
    /**
     * this method is used to generate list of registered users so far
     * @return json of list of users registered 
     */
     @RequestMapping(value="/showUsers", method = RequestMethod.GET)
    public @ResponseBody List<RegisterUserBean> showUserTable(){
      List<RegisterUserBean> list= userDao.list();
        return list;
        
    }
    
    /**
     * this method returns the list of products in the product table
     * @return json list of products
     */
    @RequestMapping(value="/showProduct", method = RequestMethod.GET)
    public @ResponseBody List<ProductBean> showProductTable(){
      List<ProductBean> list= productDao.list();
        return list;
        
    }
    
   
    
    /**
     * this method returns detail of the specific product when selected by admin
     * @param name :used to show the specific product detail
     * @return 
     */
    @RequestMapping(value="/showProdDetail", method = RequestMethod.GET)
    public @ResponseBody ProductBean showProductTable(String name){
      ProductBean list= productDao.get(name);
        return list;
        
    }
    
    /**
     * this method used to load the add category page with the already added category listing
     * @param model
     * @return view name 
     */
    @RequestMapping(value = "/addCategory", method = RequestMethod.GET)
    public String addCategory(Model model) {
        List<CategoryBean> list = categoryDao.list();

        model.addAttribute("catg_list", list);
        return "addCategoryPage";

    }

    /**
     * this method loads the add sub category page to add new subcategory to existing category
     * @param model
     * @return view name
     */
    @RequestMapping(value = "/addSubCategory", method = RequestMethod.GET)
    public String addSubCategory(Model model) {

        return "addSubcategoryPage";

    }
    
    /**
     * this method loads the add product page for adding new product to the stock
     * @param model
     * @return view name
     */
    @RequestMapping(value = "/addProduct", method = RequestMethod.GET)
    public String addProduct(Model model) {

        return "addProductPage";

    }

    
}

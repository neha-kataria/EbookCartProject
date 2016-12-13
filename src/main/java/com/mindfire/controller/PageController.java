/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.CategoryBean;
import com.mindfire.bean.LoginBean;
import com.mindfire.bean.ProductBean;
import com.mindfire.bean.SubCategoryBean;
import com.mindfire.dao.AddCategoryDAO;
import com.mindfire.dao.AddProductDAO;
import com.mindfire.dao.AddSubCategoryDAO;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neha this controller class controls pages for users other than admin.
 * eg- home,addtocart,bookdetail,
 */
@Controller

public class PageController extends ParentController {

    @Autowired
    private AddProductDAO productDao;
    @Autowired
    private AddCategoryDAO categoryDao;
    @Autowired
    private AddSubCategoryDAO subCategoryDao;

    /**
     * this class loads the first view-homepage with guest as the logged user
     *
     * @param model
     * @return viewname
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView init(ModelAndView model) {
        //get the product list
        List<ProductBean> list = productDao.list();
        //get the category list
        List<CategoryBean> catg_menu = categoryDao.list();

        //default product set as selected
        ProductBean prod = productDao.get("Nancy Drew");

        //setting session attributes here
        model.addObject("prod_list", list);
        model.addObject("catg_list", catg_menu);
        model.addObject("selected", prod);
        model.addObject("subCategoryDaoObject", subCategoryDao);
        model.addObject("productDaoObject", productDao);

        //setting guest as login bean here
        LoginBean ob = new LoginBean();
        ob.setUsername("Guest");

        model.addObject("logged_user", ob.getUsername());
        model.addObject("login_type", "no-login");

        model.setViewName("homepage");
        return model;
    }

    /**
     * this class loads the home page with logged user
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView init2(ModelAndView model, @ModelAttribute("logged_user") String user) {
        if (user.equals("admin")) {
                model.setViewName("adminHome");
        }
        else {
            model.setViewName("homepage");
        }
        return model;
    }

    /**
     * this class generates category menu on the left side
     *
     * @return json :list of categorybean
     */
    @RequestMapping(value = "/SideMenu", method = RequestMethod.GET)
    public @ResponseBody
    List<CategoryBean> SideMenuListing() {

        return categoryDao.list();

    }

    /**
     *
     * @param model
     * @param name
     * @return
     */
//    @RequestMapping(value = "/SelectCategory", method = RequestMethod.GET)
//    public ModelAndView initSideMenu(ModelAndView model, @RequestParam("category") String name) {
//        System.out.println("hello there");
//        model.addObject("prod_list", productDao.prod_list(name));
//        model.setViewName("homepage");
//        return model;
//        
//    }
    /**
     * this method returns list of bean of subcategory type
     *
     * @param name: name of the category whose subcategory list has to be found
     * @return json:list of subcategory
     */
    @RequestMapping(value = "/SideMenuSubCatg", method = RequestMethod.GET)
    public @ResponseBody
    List<SubCategoryBean> SideMenuSubListing(String name) {

        return subCategoryDao.list(name);

    }

    /**
     * this method returns list of bean of product type
     *
     * @return json:list of products
     */
    @RequestMapping(value = "/ProductListing", method = RequestMethod.GET)
    public @ResponseBody
    List<ProductBean> initListing() {

        List<ProductBean> list_prod = productDao.list();
        List<ProductBean> list = new ArrayList<ProductBean>();
        if (list_prod.size() > 6) {
            for (int i = 0; i < 6; i++) {
                list.add(list_prod.get(i));    //to display only 6 at a time on homepage
            }
        } else {
            list.addAll(list_prod);
        }
        return list;

    }

    /**
     * this class gets products under the category name
     *
     * @param name: category name
     * @return json:list of products
     */
    @RequestMapping(value = "/SelectCatg", method = RequestMethod.GET)
    public @ResponseBody
    List<ProductBean> SideMenu2(String name) {

        return productDao.prod_list(name);

    }

    @RequestMapping(value = "/Sel_Category", method = RequestMethod.GET)
    public @ResponseBody
    String SideMenu(String name) {

        // return productDao.prod_list(name);   
        //  model.addObject("logged_user", name);
        return name;

    }

    /**
     * this method maps the view of book detail
     *
     * @param model
     * @param name : product name
     * @return view of book detail
     */
    @RequestMapping(value = "/bookDetail", method = RequestMethod.GET)
    public ModelAndView bookDetail(ModelAndView model, @RequestParam("prod_name") String name) {

        ProductBean ob = productDao.get(name);

        model.addObject("selected", ob);
        model.setViewName("bookDetail");
        return model;

    }

}

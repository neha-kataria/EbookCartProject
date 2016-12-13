/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.AddToCartBean;
import com.mindfire.bean.CategoryBean;
import com.mindfire.bean.ProductBean;
import com.mindfire.bean.SubCategoryBean;
import com.mindfire.dao.AddCategoryDAO;
import com.mindfire.dao.AddProductDAO;
import com.mindfire.dao.AddSubCategoryDAO;
import com.mindfire.dao.AddToCartDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neha
 */
@Controller
public class HomePageController extends ParentController {

    @Autowired
    private AddCategoryDAO categoryDao;
    @Autowired
    private AddSubCategoryDAO subcategoryDao;
    @Autowired
    private AddProductDAO productDao;
    @Autowired
    private AddToCartDAO addtocartDao;
   // private Object addTocartDao;

//     @RequestMapping(value="/", method=RequestMethod.GET)
//    public String init(Model model){
//      List<ProductBean> list=productDao.list();
//      model.addAttribute("prod_list", list);
//      model.addAttribute("logged_user", "Guest");
//        return "home";
//      
//    }
    
    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(ModelAndView model,Exception ex) {
   // ModelAndView model = new ModelAndView("IOError");
 System.out.println("inside exception handler");
    model.addObject("exception", ex.getMessage());
 model.setViewName("homepage");
    return model;
}
    
    
    @RequestMapping(value = "/buyNow", method = RequestMethod.GET)
    public String buyNow(Model model, @RequestParam("prod_name") String name) {
        ProductBean ob = productDao.get(name);
        System.out.println("$$$$$$$$$$$$" + ob.getProductName());
        System.out.println("$$$$$$$$$$$$" + name);
        model.addAttribute("selected", ob);
        return "buyNow";

    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model) {
        // if(value.equals("0"))
        return "login";
        //  else
        //    return "bookDetail";

    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerNew(Model model) {

        return "SignUpPage";

    }

    @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
    public String forgotPassword(Model model) {

        return "ForgotPassword";

    }


    

  /*  
    @RequestMapping(value = "/footer", method = RequestMethod.GET)
    public String footer(Model model) {

        return "footer";

    }

    @RequestMapping(value = "/header", method = RequestMethod.GET)
    public String header(Model model) {

        return "header";

    }
*/

    @RequestMapping(value = "/offers", method = RequestMethod.GET)
    public String offers(Model model) {

        return "OffersPage";

    }

    @RequestMapping(value = "/slider", method = RequestMethod.GET)
    public String slider(Model model) {

        return "slider";

    }


    @RequestMapping(value = "/addToCart", method = RequestMethod.GET)
    public ModelAndView addToCart(ModelAndView model,@ModelAttribute("logged_user") String uname,@ModelAttribute("selected") ProductBean prod,@CookieValue(value = "quant", defaultValue = "1") String num) {
        AddToCartBean new_order = new AddToCartBean();
                        new_order.setUserid(uname);
                        new_order.setProduct_id(prod.getProductName());
                        int n = Integer.parseInt(num);
                        new_order.setQuantity(n);
                        addtocartDao.saveOrUpdate(new_order);
        
        
        
        List<AddToCartBean> ob = addtocartDao.user_list(uname);

        model.addObject("addtocartlist", ob);
        model.setViewName("addToCart");
        return model;

    }
    
    @RequestMapping(value="/showAddToCartList", method = RequestMethod.GET)
    public @ResponseBody List<AddToCartBean> showAddToCartTable(){
      List<AddToCartBean> list=addtocartDao.list();
        return list;
        
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public ModelAndView checkout(ModelAndView model) {
        
        model.setViewName("checkoutPage");
        return model;

    }

    @RequestMapping(value = "/fb", method = RequestMethod.GET)
    public String fb(Model model) {
        // return "sidemenu";
        return "fbLogin";

    }

    @RequestMapping(value = "/adminCategoryShowTable", method = RequestMethod.GET)
    public String adminCategoryShowTable(Model model) {
        List<CategoryBean> list = categoryDao.list();

        model.addAttribute("catg_list", list);
        return "adminCategoryShowTable";

    }

    @RequestMapping(value = "/adminSubCategoryShowTable", method = RequestMethod.GET)
    public String adminSubCategoryShowTable(Model model, @RequestParam("catg_name") String name) {
        List<SubCategoryBean> list = subcategoryDao.list(name);
        //    SubCategoryBean ob=subcategoryDao.list(name);           
        model.addAttribute("catg_sub", list);
        return "adminSubCategoryShowTable";

    }

    @RequestMapping(value = "/adminProductShowTable", method = RequestMethod.GET)
    public ModelAndView adminProductShowTable(ModelAndView model) {
        List<ProductBean> list = productDao.list();

        //model.addAttribute("catg_list",list);
        //  return "adminProductShowTable";
        model.addObject("prod_list");
        model.setViewName("adminProductShowTable");
        return model;

    }
}

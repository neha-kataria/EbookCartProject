/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.AddToCartBean;
import com.mindfire.bean.LoginBean;
import com.mindfire.bean.ProductBean;
import com.mindfire.bean.RegisterUserBean;
import com.mindfire.dao.AddToCartDAO;
import com.mindfire.dao.AddUserDAO;
import com.mindfire.service.EncryptionService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neha this controller class contains mapping of methods to
 * authenticate user and admin also takes care of fb-login
 */
@Controller

public class LoginController extends ParentController {

    @Autowired
    AddUserDAO userDao;
    @Autowired
    AddToCartDAO addTocartDao;

    private static final Logger logger = Logger.getLogger(LoginController.class);

    /**
     * this method authenticates the user details from the login page
     *
     * @param model
     * @param loginBean : contains username and password
     * @param prod : contains
     * @param num
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "submitLogin")
    public ModelAndView loginAuth(ModelAndView model, LoginBean loginBean, @ModelAttribute("selected") ProductBean prod) {
        //System.out.println(loginBean.getUsername());
        //   List<RegisterUserBean> userlist=userDao.list();
         EncryptionService encrypt=new EncryptionService();

        if (!loginBean.getUsername().isEmpty() && !loginBean.getPassword().isEmpty()) {
            String enc_pass=encrypt.encryptPass(loginBean.getPassword());
            RegisterUserBean ob = userDao.get(loginBean.getUsername());
            if (ob != null) {
                if (loginBean.getUsername().equals(ob.getUsername()) && enc_pass.equals(ob.getPassword())) {

                    model.addObject("msg", "Welcome" + loginBean.getUsername());
                    logger.debug("logger:in log in");

                    model.addObject("logged_user", loginBean.getUsername());
                    model.addObject("login_type", "registered");

                    System.out.println("?????inside loginauth" + prod.getProductName());
                    if (loginBean.getBuy().equals("0")) {
                        model.setViewName("homepage");

                    } else if (loginBean.getBuy().equals("1")) {
                        System.out.println("log_buy>>>" + loginBean.getBuy());

                        String url = "redirect: /EbookCart/checkout?prod_name=" + prod.getProductName();
                        model.setViewName(url);
                    } else if (loginBean.getBuy().equals("2")) {

                        String url = "redirect: /EbookCart/addToCart?prod_name=" + prod.getProductName() + "&log_buy=2";
//                        AddToCartBean new_order = new AddToCartBean();
//                        new_order.setUserid(loginBean.getUsername());
//                        new_order.setProduct_id(prod.getProductName());
//                        int n = Integer.parseInt(num);
//                        new_order.setQuantity(n);
//                        addTocartDao.saveOrUpdate(new_order);

                        model.setViewName(url);
                    } else {
                        System.out.println("log_buy in else block>>>" + loginBean.getBuy());
                    }
                } else {
                    model.addObject("error", "incorrect username or password");
                    model.setViewName("login");
                }
            } else {

                model.addObject("error", "incorrect username");
                model.setViewName("login");
            }
        } else {
            System.out.println("in else of loginAuth");

            logger.debug("logger:empty fields");

            model.addObject("error", "Please fill in all details");
            model.setViewName("login");
        }
        return model;
    }

    /**
     * this method maps the fb success login and sets logged_user
     *
     * @param model
     * @param name :response name from fb login
     * @param type : type of login
     * @return model with view and object
     */
    @RequestMapping(value = "/fbSuccess", method = RequestMethod.GET)
    public ModelAndView initFbLogin(ModelAndView model, @CookieValue("quant") String num, @ModelAttribute("selected") ProductBean prod, @RequestParam("buy") String value, @RequestParam("login_name") String name, @RequestParam("login_type") String type) {

        //   System.out.println(">>>" + name + "  " + type + "<<<<<<<");
        RegisterUserBean new_fb_user = new RegisterUserBean();
        new_fb_user.setUsername(name + "@facebook.com");
        RegisterUserBean existing = userDao.get(new_fb_user.getUsername());

        if (existing == null) {

            new_fb_user.setPassword(" ");
            String name_array[] = name.split(" ");
            String e_id = "";
            for (int i = 0; i < name_array.length; i++) {
                e_id = e_id + name_array[i];
            }

            e_id = e_id + "@facebook.com";
            new_fb_user.setEmail(e_id);
            new_fb_user.setContact("");
            new_fb_user.setLogin_type("facebook");
            userDao.saveOrUpdate(new_fb_user);

        }

        model.addObject("logged_user", name);
        if (value.equals("2")) {
            String url = "redirect: /EbookCart/addToCart?prod_name=" + prod.getProductName() + "&log_buy=2";
            AddToCartBean new_order = new AddToCartBean();
            new_order.setUserid(new_fb_user.getUsername());
            new_order.setProduct_id(prod.getProductName());
            int n = Integer.parseInt(num);
            new_order.setQuantity(n);
            addTocartDao.saveOrUpdate(new_order);

            model.setViewName(url);
        } else {
            String url = "redirect: /EbookCart/checkout?prod_name=" + prod;
            model.setViewName(url);
        }

        //     model.setViewName("homepage");
        return model;
    }

    @RequestMapping(method = RequestMethod.POST, value = "submitAdminLogin")
    public ModelAndView adminLoginAuth(ModelAndView model, LoginBean loginBean,@ModelAttribute("logged_user") String user) {

       // System.out.println(loginBean.getUsername());
       if(user.equals("admin")){
           model.setViewName("adminHome");
           return model;
       }
        if (!loginBean.getUsername().isEmpty() && !loginBean.getPassword().isEmpty()) {
            if (loginBean.getUsername().equals("admin") && loginBean.getPassword().equals("123456")) {

                model.addObject("logged_user", loginBean);
                System.out.println("inside adminloginauth");
                logger.debug("logger:in admin login");
                model.addObject("logged_user", "admin");

                model.setViewName("redirect: /EbookCart/admin");

            } else {

                model.addObject("error", "incorrect username or password");
                model.setViewName("adminLogin");
            }
        } else {
            System.out.println("in else of loginAuth");

            logger.debug("logger:empty fields");

            model.addObject("error", "Please fill in all details");
            model.setViewName("adminLogin");
        }
        return model;
    }

    @RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
    public String AdminLogIn(Model model) {

        return "adminLogin";

    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import com.mindfire.bean.LoginBean;
import com.mindfire.bean.RegisterUserBean;
import com.mindfire.dao.AddUserDAO;
import java.util.List;
import org.apache.log4j.Logger;
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
public class LoginController {

    @Autowired
    AddUserDAO userDao;

    private static final Logger logger = Logger.getLogger(LoginController.class);

    @RequestMapping(method = RequestMethod.POST, value = "submitLogin")
    public ModelAndView loginAuth(ModelAndView model, LoginBean loginBean) {
        System.out.println(loginBean.getUsername());
        //   List<RegisterUserBean> userlist=userDao.list();

        if (!loginBean.getUsername().isEmpty() && !loginBean.getPassword().isEmpty()) {
            //     for(String name:userlist)
            RegisterUserBean ob = userDao.get(loginBean.getUsername());
            if (ob != null) {
                if (loginBean.getUsername().equals(ob.getUsername()) && loginBean.getPassword().equals(ob.getPassword())) {

                    model.addObject("msg", "Welcome" + loginBean.getUsername());
                    logger.debug("logger:in log in");

                    model.addObject("logged_user", loginBean.getUsername());
                    model.addObject("login_type", "registered");
                    

                    model.setViewName("home");
                } else {
                    model.addObject("error", "incorrect username or password");
                    model.setViewName("login");
                }
            }
         else {

            model.addObject("error", "incorrect username");
            model.setViewName("login");
        }
    }

    
        else {
            System.out.println("in else of loginAuth");

        logger.debug("logger:empty fields");

        model.addObject("error", "Please fill in all details");
        model.setViewName("login");
    }
    return model ;
}

@RequestMapping(method = RequestMethod.POST, value = "submitAdminLogin")
        public ModelAndView adminLoginAuth(ModelAndView model, LoginBean loginBean) {

        System.out.println(loginBean.getUsername());
        if (!loginBean.getUsername().isEmpty() && !loginBean.getPassword().isEmpty()) {
            if (loginBean.getUsername().equals("admin") && loginBean.getPassword().equals("123456")) {
              //  model.addAttribute("msg", "Welcome" + loginBean.getUsername());
              //  model.addAttribute("logged_user", "admin");
              model.addObject("logged_user", loginBean);
                logger.debug("logger:in log in");
               // return "adminHome";
                   model.setViewName("adminHome");
                 
            } else {
//                model.addAttribute("error", "incorrect username or password");
//                return "adminLogin";
                model.addObject("error", "incorrect username or password");
                model.setViewName("adminLogin");
            }
        } else {
            System.out.println("in else of loginAuth");

            logger.debug("logger:empty fields");
//            model.addAttribute("error", "Please fill in all details");
//            return "adminLogin";
             model.addObject("error", "Please fill in all details");
                model.setViewName("adminLogin");
        }
          return model;
    }

    @RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
        public String AdminLogIn(Model model) {

        return "adminLogin";
        // return "loginPage";
    }

}

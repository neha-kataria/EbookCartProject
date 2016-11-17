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
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neha
 */
@Controller
public class CategoryFormController implements ServletContextAware { 
     private ServletContext context;
    
    @Autowired
    private AddCategoryDAO categoryDao;
    
    
     @Override
    public void setServletContext(ServletContext sc) {
      this.context=sc;
    }
    
 /*   @RequestMapping(value="submitCategoryForm", method = RequestMethod.POST)
    public String addCategory(Model model,CategoryBean bean){
        System.out.println("Category"+bean.getCategoryName());
        
        
        return "addSubcategoryPage";
    }*/
    
     @RequestMapping(value="submitSubCategoryForm", method = RequestMethod.POST)
    public String addSubCategory(Model model,SubCategoryBean bean){
        System.out.println("Category"+bean.getSubcategoryName());
        return "addProductPage";
    }
    
     @RequestMapping(value="submitProductForm", method = RequestMethod.POST)
    public String addProduct(Model model,ProductBean bean){
        System.out.println("Category"+bean.getProductName());
        return "addCategoryPage";
    }
    
    
    @RequestMapping(value = "submitCategoryForm", method = RequestMethod.POST)
    public ModelAndView newContact(ModelAndView model,CategoryBean bean,@RequestParam("categoryName") String filename,@RequestParam("thumbUpload") MultipartFile file) {
        //Contact newContact = new Contact();
        System.out.println("%%%%%%%%Category"+bean.getCategoryName());
       // model.addObject("newCat", bean);
      // bean.setC_id(1);
      //////////////////////////
       if (!file.isEmpty()) {
            try {
                
                System.out.println(">>>>>>>>>>>>> in try");
                 System.out.println(">>>>>>>>>>>>> in try>>>>"+context.getContextPath());
                System.out.println(context.getRealPath("/thumbnails/category")+"/"+filename);
               
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(context.getRealPath("/thumbnails/category")+"/"+filename)));
                stream.write(bytes);
                stream.close();
                
           //     return "You successfully uploaded " + filename + "!";
            } catch (Exception e) {
                 System.out.println(">>>>>>>>>>>>> in catch  >>>"+e.getMessage());
          //      return "You failed to upload " + filename + " => " + e.getMessage();
            }
        } else {
           System.out.println(">>>>>file is empty");
         //   return "You failed to upload " + filename + " because the file was empty.";
        }
      //////////////////////////
      
      
      
       bean.setPath("/");
        
       categoryDao.saveOrUpdate(bean);
       System.out.println("%%%%%%%%after save method");
        model.setViewName("addSubcategoryPage");
        return model;
    }
    
    
   /*  
    public @ResponseBody String uploadHandler(@RequestParam("categoryName") String filename,@RequestParam("thumbUpload") MultipartFile file){

        //file handling to upload it in the server path
        System.out.println(">>>>>>>>>>>>>>>>inside uploadhandler");
   //     System.out.println("<<<<<<<<<<<<<<"+bean.getFilename());
        if (!file.isEmpty()) {
            try {
                System.out.println(context.getRealPath("/")+"/"+filename);
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(context.getRealPath("/")+"/"+filename)));
                stream.write(bytes);
                stream.close();
                
                return "You successfully uploaded " + filename + "!";
            } catch (Exception e) {
                return "You failed to upload " + filename + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + filename + " because the file was empty.";
        }

    //    return "welcome";
    }
*/
    
}

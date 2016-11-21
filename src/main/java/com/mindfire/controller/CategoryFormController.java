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
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.JDBCType;
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
    
    @Autowired
    private AddSubCategoryDAO subcategoryDao;
    @Autowired
    private AddProductDAO productDao;
    
    
     @Override
    public void setServletContext(ServletContext sc) {
      this.context=sc;
    }
    /*
    @RequestMapping(value="submitSubCategoryForm", method = RequestMethod.POST)
    public String newSubCategory(Model model,SubCategoryBean bean){
        System.out.println("Category"+bean.getSubcategoryName());
        
        
        return "addProductPage";
    }*/
    
     @RequestMapping(value="submitSubCategoryForm", method = RequestMethod.POST)
    public ModelAndView newSubCategory(ModelAndView model,SubCategoryBean bean,@RequestParam("subcategoryName") String filename,@RequestParam("subCatg_thumbUpload") MultipartFile file){
      
        System.out.println("SubCategory"+bean.getSubcategoryName());
        long time=System.currentTimeMillis();
        String file_name=filename+"_"+time+".jpg";
        if (!file.isEmpty()) {
            try {
                
                System.out.println(">>>>>>>>>>>>> in try of sub category");
                 System.out.println(">>>>>>>>>>>>> in try>>>>"+context.getContextPath());
             //   System.out.println(context.getRealPath("/")+"/"+filename);
                
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File("/home/neha/NetBeansProjects/ebook_thumbnails/subcategory/")+"/"+file_name));
                stream.write(bytes);
                stream.close();
                
           //     return "You successfully uploaded " + filename + "!";
            } catch (Exception e) {
                 System.out.println(">>>>>>>>>>>>> in catch of sub category  >>>"+e.getMessage());
          //      return "You failed to upload " + filename + " => " + e.getMessage();
            }
        } else {
           System.out.println("sub_category>>>>>file is empty");
         //   return "You failed to upload " + filename + " because the file was empty.";
        }
      //////////////////////////
      
      
      System.out.println(">>>"+time);
       bean.setSubCatg_path("/");
       bean.setSubCatg_thumb_path("/home/neha/NetBeansProjects/ebook_thumbnails/subcategory//");
       bean.setSubCatg_thumb_name(file_name);
      // System.out.println(bean.getCategoryName()+"_"+time);
        
       subcategoryDao.saveOrUpdate(bean);
       System.out.println("%%%%%%%%after save method");
       // return "addProductPage";
       
       model.setViewName("addProductPage");
       return model;
    }
    
    
     @RequestMapping(value="submitProductForm", method = RequestMethod.POST)
    public ModelAndView newProduct(ModelAndView model,ProductBean bean,@RequestParam("productName") String filename,@RequestParam("thumbUpload") MultipartFile file){
        System.out.println("Product:"+bean.getProductName());
        long time=System.currentTimeMillis();
        String file_name=filename+"_"+time+".jpg";
         if (!file.isEmpty()) {
            try {
                
                System.out.println(">>>>>>>>>>>>> in try of product");
                 System.out.println(">>>>>>>>>>>>> in try>>>>"+context.getContextPath());
             //   System.out.println(context.getRealPath("/")+"/"+filename);
                
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File("/home/neha/NetBeansProjects/ebook_thumbnails/product/")+"/"+file_name));
                stream.write(bytes);
                stream.close();
                
           //     return "You successfully uploaded " + filename + "!";
            } catch (Exception e) {
                 System.out.println(">>>>>>>>>>>>> in catch of product  >>>"+e.getMessage());
          //      return "You failed to upload " + filename + " => " + e.getMessage();
            }
        } else {
           System.out.println("product>>>>>file is empty");
         //   return "You failed to upload " + filename + " because the file was empty.";
        }
      //////////////////////////
      
      
      System.out.println(">>>"+time);
    //   bean.setPath("/");
       bean.setThumb_path("/home/neha/NetBeansProjects/ebook_thumbnails/product//");
       bean.setThumb_name(file_name);
      // System.out.println(bean.getCategoryName()+"_"+time);
        
       productDao.saveOrUpdate(bean);
       System.out.println("%%%%%%%%after save method");
       
       
        
       // return "addCategoryPage";
       model.setViewName("addCategoryPage");
       return model;
    }
    
    
    @RequestMapping(value = "submitCategoryForm", method = RequestMethod.POST)
    public ModelAndView newCategory(ModelAndView model,CategoryBean bean,@RequestParam("categoryName") String filename,@RequestParam("catg_thumbUpload") MultipartFile file) {
        //Contact newContact = new Contact();
        System.out.println("%%%%%%%%Category"+bean.getCategoryName());
        long time=System.currentTimeMillis();
        String file_name=filename+"_"+time+".jpg";
       // model.addObject("newCat", bean);
      // bean.setC_id(1);
      //////////////////////////
       if (!file.isEmpty()) {
            try {
                
                System.out.println(">>>>>>>>>>>>> in try");
                 System.out.println(">>>>>>>>>>>>> in try>>>>"+context.getContextPath());
             //   System.out.println(context.getRealPath("/")+"/"+filename);
                
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File("/home/neha/NetBeansProjects/ebook_thumbnails/category/")+"/"+file_name));
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
      
      
      System.out.println(">>>"+time);
       bean.setCatg_path("/");
       bean.setCatg_thumb_path("/home/neha/NetBeansProjects/ebook_thumbnails/category//");
       bean.setCatg_thumb_name(file_name);
       System.out.println(bean.getCategoryName()+"_"+time);
        
       categoryDao.saveOrUpdate(bean);
       System.out.println("%%%%%%%%after save method");
        model.setViewName("addSubcategoryPage");
        return model;
    }
    
 
    
}

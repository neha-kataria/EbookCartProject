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
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neha this controller class manages the data from the submit action of
 * add category subcategory and product
 */
@Controller
public class CategoryFormController extends ParentController implements ServletContextAware {

    private ServletContext context;

    @Autowired
    private AddCategoryDAO categoryDao;

    @Autowired
    private AddSubCategoryDAO subcategoryDao;
    @Autowired
    private AddProductDAO productDao;

    @Override
    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }

    @RequestMapping(value = "submitCategoryForm", method = RequestMethod.POST)
    public ModelAndView newCategory(ModelAndView model, CategoryBean bean, @RequestParam("categoryName") String filename, @RequestParam("catg_thumbUpload") MultipartFile file) {

        // validation checks
        String Cname = bean.getCategoryName().trim();

        if (!Cname.isEmpty()) {
            CategoryBean ob = categoryDao.get(Cname);
            if (ob != null) {
                model.addObject("error_msg", "Already existing");
                model.setViewName("addCategoryPage");
                return model;
            } else {
                bean.setCategoryName(Cname);
                bean.setParentName(bean.getParentName().trim());

            }
        }

        long time = System.currentTimeMillis();
        String file_name = filename + "_" + time + ".jpg";

        if (!file.isEmpty()) {
            try {

                byte[] bytes = file.getBytes();
                BufferedOutputStream stream
                        = new BufferedOutputStream(new FileOutputStream(new File("/home/neha/NetBeansProjects/ebook_thumbnails/category/") + "/" + file_name));
                stream.write(bytes);
                stream.close();

            } catch (Exception e) {
                System.out.println(">>>>>>>>>>>>> in catch  >>>" + e.getMessage());

            }
        } else {
            System.out.println(">>>>>file is empty");

        }

        MultipartFile th = bean.getCatg_thumbUpload();

        bean.setCatg_path("/");
        bean.setCatg_thumb_path("/home/neha/NetBeansProjects/ebook_thumbnails/category//");
        if (th.isEmpty()) {
            System.out.println("inside no thumb");
            bean.setCatg_thumb_name("nothumb.jpg");
        } else {
            bean.setCatg_thumb_name(file_name);
        }

        categoryDao.saveOrUpdate(bean);

        String url = "redirect: /EbookCart/addSubCategory?category=" + Cname;

        model.setViewName(url);
        return model;
    }

    @RequestMapping(value = "submitSubCategoryForm", method = RequestMethod.POST)
    public ModelAndView newSubCategory(ModelAndView model, SubCategoryBean bean, @RequestParam("subcategoryName") String filename, @RequestParam("subCatg_thumbUpload") MultipartFile file) {

        System.out.println("SubCategory" + bean.getSubcategoryName());
        String SubCname = bean.getSubcategoryName().trim();
        if (!SubCname.isEmpty()) {
            SubCategoryBean ob = subcategoryDao.get(SubCname);
            if (ob != null) {
                model.addObject("error_msg", "Already existing");
                model.setViewName("addSubCategoryPage");
                return model;
            } else {
                bean.setSubcategoryName(SubCname);
                bean.setSubCatg_parentName(bean.getSubCatg_parentName().trim());
                bean.setSubCatg_shortDesc(bean.getSubCatg_shortDesc().trim());

            }
        }

        long time = System.currentTimeMillis();
        String file_name = filename + "_" + time + ".jpg";
        if (!file.isEmpty()) {
            try {

                byte[] bytes = file.getBytes();
                BufferedOutputStream stream
                        = new BufferedOutputStream(new FileOutputStream(new File("/home/neha/NetBeansProjects/ebook_thumbnails/subcategory/") + "/" + file_name));
                stream.write(bytes);
                stream.close();

            } catch (Exception e) {
                System.out.println(">>>>>>>>>>>>> in catch of sub category  >>>" + e.getMessage());

            }
        } else {
            System.out.println("sub_category>>>>>file is empty");

        }

        System.out.println(">>>" + time);
        System.out.println(">>>" + bean.getSubCatg_parentName());
        bean.setSubCatg_path("/" + bean.getSubCatg_parentName());

        bean.setSubCatg_thumb_path("/home/neha/NetBeansProjects/ebook_thumbnails/subcategory//");

        MultipartFile th = bean.getSubCatg_thumbUpload();
        if (th.isEmpty()) {
            System.out.println("inside no thumb");
            bean.setSubCatg_thumb_name("nothumb.jpg");
        } else {
            bean.setSubCatg_thumb_name(file_name);
        }

        subcategoryDao.saveOrUpdate(bean);

        String url = "redirect: /EbookCart/addProduct?category=" + bean.getSubCatg_parentName() + "&subcategory=" + SubCname;
        model.setViewName(url);
        return model;
    }

    @RequestMapping(value = "submitProductForm", method = RequestMethod.POST)
    public ModelAndView newProduct(ModelAndView model, ProductBean bean, @RequestParam("productName") String filename, @RequestParam("thumbUpload") MultipartFile file) {
        System.out.println("Product:" + bean.getProductName());
        ProductBean obj = productDao.get(bean.getProductName().trim());
        if (obj != null) {
            model.addObject("error_msg", "Already existing");
            model.setViewName("addProductPage");
            return model;
        }
        long time = System.currentTimeMillis();
        String file_name = filename + "_" + time + ".jpg";
        if (!file.isEmpty()) {
            try {

                byte[] bytes = file.getBytes();
                BufferedOutputStream stream
                        = new BufferedOutputStream(new FileOutputStream(new File("/home/neha/NetBeansProjects/ebook_thumbnails/product/") + "/" + file_name));
                stream.write(bytes);
                stream.close();

            } catch (Exception e) {
                System.out.println(">>>>>>>>>>>>> in catch of product  >>>" + e.getMessage());

            }
        } else {
            System.out.println("product>>>>>file is empty");

        }

        System.out.println(">>>" + time);
        bean.setPath("/" + bean.getParentName() + "/" + bean.getSubCategoryName());
        bean.setThumb_path("/home/neha/NetBeansProjects/ebook_thumbnails/product//");

        MultipartFile th = bean.getThumbUpload();
        if (th.isEmpty()) {
            System.out.println("inside no thumb");
            bean.setThumb_name("nothumb.jpg");
        } else {
            bean.setThumb_name(file_name);
        }

        productDao.saveOrUpdate(bean);
        // System.out.println("%%%%%%%%after save method");

        model.setViewName("redirect:addCategory");
        return model;
    }

}

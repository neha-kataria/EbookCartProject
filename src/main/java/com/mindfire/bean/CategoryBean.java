/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.bean;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author neha
 * bean used to add category
 */
public class CategoryBean {

    String categoryName;
    String parentName;
    String catg_showTitle;
    //MultipartStream thumb;
    MultipartFile catg_thumbUpload;
    String catg_path;
    int c_id;
    String catg_thumb_path;
    String catg_thumb_name;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getCatg_showTitle() {
        return catg_showTitle;
    }

    public void setCatg_showTitle(String catg_showTitle) {
        this.catg_showTitle = catg_showTitle;
    }

    public MultipartFile getCatg_thumbUpload() {
        return catg_thumbUpload;
    }

    public void setCatg_thumbUpload(MultipartFile catg_thumbUpload) {
        this.catg_thumbUpload = catg_thumbUpload;
    }

    public String getCatg_path() {
        return catg_path;
    }

    public void setCatg_path(String catg_path) {
        this.catg_path = catg_path;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getCatg_thumb_path() {
        return catg_thumb_path;
    }

    public void setCatg_thumb_path(String catg_thumb_path) {
        this.catg_thumb_path = catg_thumb_path;
    }

    public String getCatg_thumb_name() {
        return catg_thumb_name;
    }

    public void setCatg_thumb_name(String catg_thumb_name) {
        this.catg_thumb_name = catg_thumb_name;
    }

   
}

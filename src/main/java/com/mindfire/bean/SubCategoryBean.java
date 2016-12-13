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
 * bean used to add subcategory under category
 */
public class SubCategoryBean {
   // CategoryBean parent;
    String subcategoryName;
    String subCatg_parentName;
    String subCatg_shortDesc;
    String subCatg_showTitle;
    String subCatg_path;
  //  MultipartStream thumb;
 MultipartFile subCatg_thumbUpload;
    String subCatg_thumb_path;
    String subCatg_thumb_name;
    int s_id;

    public String getSubcategoryName() {
        return subcategoryName;
    }

    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }

    public String getSubCatg_parentName() {
        return subCatg_parentName;
    }

    public void setSubCatg_parentName(String subCatg_parentName) {
        this.subCatg_parentName = subCatg_parentName;
    }

    public String getSubCatg_shortDesc() {
        return subCatg_shortDesc;
    }

    public void setSubCatg_shortDesc(String subCatg_shortDesc) {
        this.subCatg_shortDesc = subCatg_shortDesc;
    }

    public String getSubCatg_showTitle() {
        return subCatg_showTitle;
    }

    public void setSubCatg_showTitle(String subCatg_showTitle) {
        this.subCatg_showTitle = subCatg_showTitle;
    }

    public String getSubCatg_path() {
        return subCatg_path;
    }

    public void setSubCatg_path(String subCatg_path) {
        this.subCatg_path = subCatg_path;
    }

    public MultipartFile getSubCatg_thumbUpload() {
        return subCatg_thumbUpload;
    }

    public void setSubCatg_thumbUpload(MultipartFile subCatg_thumbUpload) {
        this.subCatg_thumbUpload = subCatg_thumbUpload;
    }

    public String getSubCatg_thumb_path() {
        return subCatg_thumb_path;
    }

    public void setSubCatg_thumb_path(String subCatg_thumb_path) {
        this.subCatg_thumb_path = subCatg_thumb_path;
    }

    public String getSubCatg_thumb_name() {
        return subCatg_thumb_name;
    }

    public void setSubCatg_thumb_name(String subCatg_thumb_name) {
        this.subCatg_thumb_name = subCatg_thumb_name;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    
    
}

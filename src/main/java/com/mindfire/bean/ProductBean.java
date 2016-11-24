/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.bean;

import org.apache.commons.fileupload.MultipartStream;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author neha
 */
public class ProductBean {
    String productName;
    String parentName;
    String subCategoryName;
    int totalQuant;
    int availQuant;
    float price;
    String shortDesc;
    String longDesc;
    String showTitle;
       MultipartFile thumbUpload;
    String thumb_name;
    String thumb_path;
    String path;
    int p_id;

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getSubCategoryName() {
        return subCategoryName;
    }

    public void setSubCategoryName(String subCategoryName) {
        this.subCategoryName = subCategoryName;
    }

    public int getTotalQuant() {
        return totalQuant;
    }

    public void setTotalQuant(int totalQuant) {
        this.totalQuant = totalQuant;
    }

    public int getAvailQuant() {
        return availQuant;
    }

    public void setAvailQuant(int availQuant) {
        this.availQuant = availQuant;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public String getLongDesc() {
        return longDesc;
    }

    public void setLongDesc(String longDesc) {
        this.longDesc = longDesc;
    }

    public String getShowTitle() {
        return showTitle;
    }

    public void setShowTitle(String showTitle) {
        this.showTitle = showTitle;
    }

    public String getThumb_name() {
        return thumb_name;
    }

    public void setThumb_name(String thumb_name) {
        this.thumb_name = thumb_name;
    }

    public String getThumb_path() {
        return thumb_path;
    }

    public void setThumb_path(String thumb_path) {
        this.thumb_path = thumb_path;
    }

    public MultipartFile getThumbUpload() {
        return thumbUpload;
    }

    public void setThumbUpload(MultipartFile thumbUpload) {
        this.thumbUpload = thumbUpload;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

 
 
    
}

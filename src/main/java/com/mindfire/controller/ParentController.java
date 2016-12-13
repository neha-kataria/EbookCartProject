/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author neha
 */
@Controller
@SessionAttributes({"logged_user", "prod_list", "login_type", "selected", "catg_list","subcatg_list","subCategoryDaoObject","addtocartlist"})
public class ParentController {
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.bean;

/**
 *
 * @author neha
 */
public class RegisterUserBean {
    int u_id;
    String username;
    String password;
    String email;
    String contact;
   // int age;
    String login_type;
    String forgot_token;
    String forgot_link_expire;

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String Contact) {
        this.contact = Contact;
    }

//    public int getAge() {
//        return age;
//    }
//
//    public void setAge(int age) {
//        this.age = age;
//    }

    public String getLogin_type() {
        return login_type;
    }

    public void setLogin_type(String login_type) {
        this.login_type = login_type;
    }

    public String getForgot_token() {
        return forgot_token;
    }

    public void setForgot_token(String forgot_token) {
        this.forgot_token = forgot_token;
    }

    public String getForgot_link_expire() {
        return forgot_link_expire;
    }

    public void setForgot_link_expire(String forgot_link_expire) {
        this.forgot_link_expire = forgot_link_expire;
    }
    
    
}

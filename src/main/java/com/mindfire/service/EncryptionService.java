/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author neha
 */
public class EncryptionService {

    /**
     * method used to encrypt password entry
     *
     * @param pass : data entered by the input box of the form
     * @return encrypted password
     */
    public String encryptPass(String pass) {
        // String passwordToHash = "password";
        String passwordToHash = pass;
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(passwordToHash.getBytes());
            //Get the hash's bytes 
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        System.out.println(generatedPassword);
        return generatedPassword;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.config;

import com.mindfire.dao.AddCategoryDAO;
import com.mindfire.dao.AddProductDAO;
import com.mindfire.dao.AddSubCategoryDAO;
import com.mindfire.dao.AddUserDAO;
import com.mindfire.service.AddCategoryImpl;
import com.mindfire.service.AddProductImpl;
import com.mindfire.service.AddSubCategoryImpl;
import com.mindfire.service.AddUserImpl;
import javax.sql.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 *
 * @author neha
 */
@Configuration
@EnableWebMvc
@ComponentScan({"com.mindfire"})
public class WebConfig extends WebMvcConfigurerAdapter {

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("utf-8");
        return resolver;

    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler("/assets/**").addResourceLocations("file:///home/neha/NetBeansProjects/ebook_thumbnails/");
    }

    @Bean
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/EbookCartProject");
        dataSource.setUsername("root");
        dataSource.setPassword("mindfire");

        return dataSource;
    }

    @Bean
    public AddCategoryDAO getCategoryDAO() {
        return new AddCategoryImpl(getDataSource());
    }

    @Bean
    public AddSubCategoryDAO getSubCategoryDAO() {
        return new AddSubCategoryImpl(getDataSource());
    }

    @Bean
    public AddProductDAO getProductDAO() {
        return new AddProductImpl(getDataSource());
    }

    @Bean
    public AddUserDAO getUserDAO() {
        return new AddUserImpl(getDataSource());
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.service;

import com.mindfire.bean.AddToCartBean;
import com.mindfire.bean.RegisterUserBean;
import com.mindfire.dao.AddToCartDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author neha
 */
public class AddToCartImpl implements AddToCartDAO{
    
     private JdbcTemplate jdbcTemplate;

    public AddToCartImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    @Override
    public void saveOrUpdate(AddToCartBean order) {
        order.setId(0);
        if (order.getId() > 0) {
            // update
            String sql = "UPDATE cart SET user_id=?, product_id=?,quantity=? WHERE user_id=?";
                     
            jdbcTemplate.update(sql, order.getUserid(),order.getProduct_id(),order.getQuantity(),order.getUserid());
        } else {
            // insert
            System.out.println(">>>>>>>>>>>>>>>>>>inside save update method in else block");
            String sql = "INSERT INTO cart (user_id, product_id, quantity)"
                    + " VALUES (?, ?, ?)";
            jdbcTemplate.update(sql, order.getUserid(),order.getProduct_id(),order.getQuantity());
        }
 
    }

    @Override
    public void delete(String name) {
          String sql = "DELETE FROM registered_user WHERE username=?";
        jdbcTemplate.update(sql, name);
    }

    @Override
    public AddToCartBean get(String name) {
        
         String sql = "SELECT * FROM cart WHERE user_id='" + name+"'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<AddToCartBean>() {

            @Override
            public AddToCartBean extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                   AddToCartBean bean=new AddToCartBean();
                    bean.setId(rs.getInt("id"));
                    bean.setUserid(rs.getString("user_id"));
                    bean.setProduct_id(rs.getString("product_id"));
                    bean.setQuantity(rs.getInt("quantity"));
                   
                    return bean;
                }

                return null;
            }

        });
        
    }
    
    @Override
    public List<AddToCartBean> list() {
         String sql = "SELECT * FROM cart";
        List<AddToCartBean> listOrder = jdbcTemplate.query(sql, new RowMapper<AddToCartBean>() {

            @Override
            public AddToCartBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                

               AddToCartBean bean=new AddToCartBean();
                    bean.setId(rs.getInt("id"));
                    bean.setUserid(rs.getString("user_id"));
                    bean.setProduct_id(rs.getString("product_id"));
                    bean.setQuantity(rs.getInt("quantity"));
                   
                    return bean;

              //  return aUser;
            }

        });

        return listOrder;

        
    }
    

    @Override
    public List<AddToCartBean> user_list(String name) {
         String sql = "SELECT * FROM cart where user_id='"+name+"'";
        List<AddToCartBean> listOrder = jdbcTemplate.query(sql, new RowMapper<AddToCartBean>() {

            @Override
            public AddToCartBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                

               AddToCartBean bean=new AddToCartBean();
                    bean.setId(rs.getInt("id"));
                    bean.setUserid(rs.getString("user_id"));
                    bean.setProduct_id(rs.getString("product_id"));
                    bean.setQuantity(rs.getInt("quantity"));
                   
                    return bean;

              //  return aUser;
            }

        });

        return listOrder;

        
    }
    
}

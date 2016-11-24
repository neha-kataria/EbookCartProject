/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.service;

import com.mindfire.bean.CategoryBean;
import com.mindfire.bean.ProductBean;
import com.mindfire.dao.AddProductDAO;
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
public class AddProductImpl implements AddProductDAO{
    
      private JdbcTemplate jdbcTemplate;
    
    public AddProductImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

    @Override
    public void saveOrUpdate(ProductBean product) {
        // implementation details goes here...
       // String filename=category.getThumb_name()+".jpg";
        product.setP_id(0);
                if (product.getP_id() > 0) {
		// update
		String sql = "UPDATE product SET name=?,sub_catg_name=?, parent_name=?,total_quantity=?, avail_quantity=?, "
					+ "price=?, short_desc=?, long_desc=?, thumb_name=?, thumb_path=? , product_path=? WHERE id=?";
		jdbcTemplate.update(sql, product.getProductName(),product.getSubCategoryName(),product.getParentName(),
                        product.getTotalQuant(),product.getAvailQuant(),product.getShortDesc(), product.getLongDesc(),product.getThumb_path(),product.getThumb_name(),product.getPath());
	} else {
		// insert
                System.out.println(">>>>>>>>>>>>>>>>>>inside save update method in else block");
		String sql = "INSERT INTO product (name, sub_catg_name, parent_name,total_quantity, avail_quantity, "
					+ "price, short_desc,long_desc,thumb_path,thumb_name,product_path)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
		jdbcTemplate.update(sql, product.getProductName(),product.getSubCategoryName(),product.getParentName(),
                        product.getTotalQuant(),product.getAvailQuant(),product.getPrice(),product.getShortDesc(),product.getLongDesc(),product.getThumb_path(),product.getThumb_name(),product.getPath());
	}



    }

    @Override
    public void delete(int p_id) {
        // implementation details goes here...
                String sql = "DELETE FROM product WHERE id=?";
	jdbcTemplate.update(sql, p_id);
    }

    @Override
    public ProductBean get(int p_id) {
       // implementation details goes here...
                String sql = "SELECT * FROM product WHERE id=" + p_id;
	return jdbcTemplate.query(sql, new ResultSetExtractor<ProductBean>() {

		@Override
		public ProductBean extractData(ResultSet rs) throws SQLException,
				DataAccessException {
			if (rs.next()) {
				ProductBean product = new ProductBean();
				product.setP_id(rs.getInt("id"));
				product.setProductName(rs.getString("name"));
                                product.setSubCategoryName(rs.getString("sub_catg_name"));
				product.setParentName(rs.getString("parent_name"));
				product.setTotalQuant(rs.getInt("total_quantity"));
				product.setAvailQuant(rs.getInt("avail_quantity"));
                                product.setShortDesc(rs.getString("short_desc"));
                                product.setLongDesc(rs.getString("long_desc"));
                                product.setPrice(rs.getFloat("price"));
                                product.setThumb_name(rs.getString("thumb_name"));
                                product.setThumb_path(rs.getString("thumb_path"));
				return product;
			}

			return null;
		}

	});
    }

    @Override
    public List<ProductBean> list() {
       // implementation details goes here...
                String sql = "SELECT * FROM product";
	List<ProductBean> listCategory = jdbcTemplate.query(sql, new RowMapper<ProductBean>() {

		@Override
		public ProductBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProductBean product = new ProductBean();
				product.setP_id(rs.getInt("id"));
				product.setProductName(rs.getString("name"));
                                product.setSubCategoryName(rs.getString("sub_catg_name"));
				product.setParentName(rs.getString("parent_name"));
				product.setTotalQuant(rs.getInt("total_quantity"));
				product.setAvailQuant(rs.getInt("avail_quantity"));
                                product.setShortDesc(rs.getString("short_desc"));
                                product.setLongDesc(rs.getString("long_desc"));
                                product.setPrice(rs.getFloat("price"));
                                product.setThumb_name(rs.getString("thumb_name"));
                                product.setThumb_path(rs.getString("thumb_path"));
				return product;
		}

                   

	});

	return listCategory;

    }

    
    
}

    


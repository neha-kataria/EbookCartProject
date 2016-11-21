/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.service;

import com.mindfire.bean.CategoryBean;
import com.mindfire.dao.AddCategoryDAO;
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
public class AddCategoryImpl  implements AddCategoryDAO{
    private JdbcTemplate jdbcTemplate;
    
    public AddCategoryImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

    @Override
    public void saveOrUpdate(CategoryBean category) {
        // implementation details goes here...
       // String filename=category.getThumb_name()+".jpg";
        category.setC_id(0);
                if (category.getC_id() > 0) {
		// update
		String sql = "UPDATE category SET name=?, parent_category=?,display_at=?, "
					+ "path=? WHERE id=?";
		jdbcTemplate.update(sql, category.getCategoryName(), category.getParentName(),
				category.getCatg_showTitle(), category.getCatg_path(), category.getC_id());
	} else {
		// insert
                System.out.println(">>>>>>>>>>>>>>>>>>inside save update method in else block");
		String sql = "INSERT INTO category (name, parent_category, display_at, path,thumb_path,thumb_name)"
					+ " VALUES (?, ?, ?, ?, ?,?)";
		jdbcTemplate.update(sql, category.getCategoryName(), category.getParentName(),
				category.getCatg_showTitle(), category.getCatg_path(),category.getCatg_thumb_path(),category.getCatg_thumb_name());
	}



    }

    @Override
    public void delete(int c_id) {
        // implementation details goes here...
                String sql = "DELETE FROM category WHERE id=?";
	jdbcTemplate.update(sql, c_id);
    }

    @Override
    public CategoryBean get(int c_id) {
       // implementation details goes here...
                String sql = "SELECT * FROM category WHERE id=" + c_id;
	return jdbcTemplate.query(sql, new ResultSetExtractor<CategoryBean>() {

		@Override
		public CategoryBean extractData(ResultSet rs) throws SQLException,
				DataAccessException {
			if (rs.next()) {
				CategoryBean catg_bean = new CategoryBean();
				catg_bean.setC_id(rs.getInt("id"));
				catg_bean.setCategoryName(rs.getString("name"));
				catg_bean.setParentName(rs.getString("parent_category"));
				catg_bean.setCatg_showTitle(rs.getString("display_at"));
				catg_bean.setCatg_path(rs.getString("path"));
				return catg_bean;
			}

			return null;
		}

	});
    }

    @Override
    public List<CategoryBean> list() {
       // implementation details goes here...
                String sql = "SELECT * FROM category";
	List<CategoryBean> listCategory = jdbcTemplate.query(sql, new RowMapper<CategoryBean>() {

		@Override
		public CategoryBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			CategoryBean aCategory = new CategoryBean();

			aCategory.setC_id(rs.getInt("id"));
			aCategory.setCategoryName(rs.getString("name"));
			aCategory.setParentName(rs.getString("parent_category"));
			aCategory.setCatg_showTitle(rs.getString("display_at"));
			aCategory.setCatg_path(rs.getString("path"));
                        aCategory.setCatg_thumb_path(rs.getString("thumb_path"));
                        aCategory.setCatg_thumb_name(rs.getString("thumb_name"));

			return aCategory;
		}

                   

	});

	return listCategory;

    }
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.service;

import com.mindfire.bean.CategoryBean;
import com.mindfire.bean.SubCategoryBean;
import com.mindfire.dao.AddSubCategoryDAO;
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
 * this class implements AddSubCategoryDAO inteface to add subcategory
 */
public class AddSubCategoryImpl implements AddSubCategoryDAO {
    private JdbcTemplate jdbcTemplate;
    
    public AddSubCategoryImpl(DataSource dataSource){
        jdbcTemplate=new JdbcTemplate(dataSource);
    }

    @Override
    public void saveOrUpdate(SubCategoryBean subCatg) {
         subCatg.setS_id(0);
                if (subCatg.getS_id() > 0) {
		// update
		String sql = "UPDATE sub_category SET name=?, parent_category=?,display_at=?, "
					+ "path=?, short_desc=? WHERE id=?";
		jdbcTemplate.update(sql, subCatg.getSubcategoryName(), subCatg.getSubCatg_parentName(),
				subCatg.getSubCatg_showTitle(), subCatg.getSubCatg_path(),subCatg.getSubCatg_shortDesc() ,subCatg.getS_id());
	} else {
		// insert
                System.out.println(">>>>>>>>>>>>>>>>>>inside save update method in else block");
		String sql = "INSERT INTO sub_category (name, parent_category, display_at, path,short_desc,thumb_path,thumb_name)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, subCatg.getSubcategoryName(), subCatg.getSubCatg_parentName(),
				subCatg.getSubCatg_showTitle(), subCatg.getSubCatg_path(),subCatg.getSubCatg_shortDesc() ,subCatg.getSubCatg_thumb_path(),subCatg.getSubCatg_thumb_name());
	}



     
    }

    @Override
    public void delete(int s_id) {
              String sql = "DELETE FROM sub_category WHERE id=?";
	jdbcTemplate.update(sql, s_id);
      
    }

    @Override
    public SubCategoryBean get(String name) {
          String sql = "SELECT * FROM sub_category WHERE parent_category='" + name+"'";
	return jdbcTemplate.query(sql, new ResultSetExtractor<SubCategoryBean>() {

		@Override
		public SubCategoryBean extractData(ResultSet rs) throws SQLException,
				DataAccessException {
			if (rs.next()) {
				SubCategoryBean sub_bean = new SubCategoryBean();
				sub_bean.setS_id(rs.getInt("id"));
				sub_bean.setSubcategoryName(rs.getString("name"));
				sub_bean.setSubCatg_parentName(rs.getString("parent_category"));
				sub_bean.setSubCatg_showTitle(rs.getString("display_at"));
				sub_bean.setSubCatg_path(rs.getString("path"));
                                sub_bean.setSubCatg_shortDesc(rs.getString("short_desc"));
                                sub_bean.setSubCatg_thumb_name(rs.getString("thumb_name"));
                                sub_bean.setSubCatg_thumb_path(rs.getString("thumb_path"));
				return sub_bean;
			}

			return null;
		}

	});
        
    }

    @Override
    public List<SubCategoryBean> list(String name) {
        
          String sql = "SELECT * FROM sub_category where parent_category='"+name+"'";
	List<SubCategoryBean> listCategory = jdbcTemplate.query(sql, new RowMapper<SubCategoryBean>() {

		@Override
		public SubCategoryBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			SubCategoryBean sCategory = new SubCategoryBean();

			sCategory.setS_id(rs.getInt("id"));
			sCategory.setSubcategoryName(rs.getString("name"));
			sCategory.setSubCatg_parentName(rs.getString("parent_category"));
			sCategory.setSubCatg_showTitle(rs.getString("display_at"));
			sCategory.setSubCatg_path(rs.getString("path"));
                        sCategory.setSubCatg_shortDesc(rs.getString("short_desc"));
                        
                        sCategory.setSubCatg_thumb_path(rs.getString("thumb_path"));
                        sCategory.setSubCatg_thumb_name(rs.getString("thumb_name"));

			return sCategory;
		}

                   

	});

	return listCategory;

        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mindfire.service;

import com.mindfire.bean.RegisterUserBean;
import com.mindfire.dao.AddUserDAO;
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
 * class implementing interface AddUserDao to add new user
 */
public class AddUserImpl implements AddUserDAO {

    private JdbcTemplate jdbcTemplate;

    public AddUserImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public void saveOrUpdate(RegisterUserBean user) {
        // implementation details goes here...
        // String filename=category.getThumb_name()+".jpg";
        user.setU_id(0);
        if (user.getU_id() > 0) {
            // update
            String sql = "UPDATE registered_user SET username=?, password=?,email=?,phone=? "
                    + "login_type=? WHERE id=?";
            jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getContact(), user.getLogin_type(), user.getU_id());
        } else {
            // insert
            System.out.println(">>>>>>>>>>>>>>>>>>inside save update method in else block");
            String sql = "INSERT INTO registered_user (username, password, email, phone,login_type)"
                    + " VALUES (?, ?, ?, ?, ?)";
            jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getContact(), user.getLogin_type());
        }

    }

    @Override
    public void delete(String name) {
        // implementation details goes here...
        String sql = "DELETE FROM registered_user WHERE username=?";
        jdbcTemplate.update(sql, name);
    }

    @Override
    public RegisterUserBean get(String name) {
        // implementation details goes here...
        String sql = "SELECT * FROM registered_user WHERE username='" + name+"'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<RegisterUserBean>() {

            @Override
            public RegisterUserBean extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    RegisterUserBean bean = new RegisterUserBean();
                    bean.setU_id(rs.getInt("id"));
                    bean.setUsername(rs.getString("username"));
                    bean.setPassword(rs.getString("password"));
                    bean.setContact(rs.getString("phone"));
                    bean.setEmail(rs.getString("email"));
                    bean.setLogin_type("login_type");
                    return bean;
                }

                return null;
            }

        });
    }

    @Override
    public List<RegisterUserBean> list() {
        // implementation details goes here...
        String sql = "SELECT * FROM registered_user";
        List<RegisterUserBean> listUser = jdbcTemplate.query(sql, new RowMapper<RegisterUserBean>() {

            @Override
            public RegisterUserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                RegisterUserBean aUser = new RegisterUserBean();

                aUser.setU_id(rs.getInt("id"));
                aUser.setUsername(rs.getString("username"));
                aUser.setPassword(rs.getString("password"));
                aUser.setContact(rs.getString("phone"));
                aUser.setEmail(rs.getString("email"));
                aUser.setLogin_type(rs.getString("login_type"));

                return aUser;
            }

        });

        return listUser;

    }

}

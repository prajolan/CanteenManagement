/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.dao;

import com.itn.entities.Users;
import java.util.List;

/**
 *
 * @author Hp
 */
public interface UserDao {
public void save(Users u);
public Users findById(long id);
public Users findByUserName(String userName);
public void deleteById(long id);
public void deleteAll();
public List<Users> findAll(int pageid,int total);
public Long userCount();
       
}

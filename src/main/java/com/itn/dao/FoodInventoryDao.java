/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.dao;

import com.itn.entities.FoodInventory;
import java.util.List;

/**
 *
 * @author Hp
 */
public interface FoodInventoryDao {
    public void save(FoodInventory fi);

    public FoodInventory findById(long id);

    public FoodInventory findByFoodName(String foodName);

    public void deleteById(long id);

    public void deleteAll();

    public List<FoodInventory> findAll();

    
}

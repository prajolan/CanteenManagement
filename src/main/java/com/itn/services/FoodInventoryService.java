/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.services;

import com.itn.entities.FoodInventory;
import java.util.List;

/**
 *
 * @author Hp
 */
public interface FoodInventoryService {

    public void save(FoodInventory fi);

    public void update(FoodInventory fi);

    public FoodInventory findById(long id);

    public FoodInventory findByFoodName(String foodName);

    public void deleteById(long id);

    public void deleteAll();

    public List<FoodInventory> findAll();

    public boolean isFoodExist(FoodInventory food);

}

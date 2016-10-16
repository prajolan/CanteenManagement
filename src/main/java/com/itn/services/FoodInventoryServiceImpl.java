/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.services;

import com.itn.dao.FoodInventoryDao;
import com.itn.entities.FoodInventory;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Hp
 */
@Service//Tells the compiler that this is service class and resides in Buisness Layer
@Transactional
public class FoodInventoryServiceImpl implements FoodInventoryService {

    @Autowired
    private FoodInventoryDao foodInventoryDao;

    @Override
    public void save(FoodInventory fi) {
        foodInventoryDao.save(fi);
    }

    @Override
    public void update(FoodInventory fi) {
        FoodInventory food = foodInventoryDao.findById(fi.getId());
        food.setFoodName(fi.getFoodName());
        food.setPrice(fi.getPrice());

    }

    @Override
    public FoodInventory findById(long id) {
        return foodInventoryDao.findById(id);
    }

    @Override
    public FoodInventory findByFoodName(String foodName) {
        return foodInventoryDao.findByFoodName(foodName);
    }

    @Override
    public void deleteById(long id) {
        foodInventoryDao.deleteById(id);
    }

    @Override
    public void deleteAll() {
        foodInventoryDao.deleteAll();
    }

    @Override
    public List<FoodInventory> findAll() {
        List<FoodInventory> display = foodInventoryDao.findAll();
        return display;
    }

    @Override
    public boolean isFoodExist(FoodInventory food) {
        return foodInventoryDao.findByFoodName(food.getFoodName()) != null;
    }

}

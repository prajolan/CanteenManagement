/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.controller;

import com.itn.entities.FoodInventory;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hp
 */
public class Backend {
    List<FoodInventory> list = new ArrayList<>();
    private static int sum;

    public List<FoodInventory> getList() {
        return list;
    }

    public void setList(List<FoodInventory> list) {
        this.list = list;
    }
    
    public static int sum(List<FoodInventory> list){
        sum=0;
        for(FoodInventory food: list){
            sum+=food.getPrice();
        }
    return sum;
    }

    public static int getSum() {
        return sum;
    }

    public static void setSum(int sum) {
        Backend.sum = sum;
    }
    
}

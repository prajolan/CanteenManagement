/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.controller;

import com.itn.entities.FoodInventory;
import com.itn.services.FoodInventoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Hp
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private FoodInventoryService foodInventoryService;
     @RequestMapping(value = "/viewFood", method = RequestMethod.GET)
    public String displayFoodList(ModelMap mp) {
        List<FoodInventory> list=foodInventoryService.findAll();
        mp.addAttribute("foodItem",  list);
       int sum=0;
        for(FoodInventory food: list){
            sum+=food.getPrice();
        }
        mp.addAttribute("sum",sum);
        return "viewFood";
    }
    
    //    -------------------------Deleting Entry------------------------
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteFood(@RequestParam long id, ModelMap mp) {
        foodInventoryService.deleteById(id);

        return "redirect:viewFood";

    }
    
}

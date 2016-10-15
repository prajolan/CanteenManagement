/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.controller;

import com.itn.entities.FoodInventory;
import com.itn.entities.UserProfile;
import com.itn.entities.Users;
import com.itn.services.FoodInventoryService;
import com.itn.services.UserProfileService;
import com.itn.services.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
     @Autowired
    private UserService userService;
     
      @Autowired
    private UserProfileService userProfileService;

   

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
     @RequestMapping(value = "/newuser")
    public String loadUserPage(ModelMap mp) {
        mp.addAttribute("user", new Users());
        return "userRegistration";

    }
     @RequestMapping(value = "/newuser", method = RequestMethod.POST)
    public String submitUser(@ModelAttribute Users user, ModelMap mp) {
        userService.save(user);
        mp.addAttribute("users", userService.findAll());
        return "redirect:newuser";

    }
     @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }
    
}

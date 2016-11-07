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

import org.springframework.web.bind.annotation.PathVariable;

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

    
    @RequestMapping(value = "/home", method =RequestMethod.GET)
    public String loadHome(ModelMap mp) {
        return "home";
    }
    
   

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
    
    //    -------------------------Editing Entry------------------------
    @RequestMapping(value = "/edit-{foodid}", method = RequestMethod.GET)
    public String editFood(ModelMap mp, @PathVariable long foodid) {
        FoodInventory food = foodInventoryService.findById(foodid);
        mp.addAttribute("foodInventory", food);
        mp.addAttribute("edit", true);
        return "addFood";
    }

    @RequestMapping(value = "/edit-{foodid}", method = RequestMethod.POST)
    public String postEditedFood(@ModelAttribute FoodInventory foodInventory, ModelMap mp) {
        foodInventoryService.update(foodInventory);
        //redirect function takes to the fucntion with value "viewFood" while return "viewFood" goes 
        // to the viewFood page with out having anything on the list
        return "redirect:viewFood";
    }
    
     // -------------------------loading page for new FoodEntry------------------------
    @RequestMapping(value = "/newFood")
    public String loadPage(ModelMap mp) {
        mp.addAttribute("foodInventory", new FoodInventory());
        return "addFood";

    }
    
    //    -------------------------Saving new Entry------------------------

    @RequestMapping(value = "/newFood", method = RequestMethod.POST)
    public String submitFood(@ModelAttribute FoodInventory foodInventory, ModelMap mp) {
        foodInventoryService.save(foodInventory);
        mp.addAttribute("foodItem", foodInventoryService.findAll());

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
        return "createUser";

    }
//     @RequestMapping(value = "/newuser", method = RequestMethod.POST)
//    public String submitUser(@ModelAttribute Users user, ModelMap mp) {
//        userService.save(user);
//        mp.addAttribute("users", userService.findAll());
//        return "redirect:newuser";
//
//    }
    
//    @RequestMapping(value = "/viewUsers", method = RequestMethod.GET)
//    public String displayAllUsers(ModelMap mp){
//        List<Users> list = userService.findAll();
//        mp.addAttribute("users", list);
//        return "viewUsers";
//    
//    }
    
    //    -------------------------Editing Entry------------------------
    @RequestMapping(value = "/editUser-{usersid}", method = RequestMethod.GET)
    public String editUser(ModelMap mp, @PathVariable long usersid) {
        Users user = userService.findById(usersid);
        mp.addAttribute("user", user);
        mp.addAttribute("edit", true);
        return "createUser";
    }

    @RequestMapping(value = "/editUser-{usersid}", method = RequestMethod.POST)
    public String postEditedUser(@ModelAttribute Users user, ModelMap mp) {
        userService.update(user);
        //redirect function takes to the fucntion with value "viewUsers" while return "viewUsers" goes 
        // to the viewUsers page with out having anything on the list
        return "redirect:viewUsers";
    }
    //    -------------------------Deleting Entry for user------------------------
    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public String deleteUser(@RequestParam long id, ModelMap mp) {
        userService.deleteById(id);

        return "redirect:viewUsers";

    }

    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }
    
}

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Hp
 */
@Controller
public class IndexController {

    Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private FoodInventoryService foodInventoryService;
     @Autowired
    private UserService userService;
     
      @Autowired
    private UserProfileService userProfileService;

    @RequestMapping(value = {"/letssee"}, method = RequestMethod.GET)
    public String letssee(ModelMap model) {
        return "FoodManagement";
    }
    
     @RequestMapping(value = {"/canteensee"}, method = RequestMethod.GET)
    public String canteensee(ModelMap model) {
        return "CanteenManagement";
    }
    
    @RequestMapping(value = {"/usersee"}, method = RequestMethod.GET)
    public String usersee(ModelMap model){
    return "UserManagement";
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        return "home";
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

    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }

//  
    //    -------------------------loading page for new FoodEntry ends here------------------------
    //    -------------------------loading page for new User Entry------------------------
    //    -------------------------loading page for new User Entry ends here------------------------
    //    -------------------------Saving new USER Entry------------------------
    //    -------------------------Saving new Entry------------------------
    @RequestMapping(value = "/newFood", method = RequestMethod.POST)
    public String submitFood(@ModelAttribute FoodInventory foodInventory, ModelMap mp) {
        foodInventoryService.save(foodInventory);
        mp.addAttribute("foodItem", foodInventoryService.findAll());

        return "list";

    }
//    ----------------------------------Security Log in------------------------------------------------

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    //When you type admin it directly goes to login page, this is inbuilt function by spring
    public String adminPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());//This only gives the username so it can compare for sercituy
        return "redirect:/admin/home";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    //When you type admin it directly goes to login page, this is inbuilt function by spring
    public String userPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());//This only gives the username so it can compare for sercituy
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {

        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }

    //    ----------------------------------Security Log in ends here------------------------------------------------
    @RequestMapping(value = "/home")
    public String loadHome(ModelMap mp) {
        return "home";
    }

    //Usued for enum classes to pull all the options of UserProfile
//    ----------------------------------Get Principle Method-------------------------------------------
    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
    //    ----------------------------------Get Principle Method ends here-------------------------------------------

}

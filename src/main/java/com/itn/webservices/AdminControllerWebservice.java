/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.webservices;

import com.itn.entities.FoodInventory;
import com.itn.entities.Users;
import com.itn.services.FoodInventoryService;
import com.itn.services.UserService;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author binod
 */
@RestController
public class AdminControllerWebservice {
  private static final  Logger logger=LoggerFactory.getLogger(AdminControllerWebservice.class);

    @Autowired
    private FoodInventoryService foodInventoryService;
    
    @Autowired
    private UserService userService;

    //    -------------------------Displaying total list of Entry------------------------
    @RequestMapping("/foods")
    public ResponseEntity<List<FoodInventory>> findAllList() {
        List<FoodInventory> allFoodList = foodInventoryService.findAll();
        logger.info("size is {}",allFoodList.size());
        return new ResponseEntity<List<FoodInventory>>(allFoodList, HttpStatus.OK);
    }
    //-------------------Retrieve Single Food--------------------------------------------------------
      
    @RequestMapping(value = "/food/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<FoodInventory> getFood(@PathVariable("id") long id) {
        logger.info("Fetching food with id " + id);
        FoodInventory foodInventory = foodInventoryService.findById(id);
        if (foodInventory == null) {
            logger.info("Food with id " + id + " not found");
            return new ResponseEntity<FoodInventory>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<FoodInventory>(foodInventory, HttpStatus.OK);
    }
    
    
    
     //-------------------Create a Food--------------------------------------------------------
      
    @RequestMapping(value = "/food", method = RequestMethod.POST)
    public ResponseEntity<Void> createFood(@RequestBody FoodInventory food,    UriComponentsBuilder ucBuilder) {
        logger.info("Creating Food " + food.getFoodName());
  
        if (foodInventoryService.isFoodExist(food)) {
            logger.info("A Food already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
  
        foodInventoryService.save(food);
  
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/food/{id}").buildAndExpand(food.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    
     @RequestMapping(value = "/food/{id}", method = RequestMethod.PUT)
    public ResponseEntity<FoodInventory> updateUser(@PathVariable("id") long id, @RequestBody FoodInventory foodInventory) {
        logger.info("Updating Food " + id);
          
        FoodInventory currentFood = foodInventoryService.findById(id);
          
        if (currentFood==null) {
            logger.info("Food with id " + id + " not found");
            return new ResponseEntity<FoodInventory>(HttpStatus.NOT_FOUND);
        }
  
        currentFood.setFoodName(foodInventory.getFoodName());
        currentFood.setPrice(foodInventory.getPrice());
        foodInventoryService.update(currentFood);
        return new ResponseEntity<FoodInventory>(currentFood, HttpStatus.OK);
    }
    //------------------- Delete a User --------------------------------------------------------
      
    @RequestMapping(value = "/food/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<FoodInventory> deleteUser(@PathVariable("id") long id) {
        logger.info("Fetching & Deleting Food with id " + id);
  
        FoodInventory foodInventory = foodInventoryService.findById(id);
        if (foodInventory == null) {
            System.out.println("Unable to delete. User with id " + id + " not found");
            return new ResponseEntity<FoodInventory>(HttpStatus.NOT_FOUND);
        }
  
        foodInventoryService.deleteById(id);
        return new ResponseEntity<FoodInventory>(HttpStatus.NO_CONTENT);
    }

    //    -------------------------Displaying total list of Entry for USERS!!!------------------------
    @RequestMapping("/users")
    public ResponseEntity<List<Users>> findAllUsers() {
        List<Users> allUserList = userService.findAll();
        logger.info("size is {}",allUserList.size());
        System.out.println(allUserList.size());
        return new ResponseEntity<List<Users>>(allUserList, HttpStatus.OK);
    }
    
    //-------------------Retrieve Single User--------------------------------------------------------
      
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Users> getUser(@PathVariable("id") long id) {
        logger.info("Fetching user with id " + id);
        Users user = userService.findById(id);
        if (user == null) {
            logger.info("User with id " + id + " not found");
            return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Users>(user, HttpStatus.OK);
    }
    
    
    
}

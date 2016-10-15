/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.webservices;

import com.itn.entities.FoodInventory;
import com.itn.services.FoodInventoryService;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author binod
 */
@RestController
public class AdminControllerWebservice {
  private static final  Logger logger=LoggerFactory.getLogger(AdminControllerWebservice.class);

    @Autowired
    private FoodInventoryService foodInventoryService;

    //    -------------------------Displaying total list of Entry------------------------
    @RequestMapping("/foods")
    public ResponseEntity<List<FoodInventory>> findAllList() {
        List<FoodInventory> allFoodList = foodInventoryService.findAll();
        logger.info("size is {}",allFoodList.size());
        return new ResponseEntity<List<FoodInventory>>(allFoodList, HttpStatus.OK);
    }
    //-------------------Retrieve Single Food--------------------------------------------------------
      
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<FoodInventory> getFood(@PathVariable("id") long id) {
        logger.info("Fetching food with id " + id);
        FoodInventory foodInventory = foodInventoryService.findById(id);
        if (foodInventory == null) {
            logger.info("Food with id " + id + " not found");
            return new ResponseEntity<FoodInventory>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<FoodInventory>(foodInventory, HttpStatus.OK);
    }
    @RequestMapping(value = "/food",method = RequestMethod.POST)
    public ResponseEntity<Void> createFood(@RequestBody FoodInventory food){
        foodInventoryService.save(food);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }
     @RequestMapping(value = "/food",method = RequestMethod.PUT)
    public ResponseEntity<Void> updateFood(@RequestBody FoodInventory food){
        foodInventoryService.save(food);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }

}

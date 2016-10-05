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
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
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
    @RequestMapping("/allFoodEnventoroy")
    public ResponseEntity<List<FoodInventory>> findAllList() {
        List<FoodInventory> allFoodList = foodInventoryService.findAll();
        logger.info("size is {}",allFoodList.size());
        return new ResponseEntity<List<FoodInventory>>(allFoodList, HttpStatus.OK);
    }

}

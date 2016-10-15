/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.util;

/**
 *
 * @author Hp
 */
public enum UserState {
     ACTIVE("Active"),
    INACTIVE("Inactive");
    
    private String state;

    private UserState(String state) {
        this.state = state;
    }

    public static UserState getACTIVE() {
        return ACTIVE;
    }

    public static UserState getINACTIVE() {
        return INACTIVE;
    }

    public String getUserState() {
        return state;
    }
    
    }
    
    
    


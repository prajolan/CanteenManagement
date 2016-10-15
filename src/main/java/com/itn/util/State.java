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
//This class has not been used right now
public enum State {
    ACTIVE("Active"),
    INACTIVE("Deleted");
    
    private String state;

    private State(String state) {
        this.state = state;
    }

    public static State getACTIVE() {
        return ACTIVE;
    }

    public static State getINACTIVE() {
        return INACTIVE;
    }

    public String getState() {
        return state;
    }
    
}

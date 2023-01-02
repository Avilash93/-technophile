/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.hub.entities;

/**
 *
 * @author Avilash
 */
public class Categories {
    private int catId;
    private String catName;
    private String catDescription;

    public Categories() {
    }

    public Categories(int catId, String catName, String catDescription) {
        this.catId = catId;
        this.catName = catName;
        this.catDescription = catDescription;
    }

    public Categories(String catName, String catDescription) {
        this.catName = catName;
        this.catDescription = catDescription;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public String getCatDescription() {
        return catDescription;
    }

    public void setCatDescription(String catDescription) {
        this.catDescription = catDescription;
    }
    
    
}

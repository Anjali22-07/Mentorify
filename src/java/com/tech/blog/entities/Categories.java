/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author Anjali Singh
 */
public class Categories {
    
     private int cId;
    private String name;
    private String descr;

    public Categories(int cId, String name, String descr) {
        this.cId = cId;
        this.name = name;
        this.descr = descr;
    }

    public Categories() {      //default constructor
    }

    public Categories(String name, String descr) {
        this.name = name;
        this.descr = descr;
    }
    
     //since the values are private...they cannot be accessed outside the claass
    //so, we use getters and setters

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    
    
    
}

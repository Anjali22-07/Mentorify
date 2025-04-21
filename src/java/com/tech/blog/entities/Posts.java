/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

//this class is used to represent posts table

import java.sql.*;

public class Posts {
    
    private int p_id;
    private String  title;
    private String  content;
    private String code;
    private String  picture;
    private Timestamp date;
    private int  catId;
    private int userId;
    
    
    public Posts(int p_id, String title, String content, String code, String picture, Timestamp date, int catId, int userId) {
        this.p_id = p_id;
        this.title = title;
        this.content = content;
        this.code = code;
        this.picture = picture;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }

   

    public Posts() {   //default constructor
    }

    public Posts(String title, String content, String code, String picture, Timestamp date, int catId, int userId) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.picture = picture;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }
    
     //since the values are private...they cannot be accessed outside the claass
    //so, we use getters and setters

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    
    
    
    
   
}

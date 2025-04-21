/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.util.List;

/**
 *
 * @author Anjali Singh
 */
public class Like {
    
    private int lid;
    private int pid;
    private int uid;

    public Like(int lid, int pid, int uid) {
        this.lid = lid;
        this.pid = pid;
        this.uid = uid;
    }

    public Like() {
    }
    
   

   

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }
    
    
}

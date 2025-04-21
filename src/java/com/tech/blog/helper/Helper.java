/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;


public class Helper {
    
    
    public  static boolean deleteFile(String path){
        boolean f=false;
         
        try{
            
          File file=new File(path);  //File ka object bnaenge
          //file --path ko as a file represent karega
          
           //to delete file
           
           f=file.delete();  //deletes the file as well as directory and return true if the file is deleted
           
            
        }catch(Exception e){
            e.printStackTrace();
        }
                
                
                
                return f;
    }
    
    public static  boolean saveFile(InputStream is, String path){
        
        boolean f=false;
        
        try{
            
            //byte type ka array bna lenge ...iski size hm pta krenge by is.available
            byte b[]=new byte[is.available()];
            
            is.read(b);   //this reads data from is
            
            //to write data on out path
            
            FileOutputStream fos=new FileOutputStream(path);
            
            fos.write(b);
            
            fos.flush();
            fos.close();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
}

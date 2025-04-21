//is class me wo functionalities hongi jo database se interact kr rhi hai
//dao me aise function hoga jo database me values enter/insert karega
package com.tech.blog.dao;

import com.tech.blog.entities.*;
import java.sql.*;
public class UserDao {   //to use this class iska object bnana hoga with the help of a constructor
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to database
    
    public boolean saveUser(User user){    //agar is method ne true return kar diya iska mtlb query databse me pahuch chuka hai
        //user ki values user class se lenge 
          boolean f=false;     
        try{
            //yaha pe code krna so that user ki values database me pahuch jaye
            // user ---> Database
          
            String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
           //prepared statement ka object get krenge con ki help se
           PreparedStatement pstmt= this.con.prepareStatement(query);  //pstmt ki help se ? ki values set krenge
           //using the object created by getter 
           pstmt.setString(1,user.getName());
           pstmt.setString(2,user.getEmail());
           pstmt.setString(3,user.getPassword());
           pstmt.setString(4,user.getGender());
           pstmt.setString(5,user.getAbout());
          
           //to execute query
           pstmt.executeUpdate(); 
           f=true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    //get user by useremail and user password-- this returns the user and password
   //jb is email aur password ke user ko call karege ...to ye method return hoga jisme user ka poora data stored hai
    public User getUserByEmailandPassword(String email, String password){
        User user=null;   //blank object
        try{
            //fetch data from database
            
            String query="select * from user where email=? and password=?";
                    //in ? ki values milegi from prepared Statement
                    
                    PreparedStatement pstmt=con.prepareStatement(query);  //prepare statement ka object bna dega with the help of this query
                      pstmt.setString(1, email);
                      pstmt.setString(2, password);
                      
                    ResultSet set=pstmt.executeQuery();     //  data result set ke form me aa jaega
                 //since hm ek hi user expect kr rhe hai
                 
                  if(set.next()) {   //ek bhi aur row hai to yaha pe saara data extract kr lenge
                       user =new User();    //created new object of user type
                       
                       //data from db
                       String name= set.getString("name");
                       
                       //set to user object
                       user.setName(name);
                       
                       user.setId(set.getInt("id"));
                       user.setEmail(set.getString("email"));
                       user.setPassword(set.getString("password"));
                       user.setGender(set.getString("gender"));
                       user.setAbout(set.getString("about"));
                       user.setDateTime(set.getTimestamp("reg_date"));
                       user.setProfile(set.getString("profile"));
                       
                  }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return user;
        
        
    }
    
    //function to update details in database
    
    public boolean updateUser(User user){
        
        boolean f=false;
        
        try{
            
            String query="update user set name=?, email=? , password=?, gender=?, about=?, profile=? where id=?" ;  //hm id denge to ussi user ka data update hoga jiska hm krna chahte hai
                  
                     PreparedStatement p=con.prepareStatement(query);
                     p.setString(1,user.getName());
                     p.setString(2,user.getEmail());
                     p.setString(3,user.getPassword());
                     p.setString(4,user.getGender());
                     p.setString(5,user.getAbout());
                     p.setString(6,user.getProfile());
                     p.setInt(7, user.getId());
                     
                     p.executeUpdate();
                     
                    f=true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
        
    }
        
    public User getUserByUserId(int UserId){
      
         User user=null;
        try{
       
        String q="select * from user where id=?";
        PreparedStatement p=this.con.prepareStatement(q);
        
        p.setInt(1,UserId);
        ResultSet set=p.executeQuery();
        
        if(set.next()){
            
            
                 user =new User();    //created new object of user type
                       
                       //data from db
                     
                       
                    
                       
                       
                       
                       user.setId(set.getInt("id"));
                       user.setName(set.getString("name"));
                       user.setEmail(set.getString("email"));
                       user.setPassword(set.getString("password"));
                       user.setGender(set.getString("gender"));
                       user.setAbout(set.getString("about"));
                       user.setDateTime(set.getTimestamp("reg_date"));
                       user.setProfile(set.getString("profile"));
                       
            
            
            
            
        }
        
      
    } catch(Exception e){
        e.printStackTrace();
    }
        
    return user;  
}
}
// connects the project to the database
package com.tech.blog.helper;

import java.sql.*;
public class ConnectionProvider {
    
    private static Connection con;
    public static Connection  getConnection(){
        try{
            
            if(con==null) {//it will only load agar connection abhi nhi bna hai...agar connection bna hai to driver load nhi hoga
            //load the driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            //create a connection 
            
           
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","Anjali");
            }
          
            
        }
        catch(Exception e){
            e.printStackTrace();
            
        }
        return con;
    }
}

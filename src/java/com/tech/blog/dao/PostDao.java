
package com.tech.blog.dao;


import com.tech.blog.entities.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
   
    
    //isme ek method bnaenge jo db se saari categories ko fetch krega
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Categories> getCategories(){
        
        ArrayList<Categories> list = new ArrayList<>();  //object of list of ArrayList type is screated
 
        try{
            
            String query="select * from categories";
            
            Statement stmt=this.con.createStatement();  //to fire query
            
            ResultSet set=stmt.executeQuery(query);  //to execute query
            
            //fetch data
            
            while(set.next()){        //jb tk next row hai tn tk data fetch hoga
                int cid=set.getInt("c_id");
                String name=set.getString("name");
                String description =set.getString("c_desc");
                
                Categories c=new Categories(cid, name,description);
                
                //harr row ka data aaega ..ek category bnta jaega..uska object add hote jaenge
                //harr ek object ke paas  us category ka id hog , name hoga, description hoga
                list.add(c);
            }
            
        }
        catch(Exception e ){
            e.printStackTrace();
        }
        
        

  return list;
    }
    


//this method save the content of form in database

    
  public boolean savePost(Posts p){
       boolean f=false;   //default value if the data is not inserted this is returned
      
       
       try{
           
           String query="insert into posts(title,content,code,picture,catId,userID) values(?,?,?,?,?,?)";
           
           PreparedStatement pstmt=con.prepareStatement(query);
           
              pstmt.setString(1,p.getTitle());
              pstmt.setString(2,p.getContent());
              pstmt.setString(3,p.getCode());
              pstmt.setString(4,p.getPicture());
              pstmt.setInt(5,p.getCatId());
              pstmt.setInt(6,p.getUserId());
              
                  pstmt.executeUpdate();
                    f=true;
           
       }
       catch(Exception e){
           e.printStackTrace();
       }


return f;
}
  
  public List<Posts> getAllPosts(){       //returns a list where all the post are stored
      
       List<Posts> list=new ArrayList<>();   //List interface hai toh hm list ka object to bna nhi skte hai..so hm uske child class ka object bnaenge
      
       //fetch all the posts
       try{
           
           PreparedStatement p=con.prepareStatement("select * from posts order by p_id Desc");
           
           ResultSet set=p.executeQuery();
           
           while(set.next()){
               
               //row ki values fetch kar lenge
               
               
                int p_id=set.getInt("p_id");
                String pTitle=set.getString("title");
                String pContent=set.getString("content");
                String pCode=set.getString("code");
                String ppic=set.getString("picture");
                Timestamp date=set.getTimestamp("date");
                int catid=set.getInt("catId");
                int userid=set.getInt("userId");
                
                Posts p1=new Posts(p_id, pTitle, pContent, pCode, ppic, date, catid, userid);
                
                list.add(p1); //ek ek post ki detail list me add hoti jaegi ...aur phir ye list return ho jaegi
               
           }
       }
       catch(Exception e){
           e.printStackTrace();
       }
      
       return list;
      
  }

  //it takes category id ..it returns only the post jiski category id hm ise denge
  //ye un saare post ki list bnake dega jo category id hm request krenge
  public List<Posts> getPostByCatId(int catID){  
        
      //creating object of list
      
      List<Posts> list= new ArrayList<>();
      
      
      //fetch all post by id
      
      try{
           
           PreparedStatement p=con.prepareStatement("select * from posts WHERE catId=?");
           
           p.setInt(1,catID);
           ResultSet set=p.executeQuery();
           
           while(set.next()){
               
               //row ki values fetch kar lenge
               
               
                int pid=set.getInt("p_id");
                String pTitle=set.getString("title");
                String pContent=set.getString("content");
                String pCode=set.getString("code");
                String ppic=set.getString("picture");
                Timestamp date=set.getTimestamp("date");
                int userid=set.getInt("userId");
                
                Posts p2=new Posts(pid, pTitle, pContent, pCode, ppic, date, catID, userid);
                
                list.add(p2); 
                             //ek ek post ki detail list me add hoti jaegi ...aur phir ye list return ho jaegi
               
           }
       }
       catch(Exception e){
           e.printStackTrace();
       }
      return list;
  } 
  
  
  public Posts getPostByPostId(int PostID){  
        
  Posts post=null;  //agar koi post nhi milega to null return karega
  String q="select * from posts WHERE p_Id=?";
     
      
      try{
           
           PreparedStatement p=con.prepareStatement(q);
           
           p.setInt(1,PostID);
           
           ResultSet set=p.executeQuery();
           
           if(set.next()){
               
               
               int pid=set.getInt("p_id");
                String pTitle=set.getString("title");
                String pContent=set.getString("content");
                String pCode=set.getString("code");
                String ppic=set.getString("picture");
                Timestamp date=set.getTimestamp("date");
                 int cid=set.getInt("catId");
                int userid=set.getInt("userId");
                
               post=new Posts(pid, pTitle, pContent, pCode, ppic, date, cid, userid);
                //object ke andar saara detail aa jaega
             
           }
           
          
       }
       catch(Exception e){
           e.printStackTrace();
       }
      
      return post;
}
}

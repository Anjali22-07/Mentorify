

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Mentorify.com</title>
         <style>
             
            body{
                background:url(images/imags.jfif);
                background-size:cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    
    <body>
        <%@ include file="normal_navbar.jsp" %>
         
        <div class="conrainer-fluid p-0 m-0">
            
            <div class="jumbotron primary-background text-white">
                <div class="container ">
                    <h3 class="container display-3">Welcome to Mentorify<span class="fa fa-mortar-board"></span></h3>   
                
                <p>Welcome to technical blog, world of technology and coding.
                At Mentorify, we are passionate about technology and dedicated to bringing you the latest insights, 
                tutorials, and trends from the tech world.
                Whether you're a seasoned developer, a tech enthusiast, or a curious learner, our blog is designed to provide valuable content that caters to all levels of expertise.
                </p>
                <a href="register_page.jsp"class="btn btn-outline-light btn-lg">start! it's free <span class="fa fa-user-plus"></span></a>
                <a href="login.jsp" class="btn btn-outline-light btn-lg">Login <span class="fa fa-user-circle-o fa-spin"></span></a>
                </div>
            </div>
          
            <br><!-- comment -->
                
        </div>
       
                          
                              <div class="container ">
                                  <div class="row">              
                                      <div class="col-md-9"><!<!-- ek row me 12 grid hoti hai .. to 4 column bnenge with 3 rows -->
                   
                          <%
                            PostDao d=new PostDao(ConnectionProvider.getConnection());
                               List<Posts> list2=d.getAllPosts();
                               
                              for(Posts cc:list2){
                              %>
                               <div class="card" >
                             <div class="card-header primary-background text-white">
                            <div>
                                 <h5 class="card-title"><%= cc.getTitle() %></h5>
                            </div>
                            <div>
                            <img class="card-img-top" src="blog/<%= cc.getPicture() %>" alt="Card image cap">
                        </div>
                        </div>
                        <div class="card-body">
                        <p class="card-text"><%= cc.getContent()%></p>
                          <a href="#"  class="btn primary-background text-white">Explore Course</a>
                        </div>
                          <div class="card-footer primary-background  text-center">
                    <div class="u_date">
                     <p class="post-date"> <%= DateFormat.getDateTimeInstance().format(cc.getDate()) %></p>
                    </div>
                      </div>
                   <% 
                       }
                   %>
                    
           
            
        <script src="javascript/myjs.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     
         <script>
             //ab this block will work only whne the function is called
             //by default ajax nhi chalega
            function getPosts(catId, temp){   //ye function catId as a parameter lega
                 //ye whii post return karega jis category id ko yaha pass karenge
                 //temp is a refernce to the link we have created
                $("#loader").show();
                 $("#post-cfontainer").hide();
                 
                 $(".c-link").removeClass('active')    //this will remove the blue color which denotes the active link from the category table jisme bhi class c-link hogi
                 
                 $.ajax({
                    url: "load_post.jsp",  //br deafult method get ho jaega
                    data: {cid : catId},   //cid is key and value is catId
                     success: function (data, textStatus, jqXHR){
                          
                         $('#loader').hide();
                         $('#post-container').show(data);  //ye load_post page se aa rha hai
                         $('#post-container').html(data);  //ye load_post page se aa rha hai
                         //jo bhi load_post pe hoga ...this will show it on profile page
                         $(temp).addClass('active')   //jispe click krenge ussi pe blue colour ho jaega
                     }
                     
                     
                     
                 });
             }
             $(document).ready(function(e){
                 
                //ref here is all post wali button ka reference
                //yaha pe hm nikaalenge all the elements jiski class c-link hai
                 let ref=$('.c-link')[0];  //0th pos pe jo element hai wo return hoga
                  getPosts(0,ref);
                  //passing 0 to the getPosts jisse wo saare post load kr dega and show krega on the profile page
                  //because when user jusr logged in.. they have not selected any category
                 
                 
             });
            
        </script>     
        
    </body>
</html>

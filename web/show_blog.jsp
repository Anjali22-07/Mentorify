<%-- 
    Document   : show_blog.jsp
    Created on : Jul 15, 2024, 3:00:26 AM
    Author     : Anjali Singh
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="errorPage.jsp"%>
        
<%
    
    //validating-- if the user is not logged in they will be redirected to the login page
    //jo user session me set kiya hai..ussi user ko fetch krenge
   User user=(User)session.getAttribute("currentUser");   //ye check kar rha hai ki kya session me koi attribute hai current user agra hai tbhi ye further work karega 
     if(user==null){
     response.sendRedirect("login.jsp");
    }
%>
 <%
           int PostId=Integer.parseInt(request.getParameter("post_id")); 
             //fetching all the details of the selected postid
             //we will create a method which will use sql query to fetch data by postid
           

             //quki PostDao ka method call karenge isliye uska object bna lenge
             
                PostDao d=new PostDao(ConnectionProvider.getConnection());
                
                Posts p=d.getPostByPostId(PostId);

        
        
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getTitle() %>||Coding Made Easy</title>
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           
        <style>
            
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user{
                font-size:20px;
                
            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top:15px;
            }
            .img{
                border:5px solid #e2e2e2;
                padding-top:15px;
                
            }
            
            body{
                background : url(images/imags.jfif);
                background-size:cover;
                background-attachment: fixed;
               
            }
            
            </style>
            
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="#"> <span class="fa fa-mortar-board"></span>MENTORIFY</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-keyboard-o"></span>Coding made Easy<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#">About Us<span class="fa fa-users"></span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Categories <span class="fa fa-server"></span>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            
            <%
                            PostDao d1=new PostDao(ConnectionProvider.getConnection());
                               ArrayList<Categories> list1=d1.getCategories();
                               
                              for(Categories cc:list1){
                              %>
                              <!-- jo category id pass ki hai wo hi show hoga -->
                              <a href="#" onclick="getPosts(<%= cc.getcId()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                              <!-- this will send the reference of the current link to the getPosts function-->
                              <%
                                }
                             
                            %>
        </div>
      </li>
      <li class="nav-item">
          <a class="nav-link " href="#"> Contact us <span class="fa fa-phone-square"></span></a>
      </li>
      
     
    </ul>
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
           <a class="nav-link " href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
          </li>
          <li class="nav-item">
           <a class="nav-link " href="LogoutServlet"><span class="fa fa-user"></span>LogOut</a>
           </li>
      </ul>
  </div>
</nav>
          <!-- End of navbar -->
          
          <!-- main content of the body -->    
            
          <div class="container">
              
              <div class="row my-4">
               
                  <div class="col-md-8 offset-md-3">
                      
                      <div class="card">
                          
                          <div class="card-header primary-background text-white">
                              
                              <h4 class="post-title"><%= p.getTitle() %>
                              
                          </div>  
                              <div class="img">
                                <img class="card-img-top img-fluid" src="blog/<%= p.getPicture() %>" alt="Card image cap">
                            </div>
                            
                            
                          
                              <div class="card-body ">
                                  <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <p class="post-user"><a href="#">
                                            <% 
                                                UserDao ud=new UserDao(ConnectionProvider.getConnection());
                                                
                                                
                                            
                                            
                                            %>
                                            <p class="post-user"><a href="#"><%= ud.getUserByUserId(p.getUserId()).getEmail() %></a> Has posted</p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"> <%= DateFormat.getDateTimeInstance().format(p.getDate())%></p>
                                    
                                </div>
                            </div>
                                  
                                  <p class="post-content"><%= p.getContent() %></p>
                                  <br><!-- comment -->
                                  <br><!-- we use pre to write code -->
                                  <div class="post-code">
                                  <pre><%= p.getCode() %></pre>
                                  </div>
                              </div>
                              
                              <div class="card-footer primary-background text-center">
                                   
                        
                        <a href="#" class="btn btn-outline-light  text-white btn-sm"> <span class="fa fa-thumbs-o-up"> 10</span></a>
                        <a href="#" class="btn btn-outline-light   text-white btn-sm"><span class="fa fa-comment"></span></a>
                    </div>
                             
                              
                      </div>
                      
                  </div>
                  
              </div>
          </div>
          
          
          
          
          
          <!-- End of main content of the body -->
          <!-- Profile Model -->
         <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel text-center">Mentorify<span class="fa fa-mortar-board"></span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
          <img src="pics/<%= user.getProfile() %>"  class="img-fluid" style="border-radius:50%; max-width:95px;"/>
         <h5 class="modal-title" id="profile-modal"><%= user.getName() %></h5>
          <div id="profileDetail">
          <table class="table">
               
                <tbody>
                  <tr>
                    <th scope="row">ID</th>
                    <td><%= user.getId()%></td>
                   
                  </tr>
                  <tr>
                    <th scope="row">Email</th>
                    <td><%= user.getEmail()%></td>
                    
                  </tr>
                  <tr>
                    <th scope="row">Gender</th>
                    <td><%= user.getGender()%></td>
                    
                  </tr>
                  <tr>
                    <th scope="row">About</th>
                    <td><%= user.getAbout()%></td>
                    
                  </tr>
                 
                </tbody>
              </table>
          </div>
                
                    <!-- Profile Detail -->
                    
                    <div id="profile_edit" style="display:none;">
                        <h2 class="mt-2">Edit Carefully</h2>
                        <form action="EditServelet" method="post"  enctype="multipart/form-data">   <!--we are using enctype because the data sent also has image -->
                            <table class="table">
                                <tr>
                                    <td>ID:</td>
                                    <td> <%= user.getId() %></td>
                                    
                                </tr>
                                <tr>
                                    <td>Email: </td>
                                    <td><input type="email"  class=form-control name="user_email" value="<%= user.getEmail()%>"> </td>
                                </tr>
                                <tr>
                                    <td>Password: </td>
                                    <td><input type="password"  class=form-control name="user_password" value="<%= user.getPassword()%>"> </td>
                                </tr>
                                <tr>
                                    <td>Gender: </td>
                                    <td><%= user.getGender()%> </td>
                                </tr>
                                <tr>
                                    <td>About:</td>
                                    <td><textarea class="form-control" name="user_about"></textarea></td>
                                </tr>
                                <tr>
                                    <td>New Profile Pic:</td>
                                    <td><input type="file" name="pf" class="form-control">
                                        
                            </table>
                                <div class="container"><!-- comment -->
                                    <button type="submit" id="submt" class="btn btn-outline primary-background text-white">Save</button>
                        </form></div>
                       
                    </div>
                        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
  </div>
 </div>
                                
                                
 <!-- end of profile modal -->
 
 
 


        <script src="javascript/myjs.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
       
        <script>
           $(document).ready(function(){
                //for toggle---logic
                
                let editStatus=false;
                
                
                $('#edit-profile').click(function(){
                    
                    // as soon as you will click the button..by default it will be false
                    if(editStatus == false){
                      $('#profileDetail').hide();
                      
                      
                      $('#profile_edit').show();
                      editStatus=true;
                      $(this).text("Back");   //this is the button here
                  }else          //when you will again click the button ....this block of code will execute
                  {
                      $('#profileDetail').show();
                      
                      
                      $('#profile_edit').hide();
                      editStatus=false;
                      $(this).text("Edit");
                  }
                });
            });
            
           
            
     </script> 
     
     <!-- javascript for post form -->
     
     <script>
         
         $(document).ready(function (e){
             
             //
             $('#add-post-form').on("submit", function(event){
                 //this code gets called when is form is submitted
                 
                 event.preventDefault();  //normal behaviour of form stops 
                 console.log("submitted");
                 
                 
                 let form=new FormData(this);
                 
                 //now requesting to server
                 
                 $.ajax({
                 
                      url: "AddPostServlet",
                      type:'POST',
                      data: form,
                      success: function(data, textStatus, jqXHR){
                          console.log(data);
                          if(data.trim()=='done'){
                              swal("Good job!", "Saved Successfully!", "success");
                          }
                          else{
                               swal("Sorry!", "Something Went Wrong!", "Try Again!");
                          }
                      },
    
                      error: function(jqXHR,textStatus,errorThrown){
                          swal("Sorry!", "Something Went Wrong!", "Try Again!");
                      },
                     processData :false,
                     contentType:false
        
                    });
                     
    
             });
             
         });
         </script>
         <script src="javascript/myjs.js" type="text/javascript"></script>
        
        
        
        
       
        
    </body>
</html>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page errorPage="errorPage.jsp"%>
<%
    
    //validating-- if the user is not logged in they will be redirected to the login page
    //jo user session me set kiya hai..ussi user ko fetch krenge
   User user=(User)session.getAttribute("currentUser");   //ye check kar rha hai ki kya session me koi attribute hai current user agra hai tbhi ye further work karega 
     if(user==null){
     response.sendRedirect("login.jsp");
    }
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
             
            body{
                background:url(images/imags.jfif);
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
                               ArrayList<Categories> list_1=d1.getCategories();
                               
                              for(Categories cc:list_1){
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
      <li class="nav-item">
          <a class="nav-link " href="#" data-toggle="modal" data-target="#post-modal"> Do Post <span class="fa fa-podcast"></span></a>
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
           <!-- end of navbar -->


           <!-- main body of the page -->
           
           <main>
               
               <div class="container">
                   
                   <div class="row mt-4">   <!-- mt-margin top -->
                       
                       <!-- First column for the categories -->
                       <div class="col-md-4">   <!-- md-stands for--medium screen size -->
                      
                           <!-- ALl categories -->
                           
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                            All Categories
                           </a>
                            <!-- since we want categories here -->
                            <%
                            PostDao d=new PostDao(ConnectionProvider.getConnection());
                               ArrayList<Categories> list1=d.getCategories();
                               
                              for(Categories cc:list1){
                              %>
                              <!-- jo category id pass ki hai wo hi show hoga -->
                              <a href="#" onclick="getPosts(<%= cc.getcId()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                              <!-- this will send the reference of the current link to the getPosts function-->
                              <%
                                }
                             
                            %>
                          
                        </div>
                           
                       
                       
                       
                       </div>
                       <!-- Second column -->
                        <div class="col-md-8" >   <!-- md-stands for--medium screen size -->
                            
                            <!-- Posts -->
                            
                            <div class="container text-center" id="loader">
                                <i class=" fa fa-refresh fa-4x fa-spin">
                                </i>
                                <h3 class="mt-2">Loading..</h3>
                            </div>
                                <div class="container-fluid" id="post-container">
                                                               
                               </div>
                            
                            
                            
                            
                       </div>
                       
                   </div>
                   
                   
               </div>
               
           </main>
           
           
           
           
           
<!-- Modal -->
<!-- Button trigger modal -->


<!-- Modal -->
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
 
 
 <!-- start of post modal -->
 <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ADD Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="AddPostServlet" method="post">
              
              <div class="form-group">
                  <select class="form-control" name="cid">
                      
                  <option selected disabled>Select Category</option>
                  <%
                   PostDao pd=new PostDao(ConnectionProvider.getConnection());
                   ArrayList<Categories> list=pd.getCategories();   //saara data arrayList type ke list me store ho jaega

                   for(Categories c:list){
                  %>
                  <option value="<%= c.getcId()%>"><%= c.getName() %></option>
                  <%
                      }
                 %>
              </select>
              </div>
                  
              
              <div class="form-group"><!-- comment -->
                  <input name="PTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
              </div>
              <div class="form-group"><!-- comment -->
                  <textarea name="des" placeholder=" Add Description" style="height:150px" class="form-control"></textarea>
              </div>
              
              <div class="form-group"><!-- comment -->
                  <textarea name ="code1" placeholder="Add Code(if any)" style="height:200px" class="form-control"></textarea>
              </div>
              
              <div class="form-group"
                   <label>Select picture</label><br>
                  <input type="file"  name="pic">
                  
              </div>
              <div class="container text-center" >
        
        <button type="submit" class="btn btn-primary primary-background text-white">Submit</button>
      </div>
          </form>
          
      </div>
      
    </div>
  </div>
</div>



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
         
         <!-- loading post using Ajax -->
         
         <script>
             //ab this block will work only whne the function is called
             //by default ajax nhi chalega
            function getPosts(catId, temp){   //ye function catId as a parameter lega
                 //ye whii post return karega jis category id ko yaha pass karenge
                 //temp is a refernce to the link we have created
                $("#loader").show();
                 $("#post-cfontainer").hide();
                 
                 $(".c-link").removeClass('active');    //this will remove the blue color which denotes the active link from the category table jisme bhi class c-link hogi
                 
                 $.ajax({
                    url: "load_post.jsp",  //br deafult method get ho jaega
                    data: {cid : catId},   //cid is key and value is catId
                     success: function (data, textStatus, jqXHR){
                          
                         $('#loader').hide();
                         $('#post-container').show(data);  //ye load_post page se aa rha hai
                         $('#post-container').html(data);  //ye load_post page se aa rha hai
                         //jo bhi load_post pe hoga ...this will show it on profile page
                         $(temp).addClass('active');   //jispe click krenge ussi pe blue colour ho jaega
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

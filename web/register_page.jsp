

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
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
         <%@ include file ="normal_navbar.jsp"%>
         <main class="d-flex align-items-center " style="height:120vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <h3>SIGN UP!</h3>
                            </div>
                            <div class="card-body">
                               <form  id= "reg_form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                  <label for="user_name">Username</label>
                                  <input name="user_name"type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                                 
                                </div>
                                <div class="form-group">
                                  <label for="e_mail">Email address</label>
                                  <input name="user_mail" type="email" class="form-control" id="Email1" aria-describedby="emailHelp" placeholder="Enter email">
                                 
                                </div>
                                <div class="form-group">
                                  <label for="Pass_word">Password</label>
                                  <input  name="pass_word"type="password" class="form-control" id="Password1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label><br>
                                  <input type="radio" id="gender" name="gender" value="Male">Male
                                  <input type="radio" id="gender" name="gender" value="Female">Female  
                                </div>
                                   <div class="form-group">
                                       
                                       <textarea name="about" class="form-control" id="text_area" cols="7" rows="3" placeholder="Enter something about yourself"></textarea>
                                  </div>                           
                                   
                                    <div class="form-check">
                                  <input name="check_box" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Terms and Conditions</label>
                                </div>
                               
                                  
                                   <div class="container text-center" id="loader" style="display:none;">
                                   <span class="fa fa-refresh fa-spin fa-3x"></span>
                                   <h4>Please wait..</h4>
                                   </div>
                                   <br>                                 
                                   
                                <button id="sbmit" type="submit" class="btn btn-primary">Submit</button>
                              </form>
                               
                            </div>
                            <div class="footer">
                                
                                
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
         </main>
        
        
        
        
         <script src="javascript/myjs.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script>
            
            
            $(document).ready(function(){
                console.log("loaded....");
                
                $('#reg_form').on('submit',function (event){
                    event.preventDefault();  
                    //this will prevent the control to go to the servlet 
                       
                       //we will store the data from the form in the form object
                       
                       let form =new FormData(this);
                        $("#sbmit").hide();
                        $("#loader").show();
                       
                       
                       //send register servlet
                       
                       $.ajax({
                           
                           url: "RegisterServlet",
                           type: 'POST',
                           data:  form,
                           success: function(data, textStatus, jqXHR){
                               console.log(data);
                               $("#sbmit").show();
                                $("#loader").hide();
                                if(data.trim() === 'Done!!'){
                                      swal("Good job!", "You are Registered!", "success")
                                       .then((value)=>{
                                           window.location="login.jsp"
                    
                                      });
                                    }
                                    else
                                        {
                                            swal(data);
                                        }
                                },
                      
                           error: function(jqXHR, textStatus, errorThrown){
                               console.log(jqXHR)    
                               $("#sbmit").show();
                                $("#loader").hide();
                                 swal("sorry!", "some Error Occurred!", "Failed")
                                     .then((value)=>{
                                           window.location="register_page.jsp"
                    
                                            });
                               
                           },
                           processData: false,
                           contentType: false
                                   
                           
                         
            });
                    
                });
            });
      </script>
            
            
            
            
    </body>
</html>

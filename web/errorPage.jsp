
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>   <!-- we use this to handle error page -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry!Something Went Wrong</title>
         <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
   </head>
    <body>
        <div class="container text-center">
            <img src="images/computer.png" class="img-fluid " alt="error"/>   <!-- we use class=img-fluid to make it responsive -->
            <h3 class="display-3">Sorry!Something went Wrong</h3>
            <%= //this page will work when there will be an exception
                exception %>
            <a href="index.jsp" class="btn primary-background btn-large text-white  mt-3">HOME</a>  <!-- here mt= margin top -->
        </div>
            
            
    </body>
</html>

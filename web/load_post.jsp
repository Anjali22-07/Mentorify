

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<html>
    <head>
        <style>
            .u_date{
                 font-style: italic;
                font-weight: bold;
}
            </style>
            
    </head>

<div class="row">
    
    <%  
        Thread.sleep(300);

     PostDao d=new PostDao(ConnectionProvider.getConnection());
     String cidp=request.getParameter("cid");
     int cid=Integer.parseInt(cidp);
     
    
     
       
        
        List<Posts> post=new ArrayList<>();  
     
      //since list is a interface its object is created using child Class
     
     
        if(cid==0){
               
             post=d.getAllPosts();
             
                }
                else{
                post=d.getPostByCatId(cid);
                 
                    
             }

       if(post.size()==0){
          out.println("<h3 class='display-2  text-center text-white'>No Post in this Category</h3>"); //double quotes ke andar single quotes 
           return;
        }
        
        for(Posts p: post){
        
        %>
        
        <div class="col-md-6"> 
            
            <div class="card">
                
                <div class="card-header primary-background text-white">
                    <b><%= p.getTitle() %></b>
                </div>
                <div>
                    <img class="card-img-top" src="blog/<%= p.getPicture() %>" alt="Card image cap">
                </div>
                <div class="card-body">
                    
                    <p><%= p.getContent() %></p><!-- comment -->
                  
                  
                    </div>
                    <div class="card-footer primary-background  text-center">
                    <div class="u_date">
                     <p class="post-date"> <%= DateFormat.getDateTimeInstance().format(p.getDate()) %></p>
                    </div>
                        <a href="show_blog.jsp?post_id=<%= p.getP_id()%>" class="btn btn-outline-light  text-white btn-sm ">Read More</a>
                        <!-- jis post pe click kr rhe hai uss post ki id(db) se le jaani hai to the show_blog page -->
                        <!-- we will do it by using url Rewriting -->
                        <a href="#" class="btn btn-outline-light  text-white btn-sm"> <span class="fa fa-thumbs-o-up"> 10</span></a>
                        <a href="#" class="btn btn-outline-light   text-white btn-sm"><span class="fa fa-comment"></span></a>
                    </div>
                
            </div>
        
        
        </div>
        
        
<%
                }

 
    
    %>
</div>
</html>
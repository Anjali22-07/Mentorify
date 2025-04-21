<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
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
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
                            <script src="javascript/myjs.js" type="text/javascript"></script>


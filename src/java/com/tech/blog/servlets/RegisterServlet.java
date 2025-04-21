
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anjali Singh
 */
@MultipartConfig        //to accept all type of data even images
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
           
            
            //fetch all form data
            
            String check= request.getParameter("check_box");
            if(check==null){
                out.println("box not checked");
            }
            else  {
               //baki ka data yaha nikalna hai
               String name=request.getParameter("user_name");
               String email=request.getParameter("user_mail");
               String password=request.getParameter("pass_word");
               String gender=request.getParameter("gender");
               String about=request.getParameter("about");
               //create user object and set all data to the object
               User user=new User(name,email,password,gender,about);
               
               //insert into databse-- jiska code hm userdao me already likh chuke hai
               //yaha pe hm userdao ka object create krenge
               
               UserDao dao=new UserDao(ConnectionProvider.getConnection());
               //to save data--saara data direct nhi paas kr skte isliye user object create krenge
              if(dao.saveUser(user)){
                  
                  //saved
                  out.println("Done!!");
              }
              else{
                  out.println("Error!!");
              }
               
               
               
            }

            
            
            
            
            
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
